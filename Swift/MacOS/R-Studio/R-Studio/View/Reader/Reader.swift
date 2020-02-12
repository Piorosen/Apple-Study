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
    @Binding var read: ZipThumb
    @ObservedObject var viewModel:ReaderViewModel
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.read.fileName = ""
                    
                }) {
                    Text("Close")
                }
            }.frame(height: 30, alignment: .trailing)
            Divider()
            ScrollView {
                VStack {
                    if viewModel.loadingEnd == true {
                        ForEach (viewModel.image) { item in
                            Image(nsImage: item.image)
                            .shadow(radius: 30)
                        }
                    }else {
                        Text("Loading")
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
