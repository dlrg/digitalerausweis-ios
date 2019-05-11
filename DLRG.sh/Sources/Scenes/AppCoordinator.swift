//
//  AppCoordinator.swift
//  DLRG.sh
//
//  Created by jb on 11.05.19.
//  Copyright © 2019 DLRG-Jugend Schleswig-Holstein. All rights reserved.
//

import Foundation
import UIKit
import Moya

class AppCoordinator: Coordinator {

    typealias Factory = ProgramFactory

    private var children: [Coordinator]

    private let factory: Factory

    private let window: UIWindow

    private let rootViewController: UINavigationController

    init(_ window: UIWindow, factory: Factory) {
        self.window = window
        children = []
        rootViewController = UINavigationController()
        self.factory = factory
    }

    func start() {
        let programCoordinator = ProgramCoordinator(rootViewController: rootViewController, factory: factory)
        programCoordinator.start()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }

    func stop() {
        children.forEach { $0.stop() }
    }
}
/*
extension AppCoordinator: ViewControllerCoordinatorDelegate {
    func viewController(didStartScan: ViewController) {
        let scanner = ScannerViewController()
        scanner.delegate = self
        viewController.present(scanner, animated: true)
    }
}

extension AppCoordinator: ScannerViewControllerDelegate {
    func scannerViewController(_ scanner: ScannerViewController, didScanBarcode code: String) {
        let decoder = JSONDecoder()
        do {
            let pass = try decoder.decode(Pass.self, from: code.data(using: .utf8)!)
            viewController.receiveScannerResult(pass: pass)
            scanner.dismiss(animated: true)
        } catch {
            scanner.present(errorAlert(message: "Der von dir gescannte Code ist ungültig"), animated: true)
        }
    }

    func scannerViewController(_ scanner: ScannerViewController, didFail error: Error) {
        scanner.present(errorAlert(error), animated: true) { scanner.dismiss(animated: true) }
    }

    private func errorAlert(message: String) -> UIAlertController {
        let alert = UIAlertController(title:  "Fehler 😢", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        return alert
    }

    private func errorAlert(_ error: Error) -> UIAlertController {
        return errorAlert(message: error.localizedDescription)
    }
}
*/
