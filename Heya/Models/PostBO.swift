//
//  PostBO.swift
//  Heya
//
//  Created by TrungNV on 10/11/19.
//  Copyright © 2019 TrungNV. All rights reserved.
//

import Foundation

class PostBO: NSObject {
    var name: String?
    var time: String?
    var user: UserBO?
    var landmark: LandMarkBO?
    init(name: String, time: String, user: UserBO, landmark: LandMarkBO) {
        self.name = name
        self.time = time
        self.user = user
        self.landmark = landmark
    }
}

class UserBO: NSObject{
    var name: String?
    var age: String?
    var avatarURL: String?
    var info: String?
    init(name: String?, age: String?, avatar: String?, info: String?) {
        self.name = name
        self.age = age
        self.avatarURL = avatar
        self.info = info
    }
    
    func clone() -> UserBO{
        return UserBO(name: self.name, age: self.age, avatar: self.avatarURL, info: self.info)
    }
}

enum TypeLandMark: Int{
    case A = 0
    case B = 1
    case C = 2
}

class LandMarkBO: NSObject {
    var name: String?
    var location: String?
    var imageURL: String?
    var hashTag: String?
    var type: TypeLandMark
    init(name: String, location: String, image: String, hastag: String, typeLand: TypeLandMark) {
        self.name = name
        self.location = location
        self.imageURL = image
        self.hashTag = hastag
        self.type = typeLand
    }
}
