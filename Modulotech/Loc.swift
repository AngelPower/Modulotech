//
//  Loc.swift
//  Modulotech
//
//  Created by Sophie Romanet on 17/02/2023.
//
import Foundation

enum Loc {
    enum ControlPage {
        enum Home {
            static let title = Loc.tr(key: "control_page.Home.title")
        }
        enum Light {
            static let title = Loc.tr(key: "control_page.light.title")
            static let label = Loc.tr(key: "control_page.light.label")
            static let labelIntensity = Loc.tr(key: "control_page.light.labelIntensity")
            static let buttonSave = Loc.tr(key: "control_page.light.buttonSave")
        }
        enum Roller {
            static let title = Loc.tr(key: "control_page.roller.title")
            static let labelPosition = Loc.tr(key: "control_page.roller.labelPosition")
        }
        enum Heaters {
            static let title = Loc.tr(key: "control_page.heaters.title")
            static let label = Loc.tr(key: "control_page.heaters.label")
            static let labelTemperature = Loc.tr(key: "control_page.heaters.labelTemperature")
            static let buttonSave = Loc.tr(key: "control_page.heaters.buttonSave")
        }
    }
    
    enum HomeViewCell {
        enum DeviceRoller {
            enum Status {
                static let closed = Loc.tr(key: "home_view_cell.device_roller.status.closed")
                static func opened(_ arg1: String) -> String {
                    Loc.tr(key: "home_view_cell.device_roller.status.opened", args: arg1)
                }
            }
        }
    }

}

extension Loc {
    
    static func tr (key: String, args: CVarArg...) -> String {
        let stringPlaceholder = NSLocalizedString(key, comment: "")
        return String(format: stringPlaceholder, arguments: args)
    }
    
}
