//
//  Request.swift
//  Getting data from API
//
//  Created by Macbook Air 2017 on 22. 11. 2023..
//

import Foundation
import UIKit

class Request {
    
    static public func getData(from url: String) {
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
