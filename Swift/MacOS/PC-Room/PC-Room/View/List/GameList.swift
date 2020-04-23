//
//  GameList.swift
//  PC-Room
//
//  Created by Aoikazto on 2020/02/16.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI

struct GameList: View {
    @Binding var showAd:Bool
    
    var body: some View {
        VStack {
            Text("인기 게임")
            HStack {
                Text("이미지 덩어리들")
            }
            Divider()
            ScrollView {
                List {
                    VStack {
                        EmptyView()
                        EmptyView()
                        EmptyView()
                        EmptyView()
                    }
                }
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct GameList_Previews: PreviewProvider {
    @State static var showAdvertise = true
    static var previews: some View {
        GameList(showAd: self.$showAdvertise)
    }
}
