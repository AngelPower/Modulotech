//
//  ControlPageHeatersViewController.swift
//  Modulotech
//
//  Created by Sophie Romanet on 17/02/2023.
//

import UIKit

class ControlPageHeatersViewController: UIViewController {
    
    let data: DeviceHeater
    
    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Loc.ControlPage.Heaters.label
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var myLabelIntensity: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Loc.ControlPage.Heaters.labelTemperature
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
        stackView.isUserInteractionEnabled = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 16
        return stackView
    }()
    
    lazy var switchMode: UISwitch = {
        let switchDemo = UISwitch()
        switchDemo.setOn(true, animated: false)
        return switchDemo
    }()
    
    lazy var buttonSave: UIButton = {
        let button:UIButton = UIButton()
        button.backgroundColor = .red
        button.setTitle(Loc.ControlPage.Heaters.buttonSave, for: .normal)
        return button
    }()
    
    lazy var slider: UISlider = {
        let slider = UISlider()
            slider.center = self.view.center
            slider.minimumTrackTintColor = .green
            slider.maximumTrackTintColor = .red
            slider.thumbTintColor = .black
            slider.maximumValue = 28
            slider.minimumValue = 7
            slider.setValue(0, animated: false)
        return slider
    }()
    
    var paybackLabel : UILabel = {
        let paybackLabel = UILabel()
        paybackLabel.center = CGPointMake(190, 61)
        paybackLabel.textAlignment = NSTextAlignment.center
        paybackLabel.font = UIFont(name: paybackLabel.font.fontName, size:24)
        paybackLabel.textColor = UIColor.blue
        paybackLabel.text = "7"
        return paybackLabel
        
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        title = Loc.ControlPage.Heaters.title
        switchMode.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .valueChanged)
        slider.addTarget(self, action: #selector(self.changeValue(_:)), for: .valueChanged)
        buttonSave.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
        configureAttributes()
        createView()
        configureAutoLayout()
        
    }
    
    init(data: DeviceHeater) {

        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func switchStateDidChange(_ sender:UISwitch!)
    {
        if (sender.isOn == true){
            print("UISwitch state is now ON")
        }
        else{
            print("UISwitch state is now Off")
        }
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func configureAutoLayout() {
        
        NSLayoutConstraint.activate([
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 56),
        
        stackViewIntensity.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        stackViewIntensity.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        stackViewIntensity.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 136)
        ])
    }
    
    func configureAttributes() {
        
        if data.mode == "ON" {
            switchMode.isOn = true
        }else {
            switchMode.isOn = false
        }
        paybackLabel.text = String(data.temperature)
        slider.value = Float(data.temperature)
    }
    
    @objc func changeValue(_ sender: UISlider) {
        
        print("value is" , Int(sender.value));
        let step: Float = 0.5
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        paybackLabel.text = "\(roundedValue)"
    }
    
    @objc func buttonClicked() {
        
        print("Button Clicked")
    }
    
}
