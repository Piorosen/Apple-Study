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
        loadImage()
    }
    
    func loadImage(){
        print("Called")
        image = [ImageReader]()
        
        guard let file = readNow.archive else {
            return
        }
        
        let list = readNow.zipList
        //        }().addOperation {
        DispatchQueue.global().async {
            for name in list {
                
                if let item = file[name] {
                    var data = Data()
                    
                    let result = try? file.extract(item) { value in
                        data.append(value)
                    }
                    
                    if result != nil {
                        if let reader = ImageReader(data: data) {
                            DispatchQueue.main.async {
                                self.image.append(reader)
                            }
                        }
                        
                        
                    }
                }
                
            }
        }
    }
}
