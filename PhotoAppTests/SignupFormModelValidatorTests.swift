//
//  SignupFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Admin on 05/07/2021.
//

import XCTest
@testable import PhotoApp

class SignupFormModelValidatorTests: XCTestCase {

    var sut: SignupFormModelValidator!
    override func setUp() {
        sut = SignupFormModelValidator()
    }
    override func tearDown() {
        sut = nil
    }

    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue(){
        //Arrange
        let firstName = "Chris"
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: firstName)
        //Assert
        XCTAssertTrue(isFirstNameValid,"The isFirstNameValid() should have return TRUE for a valid first name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse(){
        //Arrange
        let firstName = "Ch"
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: firstName)
        //Assert
        XCTAssertFalse(isFirstNameValid,"The isFirstNameValid() should have return FALSE for a first name that is shorter than \(SignupConstants.minimumFirstNameCharLength) characters but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse(){
        //Arrange
        let firstName = "ChirsChirsChirs"
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: firstName)
        //Assert
        XCTAssertFalse(isFirstNameValid,"The isFirstNameValid() should have return FALSE for a first name that is longer than \(SignupConstants.maximumFirstNameCharLength) characters but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue(){
        //Arrange
        let lastName = "Morrison"
        //Act
        let isLastNameValid = sut.isLastNameValid(lastName: lastName)
        //Assert
        XCTAssertTrue(isLastNameValid,"The isLastNameValid() should return TRUE for a valid last name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse(){
        //Arrange
        let lastName = "Mo"
        //Act
        let isLastNameValid = sut.isLastNameValid(lastName: lastName)
        //Assert
        XCTAssertFalse(isLastNameValid,"The isLastNameValid() should have return FALSE for a last name that is shorter than \(SignupConstants.minimumLastNameCharLength) characters but returned TRUE")
    }
    func testSignupFormModelValidator_WhenTooLongLastNameProvided_ShouldRetrunFalse(){
        //Arrange
        let lastName = "MorrisonMorrison"
        //Act
        let isLastNameValid = sut.isLastNameValid(lastName: lastName)
        //Assert
        XCTAssertFalse(isLastNameValid,"The isLastNameValid() should have return FALSE for a last name that is longer than \(SignupConstants.maximumLastNameCharLength) charaters but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue(){
        //Arrange
        let email = "chris@gmail.con"
        //Act
        let isEmailValid = sut.isEmailValid(email: email)
        //Assert
        XCTAssertTrue(isEmailValid, "The isEmailValid() should return TRUE for a valid email but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenInvalidEmailProvided_ShouldReturnFalse(){
        //Arrange
        let email = "chirsgmail.com"
        //Act
        let isEmailValid = sut.isEmailValid(email: email)
        //Assert
        XCTAssertFalse(isEmailValid,"The isEmailValid() should return False for a invalid email but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenValidPasswordProvided_ShouldReturnTrue(){
        //Arrange
        let password = "12345678"
        //Act
        let isPasswordValid = sut.isPasswordValid(password: password)
        //Assert
        XCTAssertTrue(isPasswordValid, "The isPasswordValid() should return TRUE for a valid password but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse(){
        //Arrange
        let password = "12345"
        //Act
        let isPasswordValid = sut.isPasswordValid(password: password)
        //Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should return False for a password that is shorter than \(SignupConstants.passwordMinimumCharLenght) characters but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse(){
        //Arrange
        let password = "12345"
        //Act
        let isPasswordValid = sut.isPasswordValid(password: password)
        //Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should return False for a password that is longer than \(SignupConstants.passwordMaximumCharLength) characters but returned FALSE")
    }
    func testSignupFormModelValidator_WhenMatchedPasswordsProvided_ShouldReturnTrue(){
        //Arrange
        let password = "test1234"
        let repeatPassword = "test1234"
        //Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: password,repeatPassword: repeatPassword)
        //Assert
        XCTAssertTrue(doPasswordsMatch, "The doPasswordsMatch() should return TRUE for matching passwords but returned FALSE")
    }
    func testSignupFormModelValidator_WhenNotMatchedPasswordsProvided_ShouldReturnFalse(){
        //Arrange
        let password = "test1234"
        let repeatPassword = "test12"
        //Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: password,repeatPassword: repeatPassword)
        //Assert
        XCTAssertFalse(doPasswordsMatch, "The doPasswordsMatch() should return False for not matching passwords but returned TRUE")
    }
}
