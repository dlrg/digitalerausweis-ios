//
//  ProgramViewModel.swift
//  DLRG.sh
//
//  Created by jb on 11.05.19.
//  Copyright © 2019 DLRG-Jugend Schleswig-Holstein. All rights reserved.
//

import Foundation

protocol ProgramViewModelType {
    var points: [ProgramPointViewModelType] { get }
    var error: Error? { get }
    func loadProgram(_ completion: @escaping (() -> ()))
}

class ProgramViewModel: ProgramViewModelType {

    private let service: ProgramServiceType

    var points: [ProgramPointViewModelType]
    var error: Error?

    func loadProgram(_ completion: @escaping (() -> ())) {
        service.loadProgram { result in
            let viewModelResult = result.map { $0.map(ProgramPointViewModel.init(_:)) }
            switch viewModelResult {
            case .success(let points):
                self.points = points
                self.error = nil
            case .failure(let error):
                self.points = []
                self.error = error
            }
            completion()
        }
    }

    init(service: ProgramServiceType) {
        self.service = service
        self.points = []
        self.error = nil
    }
}
