//
//  CarsTableViewCell.swift
//  RentaCards
//
//  Created by Jose Preatorian on 05-10-24.
//
import UIKit

class CarsTableViewCell: UITableViewCell {
    
    private let imgView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let modelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        contentView.addSubview(imgView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(modelLabel)
        
        NSLayoutConstraint.activate([
            imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imgView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imgView.widthAnchor.constraint(equalToConstant: 150),
            imgView.heightAnchor.constraint(equalToConstant: 150),
            
            nameLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            
            modelLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 16),
            modelLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            modelLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            modelLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    public func configureItems(with imageUrl: String, name: String, model: String) {
        nameLabel.text = name
        modelLabel.text = model
        imgView.image = nil

        guard let url = URL(string: imageUrl) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error downloading image: \(error)")
                return
            }

            guard let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.imgView.image = image
            }
        }.resume()
    }

}
