//
//  ModulotechTests.swift
//  ModulotechTests
//
//  Created by Sophie Romanet on 17/02/2023.
//

import XCTest
@testable import Modulotech

final class ModulotechTests: XCTestCase {
    
    func testParsingJson() throws {
        let url = Bundle.main.url(forResource: "Data", withExtension: "json")!
        let data = try! Data.init(contentsOf: url)
        let json = try! JSONDecoder().decode(ModuloTechData.self, from: data)
        XCTAssertEqual(json.devices.count, 12)
        let device = json.devices[0]
        if case .light = device {
        } else {
            XCTFail("not good type")
        }
    }

}
