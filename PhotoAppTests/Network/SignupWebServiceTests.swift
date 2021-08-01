//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Admin on 07/07/2021.
//

import XCTest
@testable import PhotoApp

class SignupWebServiceTests: XCTestCase {

    var sut: SignupWebService!
    var signupFormModel: SignupFormRequestModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        sut = SignupWebService(urlString: SignupConstants.signupURLString, urlSession: urlSession)
        signupFormModel = SignupFormRequestModel(firstName: "Chris", lastName: "Morrison", email: "test@gmail.com", password: "12345678")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        signupFormModel = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }
    
    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnsSuccess(){
        //Arrange
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        //Act
        sut.signup(withForm: signupFormModel){ result in
            switch result{
            case .success(let signupResponseModel):
                XCTAssertEqual(signupResponseModel.status, "ok")
            case .failure(_):
                break
            }
            //Assert
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace(){
        //Arrange
        let jsonString = "{\"path\":\"/Users\",\"error\":\"Internal Server Error\" }"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup() method Expectation for a response that contains a different JSON structure")
        //Act
        sut.signup(withForm: signupFormModel){ result in
            switch result{
            case .success(let signupResponseModel):
                XCTAssertNil(signupResponseModel, "The Response model for a request containing unknown JSON response, should have been nil")
                
            case .failure(let error):
                XCTAssertEqual(error, SignupError.invalidResponseModel, "The signup model did not return expected error")
            }
            //Assert
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenEmptyURLStringProvided_ErrorTookPlace(){
        //Arrange
        let expectation = self.expectation(description: "An empty request URL string expectation")
        
        sut = SignupWebService(urlString: "")
        //Act
        sut.signup(withForm: signupFormModel) { result in
            switch result{
            case.success(let reponseModel):
                XCTAssertNil(reponseModel, "the Signup() method did not return expected error for an invalidRequestURLString error")
            case.failure(let error):
                XCTAssertEqual(error, SignupError.invalidRequestURLString, "when an invalidRequestURLString take place, the response model must be nil")
            }
            
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
//    func testingSignupWebService_WhenURLRequestFails_ReturnsErrorMessageDescription(){
//        // Arrange
//        let expectation = self.expectation(description: "A failed Request expectation")
//        let errorDescription = "A localized description of an error"
//        MockURLProtocol.error = SignupError.failedRequest(description:errorDescription)
//
//        //Act
//        sut.signup(withForm: signupFormModel) { result in
//            switch result{
//            case .success(_):
//                break
//            case.failure(let error):
//                //Assert
//                XCTAssertEqual(error, SignupError.failedRequest(description:errorDescription), "The signup() method did not return an expecter error for the Failed Request")
//            }
//            expectation.fulfill()
//        }
//        self.wait(for: [expectation], timeout: 2)
//        //Assert
//    }
}
