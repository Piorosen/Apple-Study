//
//  Reader.swift
//  R-Studio
//
//  Created by Aoikazto on 2020/02/12.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI

struct ImageReader: Identifiable {
    let id = UUID()
    var image:NSImage
    
    init(data:Data) {
        self.image = NSImage(data: data)!
    }
    
    static func getList(zip:ZipThumb) -> [ImageReader] {
        var result = [ImageReader]()
        
        if let file = zip.archive {
            for name in zip.zipList {
                var data = Data()
                
                try! file.extract(file[name]!) { value in
                    data.append(value)
                }
                
                let reader = ImageReader(data: data)
                
                result.append(reader)
            }
        }
        
        return result
    }
}

struct Reader: View {
    var readNow:Binding<ZipThumb>
    var list:[ImageReader]
    
    init(r:Binding<ZipThumb>) {
        list = ImageReader.getList(zip: r.wrappedValue)
        self.readNow = r
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.readNow.wrappedValue.fileName = ""
                    
                }) {
                    Text("Close")
                }
            }.frame(height: CGFloat(30), alignment: .trailing)
            Divider()
            ScrollView {
                VStack {
                    ForEach (list) { item in
                        Image(nsImage: item.image)
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.red)
    }
}

//struct Reader_Previews: PreviewProvider {
//    static var previews: some View {
//        Reader(readNow: "")
//    }
//}
