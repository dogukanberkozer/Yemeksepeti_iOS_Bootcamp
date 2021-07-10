//
//  MapViewController.swift
//  Map
//
//  Created by Dogukan Berk Ozer on 11.07.2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    
    let locationManager = CLLocationManager()
    var lastLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        checkLocationServices()
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func showUserLocationCenterMap() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 100, longitudinalMeters: 100)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {}
    }
    
    func checkLocationAuthorization() {
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse:
            trackingLocation()
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways:
            break
        case .restricted:
            break
        @unknown default:
            fatalError("fatal error")
        }
    }
    
    // location of the pin
    func trackingLocation() {
        mapView.showsUserLocation = true
        showUserLocationCenterMap()
        locationManager.startUpdatingLocation()
        lastLocation = getCenterLocation(mapView: mapView)
    }
    
    func getCenterLocation(mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }

}


extension MapViewController: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        let center = getCenterLocation(mapView: mapView)
        let geoCoder = CLGeocoder()
        
        guard let lastLocation = lastLocation else { return }
        
        guard center.distance(from: lastLocation) > 30 else { return }
        self.lastLocation = center
        
        geoCoder.reverseGeocodeLocation(center) { [weak self] (placemarks, error) in
            
            guard let self = self else { return }
            
            if let error = error {
                print(error)
                return
            }
            
            guard let placemark = placemarks?.first else { return }
            
            let name = placemark.name ?? "Name"
            let iso = placemark.isoCountryCode ?? "Iso"
            let postalCode = placemark.postalCode ?? "PostalCode"
            let subLocality = placemark.subLocality ?? ""
            let city = placemark.locality ?? "City"
            let street = placemark.thoroughfare ?? "Street"
            
            self.addressLabel.text = "\(name), \(street), \(subLocality), \(city) \(postalCode), \(iso)"
        }
    }
    
}
