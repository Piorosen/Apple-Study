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
    var blankPool = [ThumbnailModel]()
    
    var height:Int = 0
    var width:Int = 0
//    
    init() {
        for _ in 0...10 {
            blankPool.append(ThumbnailModel.getBlankInstance())
        }
       
        for _ in 0...100 {
            item.append(ThumbnailModel(s: CGSize(width: 150, height: 150), file: "/Users/aoikazto/Desktop/a.jpeg"))
        }
        
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
        
        let count = width - (last - start)
        
        return Array(item[start..<last] + blankPool[0..<count])
    }
//    
    public func getHeight(width: Int) -> Int {
        self.width = width
        height = item.count / width + (item.count % width == 0 ? 0 : 1)
        
        return height
    }
    
    
}
