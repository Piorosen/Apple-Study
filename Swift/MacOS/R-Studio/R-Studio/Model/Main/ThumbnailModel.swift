//
//  ThumbnailModel.swift
//  R-Studio
//
//  Created by Aoikazto on 2020/02/09.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import Foundation
import SwiftUI
import ZIPFoundation

extension NSImage {
    static func thumbnailImage(with url: String, maxSize: CGSize) -> NSImage? {
        if !FileManager.default.fileExists(atPath: url) {
            return nil
        }
        
        guard let inputImage = NSImage(contentsOf: URL(fileURLWithPath: url)) else { return nil }
        //        let aspectRatio = inputImage.size.width / inputImage.size.height
        
        let thumbSize = NSSize(width: maxSize.width, height: maxSize.height)
        
        let outputImage = NSImage(size: thumbSize)
        outputImage.lockFocus()
        
        inputImage.draw(in: NSRect(x: 0, y: 0, width: thumbSize.width, height: thumbSize.height), from: .zero, operation: .sourceOver, fraction: 1)
        outputImage.unlockFocus()
        return outputImage
    }
    
    static func thumbnailImage(with data: Data, maxSize: CGSize) -> NSImage? {
        guard let inputImage = NSImage(data: data) else { return nil }
        
        let thumbSize = NSSize(width: maxSize.width, height: maxSize.height)
        
        let outputImage = NSImage(size: thumbSize)
        outputImage.lockFocus()
        
        inputImage.draw(in: NSRect(x: 0, y: 0, width: thumbSize.width, height: thumbSize.height), from: .zero, operation: .sourceOver, fraction: 1)
        outputImage.unlockFocus()
        
        return outputImage
    }
    
    static func thumbnailImage(zipFile file: String, maxSize: CGSize) -> NSImage? {
        
        guard let arch = Archive(url: URL(fileURLWithPath: file), accessMode: .read) else {
            return nil
        }
            
        var zipList = [String]()
        arch.forEach { data in
            zipList.append(data.path)
        }
        zipList.sort()
            
        var data:Data = Data()
        if let entry = arch[zipList[0]] {
            let _ = try? arch.extract(entry) { value in
                data.append(value)
            }
        }
        
        return thumbnailImage(with: data, maxSize: maxSize)
    }
}

struct ZipThumb {
    var fileName:String = ""
    var zipList:[String] = [String]()
    var archive:Archive? = nil
    var thumbImage:Data = Data()
    
    init() {
        
    }
    
    mutating func clear(fileName:String) -> ZipThumb {
        self.fileName = fileName
        if let arch = Archive(url: URL(fileURLWithPath: fileName), accessMode: .read) {
            archive = arch
            
            arch.forEach { data in
                zipList.append(data.path)
            }
            zipList.sort()
            
            if let entry = arch[zipList[0]] {
                let _ = try? arch.extract(entry) { value in
                    thumbImage.append(value)
                }
            }
        }
        
        return self
    }
}


struct ThumbnailModel : Identifiable {
    var id = UUID()
    let size:CGSize
    
    var fileName:String
    
    private var cache:NSImage
    
    var createResult = false
    
    init(s:CGSize, file:String) {
        size = s
        fileName = file
        
        if let image = NSImage.thumbnailImage(zipFile: fileName, maxSize: self.size){
            self.cache = image
            createResult = true
        }else {
            self.cache = NSImage(size: size)
            createResult = false
        }
        
        
    }
    
    static func getBlankInstance() -> ThumbnailModel {
        return ThumbnailModel(s: CGSize(width: 150, height: 150), file: "")
    }
    
    func getNSImage() -> NSImage {
        return cache
    }
}
