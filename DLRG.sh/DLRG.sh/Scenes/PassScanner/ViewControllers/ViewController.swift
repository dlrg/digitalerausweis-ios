//
//  ViewController.swift
//  DLRG.sh
//
//  Created by jb on 11.05.19.
//  Copyright © 2019 DLRG-Jugend Schleswig-Holstein. All rights reserved.
//

import UIKit

protocol ViewControllerCoordinatorDelegate: class {
    func viewController(didStartScan: ViewController)
}

class ViewController: UIViewController {

    weak var coordinatorDelegate: ViewControllerCoordinatorDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapScan(_ sender: Any) {
        coordinatorDelegate?.viewController(didStartScan: self)
    }

    func receiveScannerResult(pass: Pass) {
        print(pass)
    }
}
