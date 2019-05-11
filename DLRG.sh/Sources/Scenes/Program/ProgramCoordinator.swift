//
//  ProgramCoordinator.swift
//  DLRG.sh
//
//  Created by jb on 11.05.19.
//  Copyright © 2019 DLRG-Jugend Schleswig-Holstein. All rights reserved.
//

import Foundation
import UIKit

class ProgramCoordinator: Coordinator {

    typealias Factory = ProgramFactory

    private let rootViewController: UINavigationController

    private let factory: Factory

    init(rootViewController: UINavigationController, factory: Factory) {
        self.rootViewController = rootViewController
        self.factory = factory
    }

    func start() {
        let viewController = factory.makeProgramListViewController()
        rootViewController.setViewControllers([viewController], animated: true)
    }

    func stop() {
        rootViewController.popViewController(animated: true)
    }
}
