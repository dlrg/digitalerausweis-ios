//
//  ProgramEndpoint.swift
//  DLRG.sh
//
//  Created by jb on 11.05.19.
//  Copyright © 2019 DLRG-Jugend Schleswig-Holstein. All rights reserved.
//

import Foundation
import Moya

enum ProgramEndpoint {
    case list
}

extension ProgramEndpoint: TargetType {
    var baseURL: URL {
        return URL(string: "http://api.dlrg.sh:3000/")!
    }

    var path: String {
        switch self {
        case .list:
            return "listprogramm"
        }
    }

    var method: Moya.Method {
        switch self {
        case .list:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .list:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        return nil
    }
}
