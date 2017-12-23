//
//  ViewController.swift
//  JSONParser
//
//  Created by Park GilNam on 2017. 12. 23..
//  Copyright © 2017년 ParkGilNam. All rights reserved.
//

import UIKit

struct Weather:Decodable {
    let country:String
    let weather:String
    let temperature:String
}

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    var datalist = [Weather]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonURLString = "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/swift4weather.json"
        
        guard let jsonURL = URL(string: jsonURLString) else {
            return
        }
        
        indicatorView.startAnimating()
        
        URLSession.shared.dataTask(with: jsonURL, completionHandler: {(data, response, error) -> Void in
            guard let data = data else {
                return
            }
            
            do {
                self.datalist = try JSONDecoder().decode([Weather].self, from: data)
                
                DispatchQueue.main.async(execute: {
                    self.mainTableView.reloadData()
                    self.indicatorView.stopAnimating()
                })                
            } catch {
                print("Parsing error \(error)")
            }
        }).resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datalist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherCell
        
        let structTemp = datalist[indexPath.row]
        
        let weatherStr = structTemp.weather
        
        cell.countryLabel.text = structTemp.country
        cell.weatherLabel.text = weatherStr
        cell.temperatureLabel.text = structTemp.temperature
        
        if weatherStr == "맑음" {
            cell.imgView.image = UIImage(named: "sunny.png")
        } else if weatherStr == "우박" {
            cell.imgView.image = UIImage(named: "blizzard.png")
        } else if weatherStr == "흐림" {
            cell.imgView.image = UIImage(named: "cloudy.png")
        } else if weatherStr == "비" {
            cell.imgView.image = UIImage(named: "rainy.png")
        } else if weatherStr == "눈" {
            cell.imgView.image = UIImage(named: "snow.png")
        }
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

