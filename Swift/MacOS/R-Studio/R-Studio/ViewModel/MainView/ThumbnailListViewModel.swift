//
//  ThumbnailListViewModel.swift
//  R-Studio
//
//  Created by Aoikazto on 2020/02/09.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import Foundation
import SwiftUI



class ThumbnailListViewModel : ObservableObject {
    @Published var item = [ThumbnailModel]()
    
    var height:Int = 0
    var width:Int = 0
    
    let image: NSImage = NSImage(size: NSSize(width: 150, height: 150))
    
    init() {
        item.append(ThumbnailModel(s: CGSize(width: 150, height: 150), file: "/Users/aoikazto/Desktop/a.jpeg"))
        
    }
    
    public func getSliceModel(y:Int) -> [ThumbnailModel] {
        let start = y * width
        var last = (y+1) * width
        // check start
        if item.count <= start {
            return [ThumbnailModel]()
        }
        // check end
        if item.count <= last {
            last = item.count
        }
        var p = Array(item[start..<last])
    
        let count = width - p.count
        
        for _ in 0..<count {
            p.append(ThumbnailModel.getBlankInstance())
        }
        
        return p
    }
//    
    public func getHeight(width: Int) -> Int {
        self.width = width
        height = item.count / width + (item.count % width == 0 ? 0 : 1)
        
        return height
    }
    
    
}
