//
//  ProgramPoint.swift
//  DLRG.sh
//
//  Created by jb on 11.05.19.
//  Copyright © 2019 DLRG-Jugend Schleswig-Holstein. All rights reserved.
//

import Foundation

protocol ProgramPointType {
    var programmname: String { get }
    var ort: String { get }
    var day: Int { get }
}

struct ProgramPoint: ProgramPointType {
    let programmname: String
    let ort: String
    let day: Int
}

extension ProgramPoint: Codable {}
