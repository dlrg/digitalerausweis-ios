//
//  MoyaFactory.swift
//  DLRG.sh
//
//  Created by jb on 11.05.19.
//  Copyright © 2019 DLRG-Jugend Schleswig-Holstein. All rights reserved.
//

import Foundation
import Moya

protocol MoyaFactory {
    func makeMoyaProvider<T: TargetType>() -> MoyaProvider<T>
    func makeMoyaProvider<T: TargetType>(type: T.Type) -> MoyaProvider<T>
}

extension MoyaFactory {
    func makeMoyaProvider<T: TargetType>() -> MoyaProvider<T> {
        return makeMoyaProvider(type: T.self)
    }

    func makeMoyaProvider<T: TargetType>(type: T.Type) -> MoyaProvider<T> {
        return MoyaProvider()
    }
}
