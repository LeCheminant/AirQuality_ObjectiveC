//
//  CityDetailViewController.swift
//  AirQuality_ObjectiveC
//
//  Created by Jacob LeCheminant on 1/30/20.
//  Copyright © 2020 Jacob LeCheminant. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController {

    var country: String?
    var state: String?
    var city: String?
    
    // MARK: - Outlets
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var aqiLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let city = city,
        let state = state,
        let country = country
            else {return}
        
        JDLCityAirQualityController.fetchData(forCity: city, state: state, country: country) { (cityDetails) in
            if let details = cityDetails {
                self.updateViews(with: details)
            }
        }
    }
    
    func updateViews(with details: JDLCityAirQuality) {
        DispatchQueue.main.async {
            self.cityNameLabel.text = details.city
            self.stateLabel.text = details.state
            self.countryLabel.text = details.country
            self.aqiLabel.text = "\(details.pollution.airQualityIndex)"
            self.windSpeedLabel.text = "\(details.weather.windSpeed)"
            self.temperatureLabel.text = "\(details.weather.temperature)"
            self.humidityLabel.text = "\(details.weather.humidity)"
        }
    }

}
