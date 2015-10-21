//
//  ViewController.swift
//  Map Demo
//
//  Created by Jesus Lopez de Nava on 7/16/15.
//  Copyright (c) 2015 LodenaApps. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var map: MKMapView!
    
    @IBOutlet var speedLabel: UILabel!
    
    @IBAction func centerMap(sender: AnyObject) {
        
        auto = false
    }
    
    @IBAction func autoTracking(sender: AnyObject) {
        
        auto = true
        
    }
    
    var auto = true
    
//    var pinColor = 1
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.map.delegate = self
        
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
        
        // Apple's Headquartes ==>  37.332097, -122.031180
        // Home's coordinates ==> 33.217880, -96.935739
        
//        let latitude:CLLocationDegrees = 37.332097
//        
//        let longitude:CLLocationDegrees = -122.031180
//
//        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
//        
//        let latDelta:CLLocationDegrees = 0.005
//    
//        let lonDelta:CLLocationDegrees = 0.005
//        
//        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
//        
//        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
//        
        map.showsUserLocation = true
//        
//        map.setRegion(region, animated: true)
//
//        let annotation = MKPointAnnotation()
//        
//        annotation.coordinate = location
//        
//        annotation.title = "Lopez de Nava Family"
//        
//        annotation.subtitle = "Cool!"
//        
//        map.addAnnotation(annotation)
//
//        let uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
//        
//        uilpgr.minimumPressDuration = 2
//        
//        map.addGestureRecognizer(uilpgr)
//        
    }
//    
//    func action(gestureRecognizer: UIGestureRecognizer) {
//        
//        if gestureRecognizer.state == UIGestureRecognizerState.Began {
//            
//            let touchPoint = gestureRecognizer.locationInView(self.map)
//            
//            let newCoordinate: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
//            
//            let annotation = MKPointAnnotation()
//            
//            annotation.coordinate = newCoordinate
//            
//            annotation.title = "New Place"
//            
//            annotation.subtitle = "Also Cool!"
//            
//            map.addAnnotation(annotation)
//        
//        }
//
//    }
    
//    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
//        
//        let av: MKPinAnnotationView = MKPinAnnotationView()
//
//        if pinColor == 1 {
//            
//            av.pinColor = .Red
//            
//        } else if pinColor == 2 {
//            
//            av.pinColor = .Green
//            
//        } else {
//            
//            av.pinColor = .Purple
//            
//        }
//        
//        pinColor++
//        
//        if pinColor == 4 {
//        
//            pinColor = 1
//        
//        }
//        
//        av.animatesDrop = true
//        
//        av.canShowCallout = true
//        
//        return av
//        
//    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation: CLLocation = locations[0] as CLLocation
        
        let latitude = userLocation.coordinate.latitude
        
        let longitude = userLocation.coordinate.longitude
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let latDelta:CLLocationDegrees = 0.005
        
        let lonDelta:CLLocationDegrees = 0.005
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        if auto {
            
            map.setRegion(region, animated: true)
            
        }
        
        let speed = String(stringInterpolationSegment: userLocation.speed)
        
        speedLabel.text = "My Speed is " + speed + " m/h"

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

