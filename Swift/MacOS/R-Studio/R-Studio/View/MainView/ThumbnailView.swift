//
//  ThumbnailView.swift
//  R-Studio
//
//  Created by Aoikazto on 2020/02/08.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI


struct ThumbnailView: View {
    var item: ThumbnailModel
    let image:NSImage
    
    var paddingSize:CGFloat
    
    init(model: ThumbnailModel){
        item = model
        image = item.getNSImage()
        paddingSize = 10
    }
    
    @State var isClick = false

    var body: some View {
        Image(nsImage: self.image)
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(paddingSize)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .border(Color.)
            .scaleEffect(self.isClick ? 0.7 : 1.0)
            .onTapGesture {
                withAnimation {
                    self.isClick.toggle()
                }
            }
    }
}

#if DEBUG
struct ThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbnailView(model: ThumbnailModel(s: CGSize(width: 100, height: 100), file: "/Users/aoikazto/Desktop/a.jpeg"))
    }
}
#endif
