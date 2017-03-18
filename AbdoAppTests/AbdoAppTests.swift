//
//  AbdoAppTests.swift
//  AbdoAppTests
//
//  Created by GOD on 12/03/2017.
//  Copyright © 2017 GOD. All rights reserved.
//

import XCTest
import Alamofire
import SwiftyJSON
@testable import AbdoApp

class AbdoAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
 
    func testChild()
    {
        let myTestingChild = Child()
        myTestingChild.childInfo.name = "Abdo"
        myTestingChild.shareCode.CreateShareCode()
        API().shareCode.Set(child: myTestingChild)
        print("testing finnished")
    }
    
    func testApi()
    {
        Alamofire.request("http://abdoapi.azurewebsites.net/api/values").responseJSON { response in
            let json = JSON(response.result)
            print("JSON: \(json)")
        }
    }
    
    func testAlamofireGet()
    {
        let urlString = "http://abdoapi.azurewebsites.net/api/values/"
        
        // When
        let request = Alamofire.request(urlString)
        
        // Then
        XCTAssertNotNil(request.request)
        XCTAssertEqual(request.request?.httpMethod, "GET")
        XCTAssertEqual(request.request?.url?.absoluteString, urlString)
        XCTAssertNil(request.response)
    }
    
    func testRegistration()
    {
        let child1 : Child = Child()
        child1.childInfo.name = "Rasmus"
        child1.shareCode.CreateShareCode()
        child1.allergies.append(ChildAllergy())
        child1.registrations.append(Registration())
        print("\(child1.childInfo.name) sharecode \(child1.shareCode.code)")
    }
    
    func testSingleton()
    {
        let childArray = DataContainerSingleton.sharedDataContainer.child
        print("\(childArray?.count)")
        var newChild = Child()
        newChild.childInfo.name = "Rasmus"
        DataContainerSingleton.sharedDataContainer.child?.append(newChild)
        print("\(childArray?.count)")
        
    }
}
