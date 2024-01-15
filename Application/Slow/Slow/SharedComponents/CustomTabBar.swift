//
//  CustomTabBar.swift
//  Slow
//
//  Created by Vinter Marco on 13.01.2024.
//

import SwiftUI


enum tabSelected {
    
}

struct CustomTabBar: View {
    

    @Binding var selectdTab : String
    
    var blueCustomColor : Color = Color(red : 97/255,green : 1/255, blue : 238/255, opacity: 0.11)
    var blueCustomColorFull : Color = Color(red : 97/255,green : 1/255, blue : 238/255)
    var accentCustomColor : Color = Color(red: 204/255, green: 103/255, blue: 51/255)
    
    
    
    var body: some View {
        NavigationStack {
            HStack {
                // btn 1
                
                GeometryReader { geo in
                    
                    Button {
                        selectdTab = "habits"
                    } label: {
                        VStack (alignment: .center , spacing: 4) {
                            Image(systemName:  selectdTab == "habits" ? "square.stack.3d.up.fill" : "square.stack.3d.up")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(blueCustomColorFull)
                                .frame(width: selectdTab == "habits" ? 20 : 19, height: selectdTab == "habits" ? 20 : 19)
                            Text("habits")
                                .font(selectdTab != "habits" ? .system(size: 1) : .system(size: 11))
                                .opacity(selectdTab == "habits" ? 1 : 0)
                                .foregroundStyle(blueCustomColorFull)
                        }
                        .frame(width: geo.size.width,height: geo.size.height)
                        
                    }
                }
                
                
                
                
                GeometryReader { geo in
                    
                    Button {
                        selectdTab = "stats"
                    } label: {
                        VStack (alignment: .center , spacing: 4) {
                            Image(systemName:  selectdTab == "stats" ? "chart.bar.fill" : "chart.bar")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(blueCustomColorFull)
                                .frame(width: selectdTab == "stats" ? 20: 16, height: selectdTab == "stats" ? 20 : 16)
                            Text("stats")
                                .font(selectdTab != "stats" ? .system(size: 1) : .system(size: 11))
                                .opacity(selectdTab == "stats" ? 1 : 0)
                                .foregroundStyle(blueCustomColorFull)
                        }
                        .frame(width: geo.size.width,height: geo.size.height)
                        
                    }
                }
                
                // PLUS BTN
                GeometryReader { geo in
                    
                    Button {
                        selectdTab = "plus"
                        
                    } label: {
                        NavigationLink {
                            AddHabitsView()
                        } label: {
                            VStack (alignment: .center , spacing: 4) {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(Color(red : 97/255,green : 1/255, blue : 238/255))
                                    .frame(width: 45, height: 45)
                                
                                
                            }
                            .frame(width: geo.size.width,height: geo.size.height)
                        }
                    }
                    
                }
                
                // btn 3
                GeometryReader { geo in
                    
                    Button {
                        selectdTab = "inspiration"
                    } label: {
                        VStack (alignment: .center , spacing: 4) {
                            Image(systemName:  selectdTab == "inspiration" ? "lightbulb.fill" : "lightbulb")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(blueCustomColorFull)
                                .frame(width: selectdTab == "inspiration" ? 20: 19, height: selectdTab == "inspiration" ? 20: 19)
                            Text("inspiration")
                                .font(selectdTab != "inspiration" ? .system(size: 1) : .system(size: 11))
                                .opacity(selectdTab == "inspiration" ? 1 : 0)
                                .foregroundStyle(blueCustomColorFull)
                        }
                        .frame(width: geo.size.width,height: geo.size.height)
                        
                    }
                }
                
                
                
                
                
                GeometryReader { geo in
                    
                    Button {
                        selectdTab = "account"
                    } label: {
                        VStack (alignment: .center , spacing: 4) {
                            Image(systemName:  selectdTab == "account" ? "person.fill" : "person")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(blueCustomColorFull)
                                .frame(width: selectdTab == "account" ? 20: 19, height: selectdTab == "person" ? 20 : 19)
                            Text("account")
                                .font(selectdTab != "account" ? .system(size: 1) : .system(size: 10))
                                .opacity(selectdTab == "account" ? 1 : 0)
                                .foregroundStyle(blueCustomColorFull)
                        }
                        .frame(width: geo.size.width,height: geo.size.height)
                        
                    }
                }
            }
            .background(.white)
            .frame(width : 350, height: 60)
            .cornerRadius(35)
        }
    }
}

//#Preview {
//    CustomTabBar(selectdTab: "")
//}
