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
    
    init?(data:Data) {
        if let value = NSImage(data: data) {
            self.image = value
        } else {
        return nil
    }
    
//    
//    static func getList(zip:ZipThumb, image: inout [ImageReader]) {
//        image = [ImageReader]()
//        
//        
//        if let file = zip.archive {
//            for name in zip.zipList {
//                var data = Data()
//                
//                let result = try! file.extract(file[name]!) { value in
//                    data.append(value)
//                }
//                
//                if result != nil {
//                    
//                }
//                if let reader = ImageReader(data: data) {
//                    image.append(reader)
//                }
//            }
//        }
    }
}

struct Reader: View {
    @Binding var read: ZipThumb
    @ObservedObject var viewModel:ReaderViewModel
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation {
                        self.read.fileName = ""
                    }
                    
                    
                }) {
                    Text("Close")
                }
            }.frame(height: 30, alignment: .trailing)
            Divider()
            
            //            if viewModel.loadingEnd == true {
            
            List (viewModel.image) { i in
                Image(nsImage: i.image).frame(alignment:.center)
            }
            //            List (viewModel.image) { i in
            //                Image(nsImage: i.image).frame(alignment:.center)
            //            }
            
            
            //            }else {
            //                Text("Loading")
            //            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
//            .onAppear{
//                self.viewModel.loadImage()
//        }
    }
}
//            .background(Color.red)
//struct Reader_Previews: PreviewProvider {
//    static var previews: some View {
//        Reader(readNow: "")
//    }
//}
