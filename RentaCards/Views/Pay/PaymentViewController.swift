//
//  PaymentViewController.swift
//  RentaCards
//
//  Created by Jose Preatorian on 05-10-24.
//

import UIKit

class PaymentViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var collectionView: UICollectionView!
    private let paymentMethods = ["Visa", "MasterCard", "American Express", "Discover"]
    private var selectedIndex: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Select Payment Method"
        setupCollectionView()
        setupPayButton()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 100, height: 60)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PaymentMethodCell.self, forCellWithReuseIdentifier: "PaymentMethodCell")
        collectionView.backgroundColor = .white
        
        view.addSubview(collectionView)
        
        // Constraints
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func setupPayButton() {
        let payButton = UIButton(type: .system)
        payButton.setTitle("Pay", for: .normal)
        payButton.addTarget(self, action: #selector(payButtonTapped), for: .touchUpInside)
        payButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(payButton)
        

        NSLayoutConstraint.activate([
            payButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            payButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func payButtonTapped() {
        guard let selectedIndex = selectedIndex else {
            print("Please select a payment method.")
            return
        }
        let selectedMethod = paymentMethods[selectedIndex.row]
        print("Processing payment with \(selectedMethod)")
       
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paymentMethods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PaymentMethodCell", for: indexPath) as! PaymentMethodCell
        cell.configure(with: paymentMethods[indexPath.row])
        cell.isSelected = (indexPath == selectedIndex)
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath
        collectionView.reloadData() 
    }
}
