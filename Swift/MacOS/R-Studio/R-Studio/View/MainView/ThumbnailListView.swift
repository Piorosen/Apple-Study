//
//  ThumbnailListView.swift
//  R-Studio
//
//  Created by Aoikazto on 2020/02/08.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI

struct ThumbnailListView: View {
    let elementViewSize = CGSize(width: 150, height: 150)
    let calcSize: (_ size:CGFloat, _ width:CGFloat) -> Int = { s, w in
        let first = Int(s / w)
        let paddingCount = first * 10
        
        return Int((s - CGFloat(paddingCount) - 20) / w)
        
    }
    
    var body: some View {
        GeometryReader { g in
            ScrollView {
                VStack {
                    ForEach (0...10, id: \.self) { a in
                        HStack {
                            ForEach (0..<self.calcSize(g.size.width, self.elementViewSize.width), id: \.self) { b in
                                ThumbnailView()
                                    .frame(width: self.elementViewSize.width, height: self.elementViewSize.height)
                                .padding(0)
                            }
                        }
                        
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(5)
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

#if DEBUG
struct ThumbnailListView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbnailListView()
    }
}
#endif
