//
//  PlayToolbar.swift
//  PC-Room
//
//  Created by Aoikazto on 2020/02/16.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI

struct PlayToolbar: View {
    var body: some View {
        HStack {
            Text("챠챠의 도넛 | \"Just enjoy your competition\"")
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct PlayToolbar_Previews: PreviewProvider {
    static var previews: some View {
        PlayToolbar()
    }
}
