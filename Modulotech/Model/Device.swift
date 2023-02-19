//
//  RollerShutter.swift
//  Modulotech
//
//  Created by Sophie Romanet on 18/02/2023.
//

import UIKit

struct ModuloTechData: Decodable {
    
    let devices: [DeviceItem]
    
}

struct DeviceLight: Decodable {
    
    let id: Int
    let deviceName: String
    let intensity: Int
    let mode: String
    
}

struct DeviceRoller: Decodable {
    
    let id: Int
    let deviceName: String
    let position: Int
    
}

struct DeviceHeater: Decodable {
    
    let id: Int
    let deviceName: String
    let mode: String
    let temperature: Int
               
}

enum DeviceItem: Decodable {
    case light(DeviceLight)
    case heater(DeviceHeater)
    case roller(DeviceRoller)
    
    enum CodingKeys: CodingKey {
        case productType
    }
    
    enum ProductType: String, Decodable {
        case heater = "Heater"
        case light = "Light"
        case roller = "RollerShutter"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let singleValueContainer =  try decoder.singleValueContainer()
        let type = try container.decode(ProductType.self, forKey: .productType)
        switch type {
        case .light: self = .light(try singleValueContainer.decode(DeviceLight.self))
        case .heater:
            let heater = try singleValueContainer.decode(DeviceHeater.self)
                self = .heater(heater)
        case .roller:
            let roller = try singleValueContainer.decode(DeviceRoller.self)
            self = .roller(roller)
        }
    }
}
