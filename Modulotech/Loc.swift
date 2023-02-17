//
//  Loc.swift
//  Modulotech
//
//  Created by Sophie Romanet on 17/02/2023.
//
import Foundation

enum Loc {
    enum ControlPage {
        enum Light {
            static let title = Loc.tr(key: "control_page.light.title")
            
        }
        
    }
    
    
}

extension Loc {
    
    static func tr (key: String, args: CVarArg...) -> String {
        
        NSLocalizedString(key, comment: "")
        
    }
    
}
