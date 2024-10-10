//
//  HomeDetailsViewController.swift.swift
//  RentaCards
//
//  Created by Jose Preatorian on 09-10-24.
//

import UIKit

class HomeDetailsViewController: UIViewController {
    private var router: Router?
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
    
    private let rentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Rentar Carro", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(rentCar), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        router = Router(navigationController: navigationController!)
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
        view.addSubview(rentButton) // Agregar el botón de rentar

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
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            rentButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            rentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor) // Centramos el botón
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
    
    @objc private func rentCar() {
        let alert = UIAlertController(title: "Rentar Carro", message: "¿Deseas rentar el \(car?.make ?? "el carro")?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Sí", style: .default, handler: { [self] _ in
            router?.showrentacar(cars: car!)
            print("Carro rentado")
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
