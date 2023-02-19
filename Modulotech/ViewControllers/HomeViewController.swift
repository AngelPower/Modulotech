//
//  HomeViewController.swift
//  Modulotech
//
//  Created by Sophie Romanet on 17/02/2023.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate {
    

    
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(HomeViewCell.self, forCellReuseIdentifier: HomeViewCell.identifier)
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = Loc.ControlPage.Home.title
        //createDevices()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 80
        tableView.estimatedRowHeight = UITableView.automaticDimension
        view.addSubview(tableView)
     
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    

   

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewCell.identifier, for: indexPath) as? HomeViewCell {
//            let currentDevice = self.devices[indexPath.row]
//            cell.configureLabel(label: currentDevice.deviceName)
//
//            if (currentDevice.productType == "RollerShutter"){
//                cell.configureLabelRight(label: configureRollerShutter(position: currentDevice.position))
//                cell.configureImage(image: "DeviceRollerShutterIcon")
//            } else if (currentDevice.productType == "Light") {
//                cell.configureLabelRight(label: configureLight(intensity: currentDevice.intensity, mode: currentDevice.mode))
//                cell.configureImage(image: "DeviceLightOnIcon")
//            } else {
//                cell.configureLabelRight(label: configureHeater(mode: currentDevice.mode, temperature: currentDevice.temperature))
//                cell.configureImage(image: "DeviceHeaterOnIcon")
//            }
            return cell
        }
        fatalError("could not cell")
    }
    
    func configureLight(intensity: Int, mode: String) -> String{
        if intensity != 0 && mode == "ON" {
            return "ON at "+"\(intensity)"+"%"
        } else {
            return "OFF"
        }
    }
    
    func configureRollerShutter(position: Int) -> String{
        if position != 0 {
            return "opened at "+"\(position)"+"%"
        } else {
            return "closed"
        }
    }
    
    func configureHeater(mode: String, temperature: Int) -> String{
        if mode != "OFF" {
            return "on at "+"\(temperature)"+"%"
        } else {
            return "OFF"
        }
    }
    
    
}


import SwiftUI

struct HomeViewControllerPreviews: PreviewProvider {
    
    static var previews: some View
    {
        HomeViewControllerRepresentable()
     
    }
}

struct HomeViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let vc = HomeViewController()
        return UINavigationController.init(rootViewController: vc)
        
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
    
    }
    
    
    typealias UIViewControllerType = UINavigationController
    
    
    
    
}

