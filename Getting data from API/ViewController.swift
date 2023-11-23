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
        getData(from: url)
    }
    
    private func getData(from url: String) {
        var result: Response?

        //We will utilize the url session
        let task = URLSession.shared.dataTask(with: URLRequest(url: URL(string: url)!), completionHandler: {data, response, error in
            guard let data = data, error == nil else {
                print("Something went wrong.")
                return
            }
            
            // Now that we have the data we need to convert the data which is bytes to our model struct(Result) and it is knows as JSON decoding

            do {
                result = try JSONDecoder().decode(Response.self, from: data)
            }
            catch {
                print("Failed to convert \(error.localizedDescription)")
            }
            
            guard let json = result else {
                return
            }
            print(json.status)
            print(json.results.sunrise)
            print(json.results.sunset)
            print(json.results.astronomical_twilight_begin)
        })
        task.resume()
    }
}

