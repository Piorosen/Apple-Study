//
//  myPlayground.swift
//  SwiftUI-Study
//
//  Created by Aoikazto on 2020/01/27.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import Foundation



class Study {
    
    func getDocumentsDirectoryURL() -> URL {
        let pw = getpwuid(getuid());
        let home = pw?.pointee.pw_dir
        let homePath = FileManager.default.string(withFileSystemRepresentation: home!, length: Int(strlen(home!)))
        let documentsPath = (homePath as NSString).appendingPathComponent("Desktop")
        return URL(fileURLWithPath: documentsPath)
    }
    
    func Run() -> Void {
        
        
//
//
//        dataTask?.cancel()
//        if let urls = URLComponents(string: "http://joojoo.aoikazto.com/") {
//            print(urls)
//            guard let url = urls.url else {
//                print("ERROR!")
//                return
//            }
//            print(url)
//
//            dataTask = p.dataTask(with: url) { data, response, error in
//                print(data)
//            }
//
//            dataTask?.resume()
//
//
//        }
    }
}
