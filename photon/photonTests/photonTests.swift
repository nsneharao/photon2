//
//  photonTests.swift
//  photonTests
//
//  Created by Sneha Nemaragomula on 3/3/17.
//  Copyright © 2017 Sneha Nemaragomula. All rights reserved.
//

import XCTest
@testable import photon

class photonTests: XCTestCase {
    var vc: ViewController?
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        vc = storyboard.instantiateInitialViewController() as? ViewController

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func Matric(matrix : [[String]] , sucessBool : Bool , count : Int) {
      let result =   vc?.findPath(matrix)
        print(result)
        XCTAssert((result?.sucess)! == sucessBool)
        XCTAssert((result?.Cost)! == count)
        
    }
    
    func testMatric5x6 (){
        let A =   [ ["3" ,"4" ,"1", "2", "8", "6"],
                    ["6", "1", "8" ,"2" ,"7", "4"],
                    ["5", "9" ,"3" ,"9" ,"9", "5"],
                    ["8", "4", "1", "3", "2", "6"],
                    ["3", "7", "2", "8", "6", "4"]
        ]
        Matric(A, sucessBool: true, count: 16)
    }
    
    func testMatric6X6(){
        let A = [["19", "10", "19", "10", "19"],
                 ["21", "23", "20", "19", "12"],
                 ["20", "12", "20", "11", "10"]]
        Matric(A, sucessBool: false, count: 48)

    }
  
    func testMatri1X5(){
       let A = [["5","8","5","3","5"]]
        Matric(A, sucessBool: true, count: 26)
    }
    
    func testMatri5X1(){
        let A = [["5"],
                 ["8"],
                 ["5"],
                 ["3"],
                 ["5"]]
        Matric(A, sucessBool: true, count: 5)
    }
    
    func testMatricOther() {
        let A = [["69", "10", "19", "10", "19"],
                ["51", "23", "20", "19", "12"],
               ["60", "12", "20", "11", "10"]]
        Matric(A, sucessBool: false, count: 69)

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
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
