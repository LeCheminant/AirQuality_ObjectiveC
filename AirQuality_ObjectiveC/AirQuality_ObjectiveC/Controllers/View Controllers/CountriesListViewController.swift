//
//  CountriesListViewController.swift
//  AirQuality_ObjectiveC
//
//  Created by Jacob LeCheminant on 1/29/20.
//  Copyright © 2020 Jacob LeCheminant. All rights reserved.
//

import UIKit

class CountriesListViewController: UIViewController {
    //Properties
    var countries: [String] = [] {
        didSet {
            updateTableView()
        }
    }

    //MARK: - Outlets
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        JDLCityAirQualityController.fetchSupportedCountries { (countries) in
            if let countries = countries {
                self.countries = countries
            }
        }

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStatesVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? StatesListViewController
                else {return}
            
            let selectedCountry = countries[indexPath.row]
            
            destinationVC.country = selectedCountry
            
        }
    }
    
    
    func updateTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension CountriesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        let country = countries[indexPath.row]
        cell.textLabel?.text = country
        return cell
    }
}
