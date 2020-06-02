//
//  ContentView.swift
//  gps-telling
//
//  Created by Aoikazto on 2020/04/23.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI
import CoreLocation
import CallKit

struct ContentView: View {
    @State var draw = false
    
    @State var Middle = [
        InfoModel(name: "전철연", phoneNum: ["051-255-6826"]),
        InfoModel(name: "배분덕", phoneNum: ["010-5751-1711", "070-7374-2712"]),
        InfoModel(name: "김웅배", phoneNum: ["010-5402-0323"]),
        InfoModel(name: "성수영", phoneNum: ["010-2966-6495"])
    ]
    
    @State var West = [InfoModel(name: "이복희", phoneNum: ["010-5591-2733"])]
    
    var body: some View {
        TabView {
            GeneralView(Middle: $Middle, West: $West).tabItem {
                Text("General")
            }
            
            InfoView(Name: "middle", info: $Middle).tabItem {
                Text("중구")
            }
            
            InfoView(Name: "west", info: $West).tabItem {
                Text("서구")
            }
            
            GPSView(createItem: $draw).tabItem {
                Text("Debug")
            }
        }
        .onAppear {
            let file = FileManager.default
            
            let dir = file.urls(for: .documentDirectory, in: .userDomainMask).first
            if dir == nil {
                print("Dir is NIL")
                return
            }
            
            let middleUrl = dir!.appendingPathComponent("middle.info")
            let westUrl = dir!.appendingPathComponent("west.info")
            
            if let read = try? String(contentsOf: middleUrl){
                let line = read.split(separator: "\n")
                for index in line.indices {
                    let dayofWeek = String(line[index]).trimmingCharacters(in: .whitespaces).split(separator:" ")
                    for i in dayofWeek.indices {
                        self.Middle[index].DayOfWeek[i] = Int(String(dayofWeek[i])) == 0 ? false : true
                    }
                }
            }
            
            if let read = try? String(contentsOf: westUrl){
                let line = read.split(separator: "\n")
                for index in line.indices {
                    let dayofWeek = String(line[index]).trimmingCharacters(in: .whitespaces).split(separator:" ")
                    for i in dayofWeek.indices {
                        self.West[index].DayOfWeek[i] = Int(String(dayofWeek[i])) == 0 ? false : true
                    }
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
