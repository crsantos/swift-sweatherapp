//
//  ViewController.swift
//  Sweather
//
//  Created by Carlos Santos on 27/09/14.
//  Copyright (c) 2014 Carlos Santos. All rights reserved.
//

import UIKit
import OpenWeatherMapSDK

class ViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Vars
    
    var sdk:OpenWeatherMapSDK!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: enter your API key HERE
        self.sdk = OpenWeatherMapSDK(appKey: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func viewDidAppear(animated: Bool) {
        
        println(OpenWeatherMapSDKVersionNumber)
        
        self.activityIndicator.startAnimating()
        
        let task = self.sdk.searchByNameTask("London,UK", completion: { (obj, success) -> Void in
            
            if (success!){
                
                println("Completed request with success? \(success), response => \(obj)")
                self.updateWithCity(obj as City)
                
            } else{
                
                println("ERROR ON REQUEST!")
            }
            
            self.activityIndicator.stopAnimating()
        })
    }
    
    // MARK: - Private
    
    func updateWithCity(city: City) {
        
        self.cityNameLabel.text = city.name
    }
}

