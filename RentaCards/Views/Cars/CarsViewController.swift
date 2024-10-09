//
//  CarsViewController.swift
//  RentaCards
//
//  Created by Jose Preatorian on 05-10-24.
//
import UIKit

class CarsViewController: UIViewController {

    private let carViewModel = CarViewModel()

    lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.register(CarsTableViewCell.self, forCellReuseIdentifier: "CarsTableViewCell")
        table.rowHeight = 200.0
        table.separatorColor = UIColor.orange
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cars"
        setupUX()
        carViewModel.filterCars(with: "")
    }
    
    func setupUX() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension CarsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carViewModel.numberOfCars() 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarsTableViewCell", for: indexPath) as! CarsTableViewCell

        let car = carViewModel.car(at: indexPath.row)
        
        let image: String = car.image
        let name = "\(car.make) \(car.model)"
        let year = "\(car.year)"
        let price = "\(car.pricePerDay) USD/day"
        
        cell.configureItems(with: String(image), name: name, model: car.make)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsVC = CarDetailViewController()
        let selectedCar = carViewModel.car(at: indexPath.row)
        detailsVC.car = selectedCar
        navigationController?.pushViewController(detailsVC, animated: true)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            carViewModel.deleteCar(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
