//
//  PaymentMethodCell.swift
//  RentaCards
//
//  Created by Jose Preatorian on 09-10-24.
//

import UIKit


class PaymentMethodCell: UICollectionViewCell {
    
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        label.textAlignment = .center
        
        // Constraints
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 8
    }
    
    func configure(with method: String) {
        label.text = method
        contentView.backgroundColor = isSelected ? UIColor.blue : UIColor.white
        label.textColor = isSelected ? UIColor.white : UIColor.black
    }
}
