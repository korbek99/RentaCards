//
//  ReservationViewController.swift
//  RentaCards
//
//  Created by Jose Preatorian on 05-10-24.
//
import UIKit

class ReservationViewController: UIViewController {
    
    private var router: Router?
    var car: Car?
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
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
    
    private let yearCarLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceCarLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
    
    private let startDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Inicio"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let endDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Fin"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Reservation"
        setupUI()
        loadDatauser()
     
    }
    
    private func loadDatauser(){
        
        customerNameTextField.text = "Gabriela Rica"
        customerEmailTextField.text = "GabrielaRica@hotmail.com"
        
        makeLabel.text = car?.make
        modelLabel.text = car?.model

        if let car = car {
            carImageView.loadImage(from: car.image)
            yearCarLabel.text = "\(car.year)"
            priceCarLabel.text = "$\(car.pricePerDay)"
        } else {
            yearCarLabel.text = "N/A"
            priceCarLabel.text = "N/A"
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .white
    
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        

        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .clear
        
 
        contentView.addSubview(carImageView)
        contentView.addSubview(makeLabel)
        contentView.addSubview(modelLabel)
        contentView.addSubview(yearCarLabel)
        contentView.addSubview(priceCarLabel)
        contentView.addSubview(customerNameTextField)
        contentView.addSubview(customerEmailTextField)
        contentView.addSubview(startDateLabel)
        contentView.addSubview(startDatePicker)
        contentView.addSubview(endDateLabel)
        contentView.addSubview(endDatePicker)

        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

         
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

       
            carImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            carImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            carImageView.heightAnchor.constraint(equalToConstant: 200),
            carImageView.widthAnchor.constraint(equalToConstant: 300),

          
            makeLabel.topAnchor.constraint(equalTo: carImageView.bottomAnchor, constant: 10),
            makeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

         
            modelLabel.topAnchor.constraint(equalTo: makeLabel.bottomAnchor, constant: 5),
            modelLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

          
            yearCarLabel.topAnchor.constraint(equalTo: modelLabel.bottomAnchor, constant: 5),
            yearCarLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

           
            priceCarLabel.topAnchor.constraint(equalTo: yearCarLabel.bottomAnchor, constant: 5),
            priceCarLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

           
            customerNameTextField.topAnchor.constraint(equalTo: priceCarLabel.bottomAnchor, constant: 20),
            customerNameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            customerNameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

           
            customerEmailTextField.topAnchor.constraint(equalTo: customerNameTextField.bottomAnchor, constant: 20),
            customerEmailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            customerEmailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

           
            startDateLabel.topAnchor.constraint(equalTo: customerEmailTextField.bottomAnchor, constant: 20),
            startDateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            
            startDatePicker.topAnchor.constraint(equalTo: startDateLabel.bottomAnchor, constant: 10),
            startDatePicker.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            startDatePicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            startDatePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

           
            endDateLabel.topAnchor.constraint(equalTo: startDatePicker.bottomAnchor, constant: 20),
            endDateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

           
            endDatePicker.topAnchor.constraint(equalTo: endDateLabel.bottomAnchor, constant: 10),
            endDatePicker.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            endDatePicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            endDatePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

           
            endDatePicker.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}
