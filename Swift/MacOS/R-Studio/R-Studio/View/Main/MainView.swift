//
//  MainView.swift
//  R-Studio
//
//  Created by Aoikazto on 2020/02/08.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack (spacing: 0) {
            SearchView()
                .frame(height: 30)
            Divider()
            HStack (spacing: 0) {
                HSplitView {
                    ThumbnailListView()
                    Divider()
                    SkinnyView()
                        .frame(minWidth:200, maxWidth: 350, alignment: .trailing)
                }   
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
