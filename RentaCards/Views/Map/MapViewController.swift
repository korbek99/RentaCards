//
//  MapViewController.swift
//  RentaCards
//
//  Created by Jose Preatorian on 05-10-24.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var latitude: CLLocationDegrees?
    var longitude: CLLocationDegrees?
    private var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Location"
        setupMapView()
        showLocationOnMap()
    }

    private func setupMapView() {
        mapView = MKMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(mapView)
    }

    private func showLocationOnMap() {
        guard let lat = latitude, let long = longitude else { return }
        
        let location = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Selected Location"
        mapView.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        mapView.selectAnnotation(annotation, animated: true)
    }
}

