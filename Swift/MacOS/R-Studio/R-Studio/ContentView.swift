//
//  ContentView.swift
//  R-Studio
//
//  Created by Aoikazto on 2020/02/08.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI
import ZIPFoundation

struct ContentView: View {
    @State var searchText = ""
    @State var showCancelButton = false
    @State var zip = ZipThumb()
    @State var nowReadPage = "t"
    
    var body: some View {
        GeometryReader { g in
            
            MainView(pageType: self.$zip, readNow: self.$nowReadPage)
                .frame(maxWidth:.infinity, maxHeight: .infinity)
            
            Reader(read: self.$zip, viewModel: ReaderViewModel(read: self.zip))
                .offset(x: self.nowReadPage == self.zip.fileName ? 0 : -g.size.width, y: 0)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
