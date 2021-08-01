//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by Admin on 07/07/2021.
//

import Foundation
struct SignupFormRequestModel: Encodable{
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
