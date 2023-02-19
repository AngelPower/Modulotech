//
//  ControlPageRollerViewController.swift
//  Modulotech
//
//  Created by Sophie Romanet on 17/02/2023.
//

import UIKit

class ControlPageRollerViewController: UIViewController {
    
    lazy var myLabelPosition: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Loc.ControlPage.Roller.labelPosition
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var stackViewPosition: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.isUserInteractionEnabled = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 16
        return stackView
    }()
    
    lazy var buttonSave: UIButton = {
        let button:UIButton = UIButton()
        button.backgroundColor = .red
        button.setTitle(Loc.ControlPage.Light.buttonSave, for: .normal)
        return button
    }()
    
    lazy var slider: UISlider = {
        let slider = UISlider()
            slider.center = self.view.center
            slider.minimumTrackTintColor = .green
            slider.maximumTrackTintColor = .red
            slider.thumbTintColor = .black
            slider.maximumValue = 100
            slider.minimumValue = 0
            slider.setValue(0, animated: false)
        return slider
    }()
    
    var paybackLabel : UILabel = {
        let paybackLabel = UILabel()
        paybackLabel.center = CGPointMake(190, 61)
        paybackLabel.textAlignment = NSTextAlignment.center
        paybackLabel.font = UIFont(name: paybackLabel.font.fontName, size:24)
        paybackLabel.textColor = UIColor.blue
        paybackLabel.text = "0"
        return paybackLabel
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = Loc.ControlPage.Roller.title
        slider.addTarget(self, action: #selector(self.changeValue(_:)), for: .valueChanged)
        buttonSave.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
        createView()
        configureAutoLayout()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createView() {
        
        view.addSubview(stackViewPosition)
        stackViewPosition.addArrangedSubview(myLabelPosition)
        stackViewPosition.addArrangedSubview(paybackLabel)
        stackViewPosition.addArrangedSubview(slider)
        stackViewPosition.addArrangedSubview(buttonSave)
    }
    
    func configureAutoLayout() {
        NSLayoutConstraint.activate([
        stackViewPosition.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        stackViewPosition.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        stackViewPosition.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 136)
        ])
    }
    
    @objc func changeValue(_ sender: UISlider) {
        print("value is" , Int(sender.value));
        paybackLabel.text = "\(sender.value)"
    }
    
    @objc func buttonClicked() {
        print("Button Clicked")
    }
    
}

import SwiftUI

struct ControlPageRollerViewControllerPreviews: PreviewProvider {
    
    static var previews: some View
    {
        ControllePageRollerViewControllerRepresentable()
     
    }
}

struct ControllePageRollerViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let vc = ControlPageRollerViewController()
        return UINavigationController.init(rootViewController: vc)
        
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
    
    }
    
    
    typealias UIViewControllerType = UINavigationController
    
    
    
    
}

