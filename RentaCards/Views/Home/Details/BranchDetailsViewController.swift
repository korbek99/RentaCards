//
//  BranchDetailsViewController.swift
//  RentaCards
//
//  Created by Jose Preatorian on 09-10-24.
//
import UIKit
import MapKit

class BranchDetailsViewController: UIViewController {
    private var router: Router?
    var branch: Branch?
    
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
    
    private let mapButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Ver Mapa", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(openMap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        router = Router(navigationController: navigationController!)
        title = "Branch Details"
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
        view.addSubview(mapButton)
        
        NSLayoutConstraint.activate([
            carImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            carImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            carImageView.heightAnchor.constraint(equalToConstant: 200),
            carImageView.widthAnchor.constraint(equalToConstant: 300),
            
            makeLabel.topAnchor.constraint(equalTo: carImageView.bottomAnchor, constant: 20),
            makeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            
            modelLabel.topAnchor.constraint(equalTo: makeLabel.bottomAnchor, constant: 10),
            modelLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            yearLabel.topAnchor.constraint(equalTo: modelLabel.bottomAnchor, constant: 10),
            yearLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            priceLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            mapButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            mapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor) // Centramos el botón
        ])
    }
    
    private func displayCarDetails() {
        guard let bran = branch else { return }
        carImageView.loadImage(from: bran.image)
        makeLabel.text = "\(bran.name)"
    }
    
    @objc private func openMap() {
//        guard let branch = branch else { return }
//        let coordinate = CLLocationCoordinate2D(latitude: branch.latitude, longitude: branch.longitude)
//        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
//        mapItem.name = branch.name
//        mapItem.openInMaps(launchOptions: nil)
        router?.showMapa(latitude: branch!.latitude, longitude: branch!.longitude)
    }
}
