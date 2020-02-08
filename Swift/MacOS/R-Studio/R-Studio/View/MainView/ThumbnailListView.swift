//
//  ThumbnailListView.swift
//  R-Studio
//
//  Created by Aoikazto on 2020/02/08.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI

struct ThumbnailListView: View {
    let size = CGSize(width: 150, height: 150)
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach (0...10, id: \.self) { _ in
                    HStack {
                        ForEach (0...5, id: \.self) { _ in
                            ThumbnailView()
                                .frame(width: self.size.width, height: self.size.height)
                        }
                    }
                }
            }
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
