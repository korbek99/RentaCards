//
//  CarDetailViewController.swift
//  RentaCards
//
//  Created by Jose Preatorian on 05-10-24.
//

import UIKit

class CarDetailViewController: UIViewController {
    
    var car: Car?
    
    private let carImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let makeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let modelLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let yearLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Car Details"
        view.backgroundColor = .white
        setupUI()
        displayCarDetails()
    }
    
    private func setupUI() {
        view.addSubview(carImageView)
        view.addSubview(makeLabel)
        view.addSubview(modelLabel)
        view.addSubview(yearLabel)
        view.addSubview(priceLabel)

        NSLayoutConstraint.activate([
            carImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            carImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            carImageView.heightAnchor.constraint(equalToConstant: 200),
            carImageView.widthAnchor.constraint(equalToConstant: 300),
            
            makeLabel.topAnchor.constraint(equalTo: carImageView.bottomAnchor, constant: 20),
            makeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            modelLabel.topAnchor.constraint(equalTo: makeLabel.bottomAnchor, constant: 10),
            modelLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            yearLabel.topAnchor.constraint(equalTo: modelLabel.bottomAnchor, constant: 10),
            yearLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            priceLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    private func displayCarDetails() {
        guard let car = car else { return }
        carImageView.loadImage(from: car.image)
        makeLabel.text = "Make: \(car.make)"
        modelLabel.text = "Model: \(car.model)"
        yearLabel.text = "Year: \(car.year)"
        priceLabel.text = "Price per day: $\(car.pricePerDay)"
    }
}

extension UIImageView {
    func loadImage(from url: String) {
        guard let imageUrl = URL(string: url) else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageUrl) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

