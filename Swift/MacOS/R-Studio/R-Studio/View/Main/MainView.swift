//
//  MainView.swift
//  R-Studio
//
//  Created by Aoikazto on 2020/02/08.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @Binding var pageType:ZipThumb
    @Binding var readNow:String
    
    var body: some View {
        VStack (spacing: 0) {
            SearchView()
                .frame(height: 30)
            Divider()
            HStack (spacing: 0) {
                HSplitView {
                    ThumbnailListView(pageType: self.$pageType, readNow: self.$readNow)
                    Divider()
                    SkinnyView()
                        .frame(minWidth:200, maxWidth: 350, alignment: .trailing)
                }   
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#if DEBUG
//struct MainView_Previews: PreviewProvider {
//    @State var result = ZipThumb().clear(fileName: "/Users/aoikazto/Desktop/1.zip")
//    
//    static var previews: some View {
//        MainView(pageType: self.)
//    }
//}
#endif
