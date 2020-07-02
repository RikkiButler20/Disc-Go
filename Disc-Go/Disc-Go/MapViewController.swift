//
//  MapViewController.swift
//  Disc-Go
//
//  Created by Kayla Butler on 7/1/20.
//  Copyright © 2020 Kayla Butler. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    fileprivate let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locationManager.requestWhenInUseAuthorization();
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()

        mapView.showsUserLocation = true
        
        var annotations : [MKPointAnnotation] = []
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 29.556009, longitude: -98.335480)
        annotation.subtitle = "Live Oak Hillside"
        annotations.append(annotation)
        
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2D(latitude: 29.55735, longitude: -98.29556)
        annotation1.subtitle = "Universal City Disc Golf Course"
        annotations.append(annotation1)
        print("Annotations")
        
        for a in annotations {
            print(a.subtitle)
        }
        
        mapView.showAnnotations(annotations, animated: true)


        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
