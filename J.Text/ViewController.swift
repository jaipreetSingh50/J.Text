//
//  ViewController.swift
//  J.Text
//
//  Created by Jaypreet on 22/07/20.
//  Copyright © 2020 Jaipreet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var text: Text!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        text.UpdateFrame()
    }
}

