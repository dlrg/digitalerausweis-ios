//
//  ProgramCoordinator.swift
//  DLRG.sh
//
//  Created by jb on 11.05.19.
//  Copyright © 2019 DLRG-Jugend Schleswig-Holstein. All rights reserved.
//

import Foundation
import UIKit
import Moya

class ProgramCoordinator: Coordinator {

    private let rootViewController: UINavigationController

    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }

    func start() {
        let viewController = R.storyboard.program.instantiateInitialViewController()!
        viewController.viewModel = ProgramViewModel(service: ProgramService(provider: MoyaProvider()))
        rootViewController.setViewControllers([viewController], animated: true)
    }

    func stop() {
        rootViewController.popViewController(animated: true)
    }
}
