//
//  ViewController.swift
//  BYCRefresh
//
//  Created by BYC on 10/25/2022.
//  Copyright (c) 2022 BYC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.navigationController?.pushViewController(TestViewController(), animated: true)
        }
    }
}

