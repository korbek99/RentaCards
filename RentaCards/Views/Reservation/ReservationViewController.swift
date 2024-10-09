//
//  ReservationViewController.swift
//  RentaCards
//
//  Created by Jose Preatorian on 05-10-24.
//

import UIKit

class ReservationViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let tableView = UITableView()
    
    private let customerNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Customer Name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let customerEmailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Customer Email"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let carPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private let startDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private let endDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private let reserveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Go to Payment", for: .normal)
        button.addTarget(self, action: #selector(goToPayment), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var cars: [Car] = [] // Lista de coches que se puede pasar desde el controlador anterior
    var selectedCarId: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Reservation"
        setupUI()
        carPicker.delegate = self
        carPicker.dataSource = self
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        setupScrollView()
        
        // Configurar la vista de contenido
        contentView.addSubview(customerNameTextField)
        contentView.addSubview(customerEmailTextField)
        contentView.addSubview(carPicker)
        contentView.addSubview(startDatePicker)
        contentView.addSubview(endDatePicker)
        contentView.addSubview(reserveButton)
        
        // Configuración de Auto Layout
        setupConstraints()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor) // Para que el scrollView tenga contenido de ancho fijo
        ])
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            customerNameTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            customerNameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            customerNameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            customerEmailTextField.topAnchor.constraint(equalTo: customerNameTextField.bottomAnchor, constant: 20),
            customerEmailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            customerEmailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            carPicker.topAnchor.constraint(equalTo: customerEmailTextField.bottomAnchor, constant: 20),
            carPicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            carPicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            carPicker.heightAnchor.constraint(equalToConstant: 150),
            
            startDatePicker.topAnchor.constraint(equalTo: carPicker.bottomAnchor, constant: 20),
            startDatePicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            startDatePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            endDatePicker.topAnchor.constraint(equalTo: startDatePicker.bottomAnchor, constant: 20),
            endDatePicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            endDatePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            reserveButton.topAnchor.constraint(equalTo: endDatePicker.bottomAnchor, constant: 20),
            reserveButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            reserveButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    @objc private func goToPayment() {
        guard let customerName = customerNameTextField.text, !customerName.isEmpty,
              let customerEmail = customerEmailTextField.text, !customerEmail.isEmpty,
              let selectedCarId = selectedCarId else {
            showAlert(message: "Please fill in all fields.")
            return
        }

        let startDate = startDatePicker.date
        let endDate = endDatePicker.date
        
    
        let reservation = Reservation(customer: 1, carId: selectedCarId, startDate: startDate, endDate: endDate)
        print("Reservation created: \(reservation)")
        
        let paymentVC = PaymentViewController()
        //paymentVC.reservation = reservation
        navigationController?.pushViewController(paymentVC, animated: true)
    }

    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

extension ReservationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cars.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(cars[row].make) \(cars[row].model)"
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCarId = cars[row].id
    }
}
