//
//  InfoModel.swift
//  gps-telling
//
//  Created by Aoikazto on 2020/06/01.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit

struct InfoModel : Identifiable {
    var id = UUID()
    
    init(name:String, phoneNum:[String], location:[CLLocationCoordinate2D]) {
        self.Name = name
        self.PhoneNum = phoneNum
        self.Location = location
    }
    
    let Name:String
    let PhoneNum: [String]
    
    var Location = [CLLocationCoordinate2D]()
    
    func IsCallTiming(pos:CLLocationCoordinate2D) -> Bool {
        if (Location.count != 0){
            
            var crosses = 0;
            
            for i in Location.indices {
                let j = (i + 1) % Location.count
                if (Location[i].longitude > pos.longitude) != (Location[j].longitude > pos.longitude) {
                    let atX = (Location[j].latitude - Location[i].latitude)*(pos.longitude-Location[i].longitude)/(Location[j].longitude-Location[i].longitude)+Location[i].latitude;
                    if (pos.latitude < atX) {
                        crosses += 1
                    }
                }
            }
            
            return crosses % 2 > 0
        }
        return false
    }
    var DayOfWeek = [false, false, false, false, false]
    static let DayOfName = ["월", "화", "수", "목", "금"]
}
