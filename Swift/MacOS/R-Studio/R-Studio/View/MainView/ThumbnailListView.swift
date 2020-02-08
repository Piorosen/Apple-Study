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
    @State var f1 = false
    @State var f2 = false
    @State var f3 = ""
    
    let image = NSImage.thumbnailImage(with: "/Users/aoikazto/Desktop/a.jpeg", maxWidth: 100)!
    
    var body: some View {
        GeometryReader { g in
            ScrollView {
                VStack(spacing: 0) {
                    ForEach (0...20, id: \.self) { _ in
                        HStack(spacing: 0) {
                            ForEach (0..<Int(g.size.width / self.elementViewSize.width), id: \.self) { _ in
                                ThumbnailView(image: self.image)
                                    .frame(width: self.elementViewSize.width, height: self.elementViewSize.height)
                                    .contextMenu{
                                        Button(action: {self.f2 = true}){
                                            Text("Add")
                                        }
                                        
                                        Button(action: {self.f2 = true}){
                                            Text("Delete")
                                        }
                                        Button(action: {self.f2 = true}){
                                            Text("Modify Info")
                                        }
                                }
                            }
                        }
                        
                    }
                }
            }
        }
        .padding(5)
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
