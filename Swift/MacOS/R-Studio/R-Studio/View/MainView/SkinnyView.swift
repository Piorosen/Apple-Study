//
//  SkinnyView.swift
//  R-Studio
//
//  Created by Aoikazto on 2020/02/08.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI

struct SkinnyView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#if DEBUG
struct SkinnyView_Previews: PreviewProvider {
    static var previews: some View {
        SkinnyView()
    }
}
#endif
