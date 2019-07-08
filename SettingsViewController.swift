//
//  SettingsViewController.swift
//  SeguesExample2
//
//  Created by ahmetcagdasturan on 2.07.2019.
//  Copyright © 2019 ahmetcagdasturan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsPageLable: UILabel!
    @IBOutlet weak var data: UILabel!
    var myData = ""
    @IBOutlet weak var counterLabel: UILabel!
    var counter : Int = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        data.text = "İncoming value is \(myData)"
        
        counter = 15
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SettingsViewController.passingTime), userInfo: nil, repeats: true)
        
        counterLabel.text = String(counter)
    }
    
    @IBAction func MoveToMain(_ sender: UIButton) {
        
        performSegue(withIdentifier: "formSecondToFirst", sender: nil)
    }
    @objc func passingTime(){
        counterLabel.text = String(counter)
        counter = counter - 1
        
        if counter == 0{
            timer.invalidate()
            performSegue(withIdentifier: "fromSettingsToCategories", sender: nil)
        }
        
    }
    
}
