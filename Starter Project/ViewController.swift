//
//  ViewController.swift
//  Starter Project
//
//  Created by Ahmed M. Hassan on 26/03/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        print("button pressed 10 ")
        let sb = UIStoryboard(name: "New", bundle: nil)
        let destVC = sb.instantiateViewController(identifier: "NewViewController") as! NewViewController
        present(destVC, animated: true, completion: nil)
    }
}

