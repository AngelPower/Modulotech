//
//  ModuloTechAPI.swift
//  Modulotech
//
//  Created by Sophie Romanet on 20/02/2023.
//

import Foundation

class ModuloTechAPI {
    
    static var baseURL: URL = .init(string: "http://storage42.com")!
    
    static func moduloTestData(completion: @escaping ([DeviceItem]) -> Void) {
        let url = URL(fileURLWithPath: "modulotest/data.json", relativeTo: baseURL)

        URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard error == nil else {
                DispatchQueue.main.async {
                    completion([])
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion([])
                }
                return
            }
            guard let data else {
                DispatchQueue.main.async {
                    completion([])
                }
                return
            }
            
            guard let devices = try? JSONDecoder().decode(ModuloTechData.self, from: data).devices else {
                DispatchQueue.main.async {
                    completion([])
                }
                return
            }
            
            DispatchQueue.main.async {
                completion(devices)
            }
        }.resume()
    }
}
