//
//  ProgramPointViewModel.swift
//  DLRG.sh
//
//  Created by jb on 11.05.19.
//  Copyright © 2019 DLRG-Jugend Schleswig-Holstein. All rights reserved.
//

import Foundation

protocol ProgramPointViewModelType {
    var name: String { get }
    var day: String { get }
}

struct ProgramPointViewModel: ProgramPointViewModelType {
    let name: String
    let day: String

    init(_ point: ProgramPointType) {
        self.name = point.programmname
        self.day = "Tag \(point.day)"
    }
}
