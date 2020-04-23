//
//  ContentView.swift
//  gps-telling
//
//  Created by Aoikazto on 2020/04/23.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Point {
    var X:Double
    var Y:Double
}

struct ContentView: View {
    @State var position:Point
    var locManager = CLLocationManager()
    
    
    var body: some View {
        HStack {
            Button(action: {
                self.position.X = Double.random(in: 0..<10)
                self.position.Y = Double.random(in: 0..<10)
                
            }, label: {
                Text("Click Me")
            })
            
            Text("\(self.position.X), \(self.position.Y)")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(position: Point(X: 1.0, Y: 2.0))
    }
}
