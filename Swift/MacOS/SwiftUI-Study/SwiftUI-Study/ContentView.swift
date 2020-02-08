//
//  ContentView.swift
//  SwiftUI-Study
//
//  Created by Aoikazto on 2020/01/23.
//  Copyright © 2020 Aoikazto. All rights reserved.
//
import Foundation
import SwiftUI
import Combine

struct ContentView: View {
    @State var showing = false
    
    var body: some View {
        Image(nsImage: NSImage(contentsOf: URL(fileURLWithPath: "/Users/aoikazto/Desktop/a.jpeg"))!)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
