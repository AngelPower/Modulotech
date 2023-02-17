//
//  CrontrolPageLightViewController.swift
//  Modulotech
//
//  Created by Sophie Romanet on 17/02/2023.
//

import UIKit

class ControlPageLightViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Loc.ControlPage.Light.title
        
        
    }
    
}

import SwiftUI

struct ControlPageLightViewControllerPreviews: PreviewProvider {
    
    static var previews: some View
    {
      ControllePageLightViewControllerRepresentable()
     
    }
}

struct ControllePageLightViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let vc = ControlPageLightViewController()
        return UINavigationController.init(rootViewController: vc)
        
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
    
    }
    
    
    typealias UIViewControllerType = UINavigationController
    
    
    
    
}
