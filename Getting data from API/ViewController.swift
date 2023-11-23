//
//  ViewController.swift
//  Getting data from API
//
//  Created by Macbook Air 2017 on 22. 11. 2023..
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // The first thing we need is a url to get data from
        // We also need a struct or a class to map the data once we get it back from the url.
        
        let url = "https://api.sunrise-sunset.org/json?date=2020-01-01&lat=-74.0060&lng=40.7128&formatted=0"
        Request.getData(from: url)
    }
}

