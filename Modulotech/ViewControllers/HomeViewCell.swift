//
//  HomeViewCell.swift
//  Modulotech
//
//  Created by Sophie Romanet on 18/02/2023.
//

import UIKit

class HomeViewCell: UITableViewCell {
    
    static var identifier = "\(HomeViewCell.self)"
    
    let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        imageView.layer.borderWidth = 2.0
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    var myLabelRight: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.textColor = .gray
        return label
    }()
    
    private let hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(hStackView)
        NSLayoutConstraint.activate([
            imageView!.heightAnchor.constraint(equalToConstant: 50),
            imageView!.widthAnchor.constraint(equalToConstant: 50)
        ])
        hStackView.addArrangedSubview(myImageView)
        hStackView.addArrangedSubview(myLabel)
        hStackView.addArrangedSubview(myLabelRight)
        configureAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureAutoLayout() {
        
        NSLayoutConstraint.activate([
            hStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            hStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            hStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            hStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            myImageView.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configure(with device: DeviceItem) {
        
        switch device {
        case .light(let deviceLight):
            configure(with: deviceLight)
        case .heater(let deviceHeater):
            configure(with: deviceHeater)
        case .roller(let deviceRoller):
            configure(with: deviceRoller)
        }
    }
    
    private func configure(with device: DeviceLight) {
        
        if device.intensity != 0 && device.mode == "ON" {
            self.myLabelRight.text = Loc.HomeViewCell.DeviceLight.Status.intensity(String(device.intensity))
            self.myImageView.image = Assets.DeviceLightOnIcon
        } else {
            self.myLabelRight.text = Loc.HomeViewCell.DeviceLight.Status.off
            self.myImageView.image = Assets.DeviceLightOffIcon
        }
        self.myLabel.text = device.deviceName
    }
    
    private func configure(with device: DeviceRoller) {
        
        if device.position != 0 {
            self.myLabelRight.text = Loc.HomeViewCell.DeviceRoller.Status.opened(String(device.position))
        } else {
            self.myLabelRight.text = Loc.HomeViewCell.DeviceRoller.Status.closed
        }
        self.myLabel.text = device.deviceName
        self.myImageView.image = Assets.DeviceRollerShutterIcon
    }
    
    private func configure(with device: DeviceHeater) {
        
        if device.mode != "OFF" {
            self.myLabelRight.text =  Loc.HomeViewCell.DeviceHeater.Status.temperature(String(device.temperature))
            self.myImageView.image = Assets.DeviceHeaterOnIcon
            
        } else {
            self.myLabelRight.text = Loc.HomeViewCell.DeviceHeater.Status.off
            self.myImageView.image = Assets.DeviceHeaterOffIcon
        }
        self.myLabel.text = device.deviceName
    }
}
