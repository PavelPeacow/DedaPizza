//
//  RestorantsViewController.swift
//  DedaPizza
//
//  Created by Павел Кай on 03.12.2022.
//

import UIKit
import MapKit

class RestorantsViewController: UIViewController {
    
    lazy var mapView: MKMapView = {
        let map = MKMapView()
        let region = centerMapCamera()
        map.setRegion(region, animated: true)
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mapView)
        
        title = "Геолокация наших ресторанов"

        view.backgroundColor = .systemBackground
        setConstraints()
    }
    
    func centerMapCamera() -> MKCoordinateRegion {
       let coordinate = CLLocationCoordinate2D(latitude: 57.148470, longitude: 65.549138)
       let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
       let region = MKCoordinateRegion(center: coordinate, span: span)
       return region
   }
    
    
}

extension RestorantsViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
