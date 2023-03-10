//
//  CrontrolPageLightViewController.swift
//  Modulotech
//
//  Created by Sophie Romanet on 17/02/2023.
//

import UIKit

class ControlPageLightViewController: UIViewController {
    
    let data: DeviceLight
    
    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Loc.ControlPage.Light.label
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var myLabelIntensity: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Loc.ControlPage.Light.labelIntensity
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.isUserInteractionEnabled = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 16
        return stackView
    }()
    
    lazy var stackViewIntensity: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 16
        return stackView
    }()
    
    lazy var switchMode: UISwitch = {
        let switchDemo = UISwitch()
        return switchDemo
    }()
    
    lazy var buttonSave: UIButton = {
        let button:UIButton = UIButton()
        button.backgroundColor = .red
        button.setTitle(Loc.ControlPage.Light.buttonSave, for: .normal)
        return button
    }()
    
    lazy var slider: UISlider = {
        let slider = UISlider()
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
        paybackLabel.textAlignment = NSTextAlignment.center
        paybackLabel.font = UIFont.systemFont(ofSize: 24)
        paybackLabel.textColor = UIColor.blue
        paybackLabel.text = "0"
        return paybackLabel
        
    }()
    
    override func loadView() {
        
        super.loadView()
        createView()
        configureAttributes()
        configureAutoLayout()
        configureConnections()
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = Loc.ControlPage.Light.title
        view.backgroundColor = .white
    }
    
    init(data: DeviceLight) {

        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func switchStateDidChange(_ sender: UISwitch) {
        if sender.isOn == true {
            print("UISwitch state is now ON")
        } else{
            print("UISwitch state is now Off")
        }
    }

    func createView() {
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(myLabel)
        stackView.addArrangedSubview(switchMode)
        view.addSubview(stackViewIntensity)
        stackViewIntensity.addArrangedSubview(myLabelIntensity)
        stackViewIntensity.addArrangedSubview(paybackLabel)
        stackViewIntensity.addArrangedSubview(slider)
        stackViewIntensity.addArrangedSubview(buttonSave)
    }
    
    // configureAutoLayout
    func configureAutoLayout() {
        
        let padding: CGFloat = 20
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 56),
            
            stackViewIntensity.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackViewIntensity.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackViewIntensity.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 136),
        ])
  
    }
    
    func configureAttributes() {
        
        if data.mode == "ON" {
            switchMode.isOn = true
        }else {
            switchMode.isOn = false
        }
        
        paybackLabel.text = String(data.intensity)
        slider.value = Float(data.intensity)
    }
    
    private func configureConnections() {
        
        switchMode.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .valueChanged)
        slider.addTarget(self, action: #selector(self.changeValue(_:)), for: .valueChanged)
        buttonSave.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
    }
    
    
    @objc func changeValue(_ sender: UISlider) {
        
        debugPrint("value is" , Int(sender.value))
        paybackLabel.text = "\(sender.value)"
    }
    
    @objc func buttonClicked() {
        
        print("Button Clicked")
    }
    
}
