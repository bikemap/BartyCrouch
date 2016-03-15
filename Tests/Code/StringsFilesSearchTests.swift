//
//  StringsFilesSearchTests.swift
//  BartyCrouch
//
//  Created by Cihat Gündüz on 14.02.16.
//  Copyright © 2016 Flinesoft. All rights reserved.
//

import XCTest

@testable import BartyCrouch

class StringsFilesSearchTests: XCTestCase {
    
    func testFindAllIBFiles() {
        
        let basePath = "\(PROJECT_DIR)/Tests"
        
        let expectedIBFilePaths = ["iOS", "OSX", "tvOS"].map { examplePath(platform: $0, locale: "Base", type: "storyboard") }
        
        let results = StringsFilesSearch.sharedInstance.findAllIBFiles(basePath)
        
        XCTAssertEqual(results.count, expectedIBFilePaths.count)
        XCTAssertEqual(results, expectedIBFilePaths)
        
    }

    func testiOSFindAllStringsFiles() {
        
        let baseStoryboardPath = examplePath(platform: "iOS", locale: "base", type: ".storyboard")
        let expectedStringsPaths = ["de", "en", "ja", "zh-Hans"].map { examplePath(platform: "iOS", locale: $0, type: ".strings") }
        
        let results = StringsFilesSearch.sharedInstance.findAllStringsFiles(baseStoryboardPath)
        
        XCTAssertEqual(results.count, expectedStringsPaths.count)
        XCTAssertEqual(results, expectedStringsPaths)
        
    }
    
    
    // MARK: - Helpers
    
    func examplePath(platform platform: String, locale: String, type: String) -> String {
        return "\(PROJECT_DIR)/Tests/Assets/Storyboards/\(platform)/\(locale).lproj/Example.\(type)"
    }

}