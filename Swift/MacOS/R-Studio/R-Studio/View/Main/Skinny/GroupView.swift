//
//  GroupView.swift
//  R-Studio
//
//  Created by Aoikazto on 2020/02/08.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI

struct GroupView: View, DropDelegate {
    @State var b = false
    
    var body: some View {
        VStack {
         Text("AA")
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.red)
//        .onDrop(of: [(kUTTypeImage as String)], delegate: self)
    }
    

    func dropUpdated(info: DropInfo) -> DropProposal? {
        let proposal = DropProposal.init(operation: .copy)
      return proposal
    }

    func performDrop(info: DropInfo) -> Bool {
        guard let itemProvider = info.itemProviders(for: [(kUTTypeFileURL as String)]).first else { return false }

        itemProvider.loadItem(forTypeIdentifier: (kUTTypeFileURL as String), options: nil) {item, error in
            guard let data = item as? Data, let url = URL(dataRepresentation: data, relativeTo: nil) else { return }
            // Do something with the file url
            // remember to dispatch on main in case of a @State change
            print(url.absoluteURL)
        }
        return true
    }
}

#if DEBUG
struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
#endif
