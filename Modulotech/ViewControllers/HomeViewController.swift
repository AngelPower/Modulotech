//
//  HomeViewController.swift
//  Modulotech
//
//  Created by Sophie Romanet on 17/02/2023.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(HomeViewCell.self, forCellReuseIdentifier: HomeViewCell.identifier)
        return tableView
        
    }()
    let fileName = "data.json"
    
    lazy var viewModel = HomeViewModel(controller: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = Loc.ControlPage.Home.title
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 50
        tableView.estimatedRowHeight = UITableView.automaticDimension
        view.addSubview(tableView)
        viewModel.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         viewModel.data.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let data = viewModel.data[indexPath.row]
         let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewCell.identifier, for: indexPath) as! HomeViewCell
         cell.configure(with: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let data = viewModel.data[indexPath.row]
        let vc: UIViewController
        
        switch data {
        case .roller(let roller):
            vc = ControlPageRollerViewController(data: roller)
        case .light(let light):
            vc = ControlPageLightViewController()
        case .heater(let heater):
            vc = ControlPageHeatersViewController()
            
        }
        
        self.present(vc, animated: true)
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

