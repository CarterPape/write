//
//  writeTests.swift
//  writeTests
//
//  Created by Carter Pape on 6/22/18.
//  Copyright © 2018 Carter Pape. All rights reserved.
//

import XCTest
@testable import write

class writeTests: XCTestCase {
    var textSample: String?
    
    override func setUp() {
        let filepath = Bundle.main.path(forResource: "Lorem Ipsum", ofType: "txt")!
        textSample = try! String(contentsOfFile: filepath)
        
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_WordCount_Performance() {
        self.measure {
            _ = textSample!.wordCount
        }
    }
}
