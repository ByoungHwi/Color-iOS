//
//  ColorValueTests.swift
//  ColorTests
//
//  Created by Byoung-Hwi Yoon on 2021/09/21.
//

import XCTest
@testable import Color

class ColorValueTests: XCTestCase {
    func test_정상적인_Int값을통한_이니셜라이징() throws {
        let colorValue = ColorValue(100)
        
        XCTAssertEqual(colorValue.intValue, 100)
        XCTAssertEqual(colorValue.floatValue, 0.39215686274509803)
        XCTAssertEqual(colorValue.hexValue, "64")
    }
    
    func test_최대값_초과_Int를통한_이니셜라이징() throws {
        let colorValue = ColorValue(300)
        
        XCTAssertEqual(colorValue.intValue, 255)
        XCTAssertEqual(colorValue.floatValue, 1)
        XCTAssertEqual(colorValue.hexValue, "FF")
    }
    
    func test_최소값_미만_Int를통한_이니셜라이징() throws {
        let colorValue = ColorValue(-1)
        
        XCTAssertEqual(colorValue.intValue, 0)
        XCTAssertEqual(colorValue.floatValue, 0)
        XCTAssertEqual(colorValue.hexValue, "00")
    }
    
    func test_정상적인_CGFloat값을통한_이니셜라이징() throws {
        let colorValue = ColorValue(0.5)
        
        XCTAssertEqual(colorValue.intValue, 127)
        XCTAssertEqual(colorValue.floatValue, 0.5)
        XCTAssertEqual(colorValue.hexValue, "7F")
    }
    
    func test_최대값_초과_CGFloat값을통한_이니셜라이징() throws {
        let colorValue = ColorValue(1.5)
        
        XCTAssertEqual(colorValue.intValue, 255)
        XCTAssertEqual(colorValue.floatValue, 1)
        XCTAssertEqual(colorValue.hexValue, "FF")
    }
    
    func test_최소값_미만_CGFloat값을통한_이니셜라이징() throws {
        let colorValue = ColorValue(-0.5)
        
        XCTAssertEqual(colorValue.intValue, 0)
        XCTAssertEqual(colorValue.floatValue, 0)
        XCTAssertEqual(colorValue.hexValue, "00")
    }
    
    func test_정상적인_HexString값을통한_이니셜라이징() throws {
        let colorValue = ColorValue("A1")
        
        XCTAssertEqual(colorValue.intValue, 161)
        XCTAssertEqual(colorValue.floatValue, 0.6313725490196078)
        XCTAssertEqual(colorValue.hexValue, "A1")
    }
    
    func test_최대값_초과_HexString값을통한_이니셜라이징() throws {
        let colorValue = ColorValue("100")
        
        XCTAssertEqual(colorValue.intValue, 255)
        XCTAssertEqual(colorValue.floatValue, 1)
        XCTAssertEqual(colorValue.hexValue, "FF")
    }
    
    func test_비정상적인_HexString값을통한_이니셜라이징() throws {
        let colorValue = ColorValue("String")
        
        XCTAssertEqual(colorValue.intValue, 0)
        XCTAssertEqual(colorValue.floatValue, 0)
        XCTAssertEqual(colorValue.hexValue, "00")
    }
    
    func test_정상적인_Int값으로의_변경() throws {
        var colorValue = ColorValue(100)
        
        colorValue.intValue = 255
        
        XCTAssertEqual(colorValue.intValue, 255)
        XCTAssertEqual(colorValue.floatValue, 1)
        XCTAssertEqual(colorValue.hexValue, "FF")
    }
    
    func test_최대값_초과_Int값으로의_변경() throws {
        var colorValue = ColorValue(0.123)
        
        colorValue.intValue = 256
        
        XCTAssertEqual(colorValue.intValue, 255)
        XCTAssertEqual(colorValue.floatValue, 1)
        XCTAssertEqual(colorValue.hexValue, "FF")
    }
    
    func test_최소값_미만_Int값으로의_변경() throws {
        var colorValue = ColorValue("DF")
        
        colorValue.intValue = -3
        
        XCTAssertEqual(colorValue.intValue, 0)
        XCTAssertEqual(colorValue.floatValue, 0)
        XCTAssertEqual(colorValue.hexValue, "00")
    }
    
    func test_정상적인_CGFloat값으로의_변경() throws {
        var colorValue = ColorValue(100)
        
        colorValue.floatValue = 0.5
        
        XCTAssertEqual(colorValue.intValue, 127)
        XCTAssertEqual(colorValue.floatValue, 0.5)
        XCTAssertEqual(colorValue.hexValue, "7F")
    }
    
    func test_최대값_초과_CGFloat값으로의_변경() throws {
        var colorValue = ColorValue(0.123)
        
        colorValue.floatValue = 1.01
        
        XCTAssertEqual(colorValue.intValue, 255)
        XCTAssertEqual(colorValue.floatValue, 1)
        XCTAssertEqual(colorValue.hexValue, "FF")
    }
    
    func test_최소값_미만_CGFloat값으로의_변경() throws {
        var colorValue = ColorValue("DF")
        
        colorValue.floatValue = -0.1
        
        XCTAssertEqual(colorValue.intValue, 0)
        XCTAssertEqual(colorValue.floatValue, 0)
        XCTAssertEqual(colorValue.hexValue, "00")
    }
    
    func test_정상적인_HexString값으로의_변경() throws {
        var colorValue = ColorValue(100)
        
        colorValue.hexValue = "A1"
        
        XCTAssertEqual(colorValue.intValue, 161)
        XCTAssertEqual(colorValue.floatValue, 0.6313725490196078)
        XCTAssertEqual(colorValue.hexValue, "A1")
    }
    
    func test_최대값_초과_HexString값으로의_변경() throws {
        var colorValue = ColorValue(0.123)
        
        colorValue.hexValue = "FFF"
        
        XCTAssertEqual(colorValue.intValue, 255)
        XCTAssertEqual(colorValue.floatValue, 1)
        XCTAssertEqual(colorValue.hexValue, "FF")
    }
    
    func test_비정상적인_HexString값으로의_변경() throws {
        var colorValue = ColorValue("DF")
        
        colorValue.hexValue = ""
        
        XCTAssertEqual(colorValue.intValue, 0)
        XCTAssertEqual(colorValue.floatValue, 0)
        XCTAssertEqual(colorValue.hexValue, "00")
    }
}
