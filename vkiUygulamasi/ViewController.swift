//
//  ViewController.swift
//  vkiUygulamasi
//
//  Created by macbook on 29.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var erkekButton: UIButton!
    
    @IBOutlet weak var kadinButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        erkekButton.layer.cornerRadius = 15
        kadinButton.layer.cornerRadius = 15
        
        
        erkekButton.layer.shadowColor = UIColor.white.cgColor
        erkekButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        erkekButton.layer.shadowOpacity = 1.0  // gölge opaklığı 0.0 ile 1.0 aralığında
        erkekButton.layer.shadowRadius = 4    // gölgenin yuvarlak köşesini belirtir

 
        kadinButton.layer.shadowColor = UIColor.white.cgColor
        kadinButton.layer.shadowOffset = CGSize(width: 2, height: 4)
        kadinButton.layer.shadowOpacity = 1.0  // gölge opaklığı 0.0 ile 1.0 aralığında
        kadinButton.layer.shadowRadius = 4    // gölgenin yuvarlak köşesini belirtir
 

    }
    
    @IBAction func erkekButon(_ sender: Any) {
        performSegue(withIdentifier: "aktarim1", sender: nil)
        
    }
    

    @IBAction func kadinButon(_ sender: Any) {
        performSegue(withIdentifier: "aktarim2", sender: nil)
        
    }
    
}

