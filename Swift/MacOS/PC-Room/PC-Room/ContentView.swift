//
//  ContentView.swift
//  PC-Room
//
//  Created by Aoikazto on 2020/02/15.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showAdvertise = true
    
    var body: some View {
        VStack(spacing: 0) {
            Advertise()
                .frame(maxWidth: .infinity, maxHeight: showAdvertise ? 300 : 0, alignment: .top)
                .background(Color.red)
                
            HStack(spacing: 0) {
                Genre()
                GameList(showAd: self.$showAdvertise)
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
