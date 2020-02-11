//
//  SkinnyView.swift
//  R-Studio
//
//  Created by Aoikazto on 2020/02/08.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI

struct SkinnyView: View {
    var element = ["제목", "설명", "그룹", "태그", "제작사"]
    let text = ["제목이란다?", "Description", "Reflex", "Reflex, Webtoon, R-15, etc", "Reflex"]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach (0..<self.text.count, id: \.self) { i in
                VStack(spacing: 0) {
                    Text(self.element[i])
                        .frame(maxWidth: .infinity, maxHeight: 40, alignment: .leading)
                        .font(.largeTitle)
                    Text(self.text[i])
                        .frame(maxWidth: .infinity, maxHeight: 25, alignment: .leading)
                        .font(.body)
                    Spacer()
                }.frame(maxWidth: .infinity, maxHeight: 75)
                    .padding([.leading, .trailing, .top], 10)
//                    .background(Color.red)
            }
            Spacer()
            Divider()
            GroupView()
                .frame(maxWidth: .infinity, maxHeight: 100)
//                .background(Color.blue)
        }
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
