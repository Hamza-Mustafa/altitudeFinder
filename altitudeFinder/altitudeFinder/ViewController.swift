//
//  ViewController.swift
//  altitudeFinder
//
//  Created by Hamza Mustafa on 03/11/2020.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var altitudeLabel: UILabel!
    
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
}

extension ViewController : CLLocationManagerDelegate {
 
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            let altitude = lastLocation.altitude
            altitudeLabel.text = "Altitude is \(altitude)"
        }
    }
}
