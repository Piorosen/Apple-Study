//
//  ContentView.swift
//  R-Studio
//
//  Created by Aoikazto on 2020/02/08.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI
import ZIPFoundation

struct Test: View {
    @State var image = NSImage(size: NSSize(width: 10, height: 10))
    
    var body: some View {
        VStack {
            Button(action: {
                let p = URL(fileURLWithPath: "/Users/aoikazto/Desktop/1.zip")
                
                guard let archive = Archive(url: p, accessMode: .read) else  {
                    return
                }
                
                var list = [String]()
                archive.forEach { entry in
                    list.append(entry.path)
                }
                list.sort()
                
                guard let entry = archive[list[0]] else {
                    return
                }

                do {
                    var d:Data = Data()
                    _ = try archive.extract(entry) { value in
                        d.append(value)
                    }
                    self.image = NSImage.thumbnailImage(with: d, maxSize: CGSize(width: 100, height: 100)) ??
                    NSImage(size: NSSize(width: 100, height: 100))
                    
                }catch {
                    print("\(error)")
                }
                
                
                
                
            }){
                Text("HAHAHAHAHA")
            }
            
            Image(nsImage: image)
                .frame(width: 100, height: 100, alignment: .center)
        }
    }
}

struct ContentView: View {
    @State var searchText = ""
    @State var showCancelButton = false
    
    var body: some View {
        MainView()
            .frame(maxWidth:.infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
