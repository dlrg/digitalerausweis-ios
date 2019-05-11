//
//  ProgramService.swift
//  DLRG.sh
//
//  Created by jb on 11.05.19.
//  Copyright © 2019 DLRG-Jugend Schleswig-Holstein. All rights reserved.
//

import Foundation
import Moya

protocol ProgramServiceType {

    func loadProgram(_ completion: @escaping ((Result<[ProgramPoint], Error>) -> ()))
}

struct ProgramService: ProgramServiceType {

    private let provider: MoyaProvider<ProgramEndpoint>

    func loadProgram(_ completion: @escaping ((Result<[ProgramPoint], Error>) -> ())) {
        provider.request(.list) { result in
            do {
                let response = try result.get()
                completion(Result(catching: { try response
                    .map([ProgramPoint].self)
                    .sorted { p1, p2 in return p1.day < p2.day }
                }))
            } catch {
                completion(Result.failure(error))
            }
        }
    }

    init(provider: MoyaProvider<ProgramEndpoint>) {
        self.provider = provider
    }
}
