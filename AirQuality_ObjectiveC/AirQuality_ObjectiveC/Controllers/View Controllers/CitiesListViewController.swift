//
//  CitiesListViewController.swift
//  AirQuality_ObjectiveC
//
//  Created by Jacob LeCheminant on 1/29/20.
//  Copyright © 2020 Jacob LeCheminant. All rights reserved.
//

import UIKit

class CitiesListViewController: UIViewController {
    
    var country: String?
    var state: String?
    var cities: [String] = [] {
        didSet {
            updateTableView()
        }
    }
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        guard let state = state,
            let country = country else {return}
        JDLCityAirQualityController.fetchSupportedCities(inState: state, country: country) { (cities) in
            if let cities = cities {
                self.cities = cities
            }
        }
    }
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCityDetailsVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
            let country = country,
            let state = state,
                let destinationVC = segue.destination as? CityDetailViewController
                else {return}
            
            let selectedCity = cities[indexPath.row]
            destinationVC.country = country
            destinationVC.state = state
            destinationVC.city = selectedCity
        }
     }
     
    
    func updateTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

extension CitiesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        let city = cities[indexPath.row]
        cell.textLabel?.text = city
        return cell
    }
}

