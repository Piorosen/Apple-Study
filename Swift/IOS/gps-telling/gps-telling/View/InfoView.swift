//
//  OldInfoView.swift
//  gps-telling
//
//  Created by Aoikazto on 2020/06/01.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    let Name:String
    @Binding var info: [InfoModel]
    
    var body: some View {
        NavigationView {
            List(info.indices, id: \.self) { index in
                OneInfoView(info: self.$info[index])
            }
            .navigationBarTitle("리스트")
            .navigationBarItems(trailing: Button(action: {
                let file = FileManager.default
                
                let dir = file.urls(for: .documentDirectory, in: .userDomainMask).first
                if dir == nil {
                    print("Dir is NIL")
                    return
                }
                
                let fileUrl = dir!.appendingPathComponent("\(self.Name).info")
                
                var write = ""
                
                for data in self.info {
                    for b in data.DayOfWeek {
                        write += "\(b ? 1 : 0) "
                    }
                    write += "\n"
                }
                do {
                    print(fileUrl.absoluteString)
                    try write.write(to: fileUrl, atomically: false, encoding: .ascii)
                }catch {
                    print(write)
                }
                
            }) {
                Text("Save")
            })
        }
    }
}

