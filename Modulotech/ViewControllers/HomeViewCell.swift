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
        return imageView
    }()
    
    let myLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    let myLabelRight: UILabel = {
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
            hStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        

        
    }
        
    func configureLabel(label: String) {
        myLabel.text = label
    }
    
    func configureLabelRight(label: String) {
        myLabelRight.text = label
    }
    
    func configureImage(image: String) {
        myImageView.image = UIImage(named: image)
    }
    
}

import SwiftUI

struct HomeViewCellPreviews: PreviewProvider {
    static var previews: some View {
        HomeViewCellRepresentable()
            .previewLayout(.fixed(width: 320, height: 70))
    }
    
}


struct HomeViewCellRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> HomeViewCell {
        HomeViewCell(style: .default, reuseIdentifier: nil)
    }
    
    func updateUIView(_ uiView: HomeViewCell, context: Context) {
        
    }
    
    typealias UIViewType = HomeViewCell
    
    
    
}
