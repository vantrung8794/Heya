//
//  historyBO.swift
//  Heya
//
//  Created by TrungNV on 10/15/19.
//  Copyright © 2019 TrungNV. All rights reserved.
//

import Foundation
class HistoryBO: NSObject {
    var title: String?
    var time: String?
    var location: String?
    var isOk: Bool = false
    
    init(title: String, time: String, location: String, isOk: Bool) {
        self.title = title
        self.time = time
        self.location = location
        self.isOk = isOk
    }
}
