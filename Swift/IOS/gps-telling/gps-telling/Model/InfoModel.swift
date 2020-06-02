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
    
    init(name:String, phoneNum:[String]) {
        self.Name = name
        self.PhoneNum = phoneNum
    }
    
    let Name:String
    let PhoneNum: [String]
    
//    var Location:[CLLocationCoordinate2D]
    
    var DayOfWeek = [false, false, false, false, false]
    static let DayOfName = ["월", "화", "수", "목", "금"]
}
