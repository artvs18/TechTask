//
//  String + Extension.swift
//  TechTask
//
//  Created by Artemy Volkov on 16.03.2023.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[0-9A-Za-z._%+-]+@[a-z0-9.-]+\\.[a-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: self)
    }
    
    func isValidName() -> Bool {
        let nameRegEx = "^[a-zA-Z\\p{Cyrillic}]+$"
        let namePredicate = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
        return namePredicate.evaluate(with: self)
    }
    
    func moneyFormatter() -> String {
        let number = Double(self) ?? 0
        return number.formatted(.currency(code: "USD").locale(Locale(identifier: "us-US")))
    }
}
