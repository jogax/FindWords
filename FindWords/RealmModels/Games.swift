//
//  Games.swift
//  DuelOfWords
//
//  Created by Romhanyi Jozsef on 2020. 06. 02..
//  Copyright © 2020. Romhanyi Jozsef. All rights reserved.
//


import Foundation
import RealmSwift

class Games: Object {
    @objc dynamic var primary = "" // language + gameNumber + size
    @objc dynamic var language = ""
    @objc dynamic var gameNumber = 0
    @objc dynamic var size = 0
    @objc dynamic var gameArray = ""
    @objc dynamic var words = ""
    @objc dynamic var OK = true
    @objc dynamic var errorCount = 0
    @objc dynamic var timeStamp = NSDate()
    override  class func primaryKey() -> String {
        return "primary"
    }
}
