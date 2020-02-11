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
//    
    init() {
        addToImage(url: URL(fileURLWithPath: "/Users/aoikazto/Desktop/a.jpeg"))
    }
    
    public func addToImage(url: [URL]) {
        for value in url {
            addToImage(url: value)
        }
    }
    
    public func addToImage(url: URL){
        DispatchQueue.main.async {
            let p = ThumbnailModel(s:CGSize(width: 100, height: 100), file: url.path)
            
            if p.createResult {
                self.item.append(p)
            }
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
        
        var result = item[start..<last]
        for _ in 0..<(width - (last - start)) {
            result.append(ThumbnailModel.getBlankInstance())
        }
        
        return Array(result)
    }
//    
    public func getHeight(width: Int) -> Int {
        if width == 0 {
            return 0
        }
        
        self.width = width
        height = item.count / width + (item.count % width == 0 ? 0 : 1)
        
        return height
    }
    
    
}
