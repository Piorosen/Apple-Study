//
//  ReaderViewModel.swift
//  R-Studio
//
//  Created by Aoikazto on 2020/02/12.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import Foundation
import SwiftUI


class ReaderViewModel : ObservableObject {
    @Published var loadingEnd = false
    var readNow:ZipThumb
    @Published var image = [ImageReader]()
    
    init (read:ZipThumb) {
        readNow = read
        DispatchQueue.main.async {
            self.image = ImageReader.getList(zip: self.readNow)
            withAnimation  {
                self.loadingEnd = true
            }
        }
    }
    
    
    
}
