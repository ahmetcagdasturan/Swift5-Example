//
//  ViewController.swift
//  SeguesExample2
//
//  Created by ahmetcagdasturan on 2.07.2019.
//  Copyright © 2019 ahmetcagdasturan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainPageLabel: UILabel!
    @IBOutlet weak var mailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    var mail = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "fromFirstToSecond"{
            
            let targetViewController = segue.destination as! SettingsViewController
            targetViewController.myData = mail
        }
    }
    

    @IBAction func moveToSettings(_ sender: Any) {
       
        mail = mailText.text!
        UserDefaults.standard.set("user", forKey: "mail")
        UserDefaults.standard.set("1234", forKey: "pass")
        UserDefaults.standard.synchronize()
        
        let mail = UserDefaults.standard.object(forKey: "mail")
        let password = UserDefaults.standard.object(forKey: "pass")
        
        if let OptMail = mail as? String{
            if let OptPass = password as? String{
                if mailText.text! == OptMail && passwordText.text! == OptPass{
                   performSegue(withIdentifier: "fromFirstToSecond", sender: nil)
                }else{
                    let alert = UIAlertController(title: "Warning !", message: "Mail or password is not correct !", preferredStyle: UIAlertController.Style.alert)
                    
                    let button = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                    alert.addAction(button)
                    self.present(alert, animated: true, completion: nil)
                    
                }
            }
        }
    }
}
