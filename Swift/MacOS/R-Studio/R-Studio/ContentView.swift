//
//  ContentView.swift
//  R-Studio
//
//  Created by Aoikazto on 2020/02/08.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var searchText = ""
    @State var showCancelButton = false
    
    var body: some View {
        MainView()
        .frame(maxWidth:.infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
