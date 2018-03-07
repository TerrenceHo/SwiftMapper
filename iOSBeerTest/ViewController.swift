//
//  ViewController.swift
//  iOSBeerTest
//
//  Created by Kevin on 3/6/18.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit
import NavisensCore
import NavisensMaps

//Want to be able to determine height
//getLocation() -> Location

// TODO
// Track location in a current UIView
// When a user starts moving upwards/downwards, then save the current UIView
// On a new level, start a new floor plan
// Saves floor plans on a new tab
// When you go back onto a previous floor, reload that same UIView

@IBDesignable
class ViewController: UIViewController {
    
    @IBOutlet weak var mapContainer: UIView!
//    @IBOutlet weak var buttonController: UIButton!
    
    let DEVKEY = "gTT2WrESuRrZESypSjpyGTllKzLXBJcd2TYda0FSyfKybqmCJ4uIMZeA3yKywjGJ" // Dev Key
    private var core: NavisensCore?
    private var maps: NavisensMaps?
    private var maps_list = [NavisensMaps]()  // list of all saved navisens maps
    private var floor = 1
    private var isPaused = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = 10
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
    
        // Do any additional setup after loading the view, typically from a nib.
        
        core = NavisensCore(DEVKEY)
        
        maps = core!.add(NavisensMaps.self)?
            .useLocalOnly()
//            .addControls()
            .showPath()
            .hideMarkers()
            .addTo(mapContainer)
        
        
        
//        maps_list.append(maps!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonHandler(_ sender: UIButton) {
        
        
        if (isPaused) {
            maps?.resume()
            
            print("Resumed")
            isPaused = false
        }
        else {
            maps?.pause()
            
            print("Paused")
            isPaused = true
        }
    }
}

