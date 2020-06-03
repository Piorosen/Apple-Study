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
    @State var saveMyPosition = false
    @State var saveMyFile = false
    @State var eventPlayBack = false
    
    @State var Middle = [
        InfoModel(name: "전철연", phoneNum: ["051-255-6826"], location: [
            CLLocationCoordinate2D(latitude: 35.10423636737664, longitude:129.0262232718265),
            CLLocationCoordinate2D(latitude: 35.104308836167235, longitude:129.02646231945062),
            CLLocationCoordinate2D(latitude: 35.10403434782398, longitude:129.02663280774658),
            CLLocationCoordinate2D(latitude: 35.10398818603947, longitude:129.02630517901056)
        ]),
        InfoModel(name: "배분덕", phoneNum: ["010-5751-1711", "070-7374-2712"], location: [
            CLLocationCoordinate2D(latitude: 35.10554998986448, longitude:129.02877718334915),
            CLLocationCoordinate2D(latitude: 35.105293326636776, longitude:129.0288748855713),
            CLLocationCoordinate2D(latitude: 35.10535282993796, longitude:129.02919838846827),
            CLLocationCoordinate2D(latitude: 35.105655674507176, longitude:129.0290996006824),
        ]),
        InfoModel(name: "김웅배", phoneNum: ["010-5402-0323"], location: [
            CLLocationCoordinate2D(latitude: 35.10554998986448, longitude:129.02877718334915),
            CLLocationCoordinate2D(latitude: 35.105293326636776, longitude:129.0288748855713),
            CLLocationCoordinate2D(latitude: 35.10535282993796, longitude:129.02919838846827),
            CLLocationCoordinate2D(latitude: 35.105655674507176, longitude:129.0290996006824),
        ]),
        InfoModel(name: "성수영", phoneNum: ["010-2966-6495"], location: [
            CLLocationCoordinate2D(latitude: 35.107316397675746, longitude:129.03261687058898),
            CLLocationCoordinate2D(latitude: 35.108218713497195, longitude:129.03318240677623),
            CLLocationCoordinate2D(latitude: 35.10772608823759, longitude:129.03384810270495),
            CLLocationCoordinate2D(latitude: 35.10711311029173, longitude:129.03331391099402),
        ])
    ]
    
    @State var West = [InfoModel(name: "이복희", phoneNum: ["010-5591-2733"], location: [CLLocationCoordinate2D]())]
    
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
            
            VStack{
                GPSView(saveMyPosition: self.$saveMyPosition, saveMyFile: self.$saveMyFile, eventPlayBack: self.$eventPlayBack)
                HStack {
                    Button(action: {
                        self.saveMyPosition.toggle()
                    }){
                        Text("Position 상태 : \(String(self.saveMyPosition))")
                    }.frame(minHeight: 50)
                    Button(action: {
                        self.saveMyFile.toggle()
                    }){
                        Text("Save 상태 : \(String(self.saveMyFile))")
                    }
                    Button(action: {
                        self.eventPlayBack.toggle()
                    }){
                        Text("PlayBack")
                    }
                }
                
                
            }.tabItem {
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
