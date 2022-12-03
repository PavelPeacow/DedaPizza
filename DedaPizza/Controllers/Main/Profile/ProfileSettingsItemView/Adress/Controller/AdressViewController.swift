//
//  AdressViewController.swift
//  ProfilePageCombine
//
//  Created by Павел Кай on 14.11.2022.
//

import UIKit
import MapKit

class AdressViewController: UIViewController {
    
    lazy var adressTextField = CustomTextField(placeholder: "Адресс", leftIcon: (UIImage(systemName: "mappin.and.ellipse")?.withTintColor(.white, renderingMode: .alwaysOriginal))!, rightIcon: nil)
    
    lazy var mapView: MKMapView = {
        let map = MKMapView()
        let region = centerMapCamera()
        map.setRegion(region, animated: true)
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(adressTextField)
        view.addSubview(mapView)

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

extension AdressViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            adressTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            adressTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            adressTextField.widthAnchor.constraint(equalToConstant: 310),
            adressTextField.heightAnchor.constraint(equalToConstant: 45),
            
            
            mapView.topAnchor.constraint(equalTo: adressTextField.bottomAnchor, constant: 50),
            mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
