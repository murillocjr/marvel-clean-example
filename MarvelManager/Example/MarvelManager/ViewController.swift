//
//  ViewController.swift
//  MarvelManager
//
//  Created by Jorge Murillo on 06/11/2021.
//  Copyright BCP 2021 - Jorge Murillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let infoLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        infoLabel.numberOfLines = 2
        infoLabel.textAlignment = .center
        infoLabel.text = "This Library doesn't implement Visual Components"
        view.addSubview(infoLabel)
        infoLabel.center = view.center
    }
}

