//
//  ContentView.swift
//  SwiftUI-Study
//
//  Created by Aoikazto on 2020/01/23.
//  Copyright © 2020 Aoikazto. All rights reserved.
//
import Foundation
import SwiftUI
import Combine
import SQLite3

struct ContentView: View {
    @State var showing = false
    @State var list = [NSImage]()
    
    var body: some View {
        VStack {
            Button(action: {
                
                OperationQueue().addOperation {
                    
                    for i in 0..<100 {
                        let p = NSImage(contentsOf: URL(fileURLWithPath: "/Users/aoikazto/Desktop/a.jpeg"))!
                        OperationQueue.main.addOperation {
                            if i % 10 == 0 {
                                self.list.removeAll()
                            }
                            self.list.append(p)
                        }

                    }
                    
                }
            }
            ){
                Text("ha...")
            }
            Button(action: {
                self.list.removeAll()
            }){
                Text("removeAll")
            }
            
            List {
                ForEach (list, id: \.self) { value in
                    Image(nsImage: value)
                        .resizable()
                        .frame(width: 400, height: 100, alignment: .center)
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
