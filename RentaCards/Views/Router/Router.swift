//
//  Router.swift
//  RentaCards
//
//  Created by Jose Preatorian on 09-10-24.
//

import Foundation
import UIKit
import CoreLocation

class Router {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showDetailViewController(imageURL: String, car: Car) {
        let detailViewController = HomeDetailsViewController()
        detailViewController.car = car
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    func showDetailBranchViewController(imageURL: String, branch: Branch) {
        let detailViewController = BranchDetailsViewController()
        detailViewController.branch = branch
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func showMapa(latitude: CLLocationDegrees,longitude: CLLocationDegrees){
        let ViewController = MapViewController()
        ViewController.latitude
        ViewController.longitude
        navigationController?.pushViewController(ViewController, animated: true)
    }
    
    func showrentacar(cars: Car){
        let ViewController = ReservationViewController()
        ViewController.car = cars
        navigationController?.pushViewController(ViewController, animated: true)
    }
    
    func navigateToConfig() {
//        let nextViewController = ConfigViewController()
//        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
