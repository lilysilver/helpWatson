//
//  HospitalViewController.swift
//  Help Watson
//
//  Created by Sonera Tayub on 26/05/2018.
//  Copyright © 2018 helpWatson. All rights reserved.
//

import UIKit
import MapKit



class MapPin : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}

class HospitalViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView?
    @IBOutlet weak var tableView: UITableView?
    var locationManager: CLLocationManager?
    var hospitals = [Hospital]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.populateTableView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        determineMyCurrentLocation()
    }
    
    func populateTableView() {
        // get your data
        
        if let path = Bundle.main.url(forResource: "hospitaldata", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: path, options: .mappedIfSafe)
                let hospitaldata = try JSONDecoder().decode([Hospital].self, from: jsonData)
                print(hospitaldata)
                DispatchQueue.main.async {
                    self.hospitals = hospitaldata
                    var annotations = [MapPin]()
                    for hospital in self.hospitals {
                        annotations.append(MapPin(coordinate: CLLocationCoordinate2D(latitude: hospital.lat, longitude: hospital.long), title: hospital.name, subtitle: "#\(hospital.rank)"))
                    }
                    self.mapView?.addAnnotations(annotations)
                    self.tableView?.reloadData()
                }
            } catch {
                print("couldn't parse JSON Data")
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hospitals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "hospitalTableCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HospitalTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let hospital = hospitals[indexPath.row]
        
        cell.nameLabel?.text = hospital.name
        cell.addressLabel?.text = hospital.address
        cell.rankLabel?.text = String(hospital.rank)
        //cell.treatmentLabel?.text = String(hospital.treatmentTime)
        
        self.tableView?.allowsSelection = false 
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager?.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        defer {
            manager.stopUpdatingLocation()
        }
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        // manager.stopUpdatingLocation()
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        
//        let initialLocation = CLLocation(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let initialLocation = CLLocation(latitude: 40.756429, longitude: -73.977823)
        
        centerMapOnLocation(location: initialLocation)
        
        guard let mapView = mapView else {
            return
        }
        let annotation = MapPin(coordinate: initialLocation.coordinate, title: "Your Location", subtitle: nil)
        mapView.addAnnotation(annotation)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
    
    let regionRadius: CLLocationDistance = 3000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView?.setRegion(coordinateRegion, animated: true)
    }
}
