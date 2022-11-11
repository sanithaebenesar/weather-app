//
//  Models.swift
//  weatherAppIos
//
//  Created by CH 002 on 11/11/22.
//

import Foundation
import ObjectMapper

class Weather : Mappable {
    var location : Location?
    var current : Current?

    required init?(map: Map) {

    }
 func mapping(map: Map) {
        location <- map["location"]
        current <- map["current"]
    }

}

class Current : Mappable {
    var temp_c : Double?
    var temp_f : Double?
    var last_updated : String?
    
    required init?(map: Map) {

    }
func mapping(map: Map) {
        temp_c <- map["temp_c"]
        temp_f <- map["temp_f"]
        last_updated <- map["last_updated"]
    }

}

class Location : Mappable {

    var name : String?

    required init?(map: Map) {

    }

func mapping(map: Map) {

        name <- map["name"]
    }

}

