//
//  GeneralView.swift
//  gps-telling
//
//  Created by Aoikazto on 2020/06/01.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import SwiftUI

enum Dir {
    case Middle
    case West
}

struct GeneralView: View {
    @Binding var Middle: [InfoModel]
    @Binding var West: [InfoModel]
    
    @State var today = [InfoModel]()
    
    // ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]`.
    static let week = ["일", "월", "화", "수", "목", "금", "토"]
//    let dayofWeek = Calendar.current.weekdaySymbols[Calendar.current.component(.weekday, from: Date()) - 1]
    let dayofIndex = Calendar.current.component(.weekday, from: Date()) - 1
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        withAnimation {
                            self.today.removeAll()
                            for item in self.Middle {
                                if item.DayOfWeek[self.dayofIndex - 1] {
                                    self.today.append(item)
                                }
                            }
                        }
                    }) {
                        Text("중구").font(.caption)
                    }.padding(20)
                    
                    Button(action: {
                        withAnimation {
                            self.today.removeAll()
                            for item in self.West {
                                if item.DayOfWeek[self.dayofIndex - 1] {
                                    self.today.append(item)
                                }
                            }
                        }
                    }) {
                        Text("서구").font(.caption)
                    }.padding(20)
                }
                
                List (today) { item in
                    VStack {
                        Text("\(item.Name)")
                        Text("\(item.PhoneNum[0])")
                    }
                }
            }
            .navigationBarTitle("\(GeneralView.week[dayofIndex])요일")
            .onAppear {
                self.today.removeAll()
                for item in self.Middle {
                    if item.DayOfWeek[self.dayofIndex - 1] {
                        self.today.append(item)
                    }
                }
            }
        }
    }
}
