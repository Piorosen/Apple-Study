//
//  OneInfoView.swift
//  gps-telling
//
//  Created by Aoikazto on 2020/06/01.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI

struct OneInfoView: View {
    @Binding var info: InfoModel
    
    var body: some View {
        VStack {
            Text("\(info.Name)")
                .font(.title)
            HStack {
                ForEach(info.DayOfWeek.indices) { index in
                    VStack {
                        Text(InfoModel.DayOfName[index])
                        Toggle(isOn: self.$info.DayOfWeek[index]) { Text("") }.labelsHidden()
                    }.frame(maxWidth: .infinity)
                }
            }
        }
    }
}
