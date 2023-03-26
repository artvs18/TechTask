//
//  SignInViewModel.swift
//  TechTask
//
//  Created by Artemy Volkov on 16.03.2023.
//

import SwiftUI
import CoreData
import Combine

final class SignInViewModel: ObservableObject {
    @AppStorage("currentUser") private(set) var currentUser: String?
    @AppStorage("isLoggedIn") private(set) var isLoggedIn = false
    
    @Published var canSubmit = false
    @Published var showAlert = false
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var password = ""
    
    @Published private var isValidFirstName = false
    @Published private var isValidLastName = false
    @Published private var isValidEmail = false
    @Published private var isValidPassword = false
    
    @Published private(set) var messageAlert = ""
    @Published private(set) var titleAlert = ""
    
    // MARK: - Text Field Prompt
    var firstNamePrompt: String? {
        isValidFirstName || firstName.isEmpty ? nil : "Enter a letter value"
    }
    
    var lastNamePrompt: String? {
        isValidLastName || lastName.isEmpty ? nil : "Enter a letter value"
    }
    
    var emailPrompt: String? {
        isValidEmail || email.isEmpty ? nil : "Enter valid Email. Example: test@test.com"
    }
    
    // MARK: - CoreData View Context
    private let context = PersistenceController.shared.container.viewContext
    
    private var validationCancellables: Set<AnyCancellable> = []
    
    // MARK: - Text Filed Validation
    init() {
        $firstName
            .map { $0.isValidName() }
            .assign(to: \.isValidFirstName, on: self)
            .store(in: &validationCancellables)
        
        $lastName
            .map { $0.isValidName() }
            .assign(to: \.isValidLastName, on: self)
            .store(in: &validationCancellables)
        
        $email
            .map { $0.isValidEmail() }
            .assign(to: \.isValidEmail, on: self)
            .store(in: &validationCancellables)
        
        Publishers.CombineLatest3($isValidFirstName, $isValidLastName, $isValidEmail)
            .map { $0 && $1 && $2 }
            .assign(to: \.canSubmit, on: self)
            .store(in: &validationCancellables)
    }
}

extension SignInViewModel {
    // MARK: - Log in
    func logIn() {
        let predicate = NSPredicate(format: "firstName = %@", firstName)
        let request = NSFetchRequest<User>(entityName: "User")
        request.predicate = predicate
        
        do {
            let results = try context.fetch(request)
            
            if results.count > 0 {
                let user = results.first!
                
                if user.firstName == firstName && user.password == password {
                    currentUser = user.firstName! + " " + user.lastName!
                    isLoggedIn = true
                } else {
                    titleAlert = "Wrong password"
                    messageAlert = "Check your credentials"
                    showAlert = true
                    return
                }
            } else {
                titleAlert = "Such a user is not registered"
                messageAlert = "Check login and password"
                showAlert = true
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Register
    func register() {
        let request = NSFetchRequest<User>(entityName: "User")
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
            NSPredicate(format: "firstName = %@", firstName),
            NSPredicate(format: "lastName = %@", lastName),
            NSPredicate(format: "email = %@", email)
        ])
        
        do {
            let results = try context.fetch(request)
            
            if results.count > 0 {
                titleAlert = "The user is already registered"
                messageAlert = "Log in instead"
                showAlert = true
            } else {
                let user = User(context: context)
                user.firstName = firstName
                user.lastName = lastName
                user.email = email.lowercased()
                PersistenceController.shared.save()
                
                currentUser = firstName + " " + lastName
                isLoggedIn = true
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Log out
    func logOut() { isLoggedIn = false }
    
    func clearFields() {
        firstName = ""
        lastName = ""
        email = ""
        password = ""
    }
}
