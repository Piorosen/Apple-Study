//
//  SearchView.swift
//  R-Studio
//
//  Created by Aoikazto on 2020/02/08.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                
            }){
                Text("편집")
            }
            Button(action: {
                
            }){
                Text("설정")
            }
            TextField("Search", text: self.$text)
                    .frame(width:300)
                    .padding(.trailing, 30)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#if DEBUG
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
#endif
