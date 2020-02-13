//
//  ThumbnailListView.swift
//  R-Studio
//
//  Created by Aoikazto on 2020/02/08.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI

struct ThumbnailListView: View {
    let elementViewSize = CGSize(width: 150, height: 150)
    let paddingSize:CGFloat = 10
    
    @EnvironmentObject var viewModel:ThumbnailListViewModel
    
    @State var dropEvent = false
    @Binding var pageType:ZipThumb
    @Binding var readNow:String
    
    var body: some View {
        GeometryReader { g in
            ScrollView {
                VStack(spacing: 0) {
                    ForEach (0..<self.viewModel.getHeight(width: Int(g.size.width / self.elementViewSize.width)), id: \.self) { y in
                        HStack(spacing: 0) {
                            ForEach (self.viewModel.getSliceModel(y: y)) { m in
                                ThumbnailView(image: m.getNSImage() , fileName: m.fileName, pageType: self.$pageType, readNow: self.$readNow)
                                    .frame(width: self.elementViewSize.width, height: self.elementViewSize.height)
                                
                            }
                        }.frame(maxWidth: .infinity)
                    }
                }
            }
        }
        .padding(5)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onDrop(of: [kUTTypeFileURL as String], isTargeted: self.$dropEvent) { itemProvider in
            OperationQueue().addOperation {
                    for item in itemProvider {
                        item.loadItem(forTypeIdentifier: (kUTTypeFileURL as String), options: nil) {item, error in
                            guard let data = item as? Data, let url = URL(dataRepresentation: data, relativeTo: nil) else { return }
                            OperationQueue.main.addOperation {
                                self.viewModel.addToImage(url: url)
                            }
                            print(url.path)
                        }
                    }
            }
            
            return true
        }
    }
}

#if DEBUG
//struct ThumbnailListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ThumbnailListView()
//    }
//}
#endif
