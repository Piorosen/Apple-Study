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
    
    var body: some View {
        VStack {
            GPSView(createItem: $draw)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                Button(action: {
//                    self.draw = true
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//                        self.draw = false
//                    }
                    let strCallNo: String = "01071693725"
                    UIApplication.shared.openURL(URL(string: "facetime://"+strCallNo)!)
                    let telUrl = URL(string: strCallNo)
                    if ((telUrl) != nil){
                        if(UIApplication.shared.canOpenURL(telUrl!)){
                            
                        }else
                        {
                            print("Call not available")
                        }
                    }
                    
                }, label: { Text("\(self.draw ? "True" : "False")") })
            }.frame(maxWidth: .infinity, minHeight: 150)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
