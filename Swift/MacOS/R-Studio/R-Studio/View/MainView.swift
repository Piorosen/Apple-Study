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
        VStack {
            SearchView()
                .frame(height: 30)
                .background(Color.red)
            Spacer(minLength: 0)
            HStack {
                ThumbnailListView()
                    
                Spacer(minLength: 0)
                SkinnyView()
                    .frame(width:200, alignment: .trailing)
                    .background(Color.green)
                Spacer(minLength: 0)
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
