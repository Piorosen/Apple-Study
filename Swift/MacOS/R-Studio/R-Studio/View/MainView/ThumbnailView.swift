//
//  ThumbnailView.swift
//  R-Studio
//
//  Created by Aoikazto on 2020/02/08.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI

extension NSImage {
    static func thumbnailImage(with url: String, maxWidth: CGFloat) -> NSImage? {
        guard let inputImage = NSImage(contentsOf: URL(fileURLWithPath: url)) else { return nil }
        let aspectRatio = inputImage.size.width / inputImage.size.height
        let thumbSize = NSSize(width: maxWidth, height: maxWidth * aspectRatio)
        let outputImage = NSImage(size: thumbSize)
        outputImage.lockFocus()
        inputImage.draw(in: NSRect(x: 0, y: 0, width: thumbSize.width, height: thumbSize.height), from: .zero, operation: .sourceOver, fraction: 1)
        outputImage.unlockFocus()
        return outputImage
    }
}

struct ThumbnailView: View {
    var data:NSImage
    
    init(image: NSImage) {
        data = image
    }
    
    var body: some View {
//        if let p = test {
//            return RoundedRectangle(cornerRadius: 20)
//                .padding(5)
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//        }
        
        Image(nsImage: data)
//        Image(nsImage: NSImage(data: data)!)
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(5)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#if DEBUG
struct ThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbnailView(image: NSImage.thumbnailImage(with: "/Users/aoikazto/Desktop/a.jpeg", maxWidth:  100)!)
    }
}
#endif
