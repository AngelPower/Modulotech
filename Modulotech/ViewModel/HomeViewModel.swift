//
//  HomeViewModel.swift
//  Modulotech
//
//  Created by Sophie Romanet on 20/02/2023.
//

import Foundation

class HomeViewModel {
    
    weak var controller: HomeViewController?
    var data: [DeviceItem] = []
    
    init(controller: HomeViewController? = nil) {
        self.controller = controller
    }
    
    func viewDidLoad() {
        fetchModuloTestData()
    }
    
    func fetchModuloTestData() {
        ModuloTechAPI.moduloTestData { [weak self] devices in
            self?.data = devices
            self?.controller?.tableView.reloadData()
            
        }
    }
    
}


