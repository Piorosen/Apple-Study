//
//  ThumbnailView.swift
//  R-Studio
//
//  Created by Aoikazto on 2020/02/08.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI


struct ThumbnailView: View {
//    var item: ThumbnailModel
    let image:NSImage
    
    var paddingSize:CGFloat = 10
    let fileName:String
    @Binding var pageType:ZipThumb
    @Binding var readNow:String
    
    @State var isClick = false
    
    var body: some View {
        Image(nsImage: self.image)
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 20))
            //            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.primary , lineWidth: self.isClick ? 4 : 0))
            .padding(paddingSize)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .scaleEffect(self.isClick ? 0.7 : 1.0)
            .onTapGesture {
                withAnimation {
                    
                    DispatchQueue.main.async {
                        self.isClick.toggle()
                        self.readNow = self.fileName
                        let _ = self.pageType.clear(fileName: self.fileName)
                    }
                    
                }
            }
    }
}

#if DEBUG
//struct ThumbnailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ThumbnailView(model: ThumbnailModel(s: CGSize(width: 100, height: 100), file: "/Users/aoikazto/Desktop/a.jpeg"))
//    }
//}
#endif
