//
//  HomeViewController.swift
//  RentaCards
//
//  Created by Jose Preatorian on 09-10-19.
//

import UIKit

class HomeViewController: UIViewController {
  private var router: Router?
   var viewModel = CarViewModel()
    var viewModelB = BranchViewModel()
    let menuView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 6
        return view
    }()
    
    var leadingConstraint: NSLayoutConstraint!
    var menuShowing = false
    
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let featuredCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let imageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var lblFeatures: UILabel = {
        let label = UILabel()
        label.text = "Cars"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblOthers: UILabel = {
        let label = UILabel()
        label.text = "Branchs"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        router = Router(navigationController: navigationController!)
        setupUI()
        setupUX()
        setupNavigationBar()
        setupMenuView()
    }


    func setupUX() {
        view.backgroundColor = .white
        view.addSubview(menuView)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(lblFeatures)
        contentView.addSubview(featuredCollectionView)
        contentView.addSubview(lblOthers)
        contentView.addSubview(imageCollectionView)
        
        featuredCollectionView.dataSource = self
        featuredCollectionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
        
        featuredCollectionView.register(FeaturedCollectionViewCell.self, forCellWithReuseIdentifier: FeaturedCollectionViewCell.identifier)
        imageCollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            lblFeatures.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            lblFeatures.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            lblFeatures.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            featuredCollectionView.topAnchor.constraint(equalTo: lblFeatures.bottomAnchor, constant: 5),
            featuredCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            featuredCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            featuredCollectionView.heightAnchor.constraint(equalToConstant: 300),
            
            lblOthers.topAnchor.constraint(equalTo: featuredCollectionView.bottomAnchor, constant: 15),
            lblOthers.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            lblOthers.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            imageCollectionView.topAnchor.constraint(equalTo: lblOthers.bottomAnchor, constant: 16),
            imageCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            imageCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            imageCollectionView.heightAnchor.constraint(equalToConstant: 200),
            imageCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    func setupMenuView() {
        leadingConstraint = menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -200)
        view.addSubview(menuView)

        NSLayoutConstraint.activate([
            leadingConstraint,
            menuView.topAnchor.constraint(equalTo: view.topAnchor),
            menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            menuView.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        let profileImageView = UIImageView()
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.image = UIImage(systemName: "person.circle.fill")
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.tintColor = .white
        menuView.addSubview(profileImageView)

        let welcomeLabel = UILabel()
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.text = "Bienvenido"
        welcomeLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        welcomeLabel.textColor = .white
        menuView.addSubview(welcomeLabel)

        let navigateButton = UIButton(type: .system)
        navigateButton.translatesAutoresizingMaskIntoConstraints = false
        navigateButton.setTitle("Config", for: .normal)
        navigateButton.setTitleColor(.white, for: .normal)
        navigateButton.addTarget(self, action: #selector(navigateToNextScreen), for: .touchUpInside)
        menuView.addSubview(navigateButton)
        
        let navigateLogin = UIButton(type: .system)
        navigateLogin.translatesAutoresizingMaskIntoConstraints = false
        navigateLogin.setTitle("Log Out", for: .normal)
        navigateLogin.setTitleColor(.white, for: .normal)
//        navigateLogin.addTarget(self, action: #selector(navigateToLogin), for: .touchUpInside)
        menuView.addSubview(navigateLogin)

        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: menuView.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 160),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            profileImageView.heightAnchor.constraint(equalToConstant: 80),
            
            welcomeLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            welcomeLabel.centerXAnchor.constraint(equalTo: menuView.centerXAnchor),
            
            navigateButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            navigateButton.centerXAnchor.constraint(equalTo: menuView.centerXAnchor),
            
            navigateLogin.topAnchor.constraint(equalTo: navigateButton.bottomAnchor, constant: 20),
            navigateLogin.centerXAnchor.constraint(equalTo: menuView.centerXAnchor)
        ])
    }
    
    func setupNavigationBar() {
        let menuImage = UIImage(systemName: "line.horizontal.3")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: menuImage, style: .plain, target: self, action: #selector(menuAction))
    }

    @objc func menuAction() {
        leadingConstraint.constant = menuShowing ? -200 : 0
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        menuShowing.toggle()
    }
    
    @objc func navigateToNextScreen() {
        // Navegar a la siguiente pantalla
    }
}


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == featuredCollectionView ? viewModel.numberOfCars() : viewModelB.numberOfBranches()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == featuredCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedCollectionViewCell.identifier, for: indexPath) as! FeaturedCollectionViewCell
            let car = viewModel.car(at: indexPath.item) // Usa el método correcto
            let model = FeaturedModelViewCell(title: car.model + " " + car.make, urlToImage: car.image)
            cell.configureView(model: model)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell
            let branch = viewModelB.branch(at: indexPath.item)
            let model = ImageModelViewCell(title: branch.name, urlToImage: branch.image)
            cell.configureView(model: model)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView == featuredCollectionView ? CGSize(width: 300, height: 300) : CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == featuredCollectionView {
            let car = collectionView == featuredCollectionView ? viewModel.car(at: indexPath.item) : viewModel.car(at: indexPath.item)
            
            router?.showDetailViewController(imageURL: car.image, car: car)
        } else {
            let branch = collectionView == imageCollectionView ? viewModelB.branch(at: indexPath.item) : viewModelB.branch(at: indexPath.item)
            router?.showDetailBranchViewController(imageURL: branch.image, branch: branch)
            
        }
    }
}
