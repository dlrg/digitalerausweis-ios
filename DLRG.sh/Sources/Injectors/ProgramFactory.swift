//
//  ProgramFactory.swift
//  DLRG.sh
//
//  Created by jb on 11.05.19.
//  Copyright © 2019 DLRG-Jugend Schleswig-Holstein. All rights reserved.
//

import Foundation

protocol ProgramFactory {
    func makeProgramListViewController() -> ProgramListViewController
}

extension ProgramFactory where Self: MoyaFactory {
    func makeProgramListViewController() -> ProgramListViewController {
        let provider = makeMoyaProvider(type: ProgramEndpoint.self)
        let service = ProgramService(provider: provider)
        let viewModel = ProgramViewModel(service: service)
        let viewController = R.storyboard.program.instantiateInitialViewController()!
        viewController.viewModel = viewModel
        return viewController
    }
}
