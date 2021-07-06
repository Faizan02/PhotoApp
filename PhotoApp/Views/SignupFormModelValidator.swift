//
//  SignFormModelValidator.swift
//  PhotoApp
//
//  Created by Admin on 06/07/2021.
//

import Foundation

class SignupFormModelValidator{
    
    /// Validates the firstname of the user
    /// - Parameter firstName: firstName to be validated
    /// - Returns: returns boolen value true if firstname is valid else returns false
    func isFirstNameValid(firstName: String) -> Bool{
        if firstName.count < SignupConstants.minimumFirstNameCharLength{
            return false
        }
        if firstName.count > SignupConstants.maximumFirstNameCharLength{
            return false
        }
        return true
    }
    
    /// Validates the lastName of the user
    /// - Parameter lastName: lastName to be validated
    /// - Returns: returns boolen value true if lastName is valid else returns false
    func isLastNameValid(lastName: String) -> Bool{
        if lastName.count < SignupConstants.minimumLastNameCharLength{
            return false
        }
        if lastName.count > SignupConstants.maximumLastNameCharLength{
            return false
        }
        return true
    }
    
    /// Validates the email provided by the user
    /// - Parameter email: email to be validated
    /// - Returns: returns boolen value true if email is valid else returns false
    func isEmailValid(email: String)-> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    /// Validates Password provided by the user
    /// - Parameter password: password to be validated
    /// - Returns: returns boolen value true if password is valid else returns false
    func isPasswordValid(password: String) -> Bool{
        if password.count < SignupConstants.passwordMinimumCharLenght{
            return false
        }
        if password.count > SignupConstants.passwordMaximumCharLength{
            return false
        }
        return true
    }
    
    /// Validates whether passwords match or not
    /// - Parameters:
    ///   - password: password provided by user
    ///   - repeatPassword: repeat password provided by user
    /// - Returns: returns boolen value true if passwords match else returns false
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool{
        if password != repeatPassword{
            return false
        }
        return true
    }
}
