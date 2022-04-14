//
//  MainTabView.swift
//  Mega-Pig
//
//  Created by 황정현 on 2022/04/08.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                TabView {
                    CalendarView().frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .center)
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Calendar")
                    }.tag(1)
                    ContentView().frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .center)
                    .tabItem {
                        Image(systemName: "network")
                        Text("WorldCup")
                    }.tag(2)
                    TestView().frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .center)
                    .tabItem {
                        Image(systemName: "camera")
                        Text("Camera")
                    }.tag(3)
                    TestView().frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .center)
                    .tabItem {
                        Image(systemName: "1.circle")
                        Text("Ranking")
                    }.tag(4)
                    TestView().frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .center)
                    .tabItem {
                        Image(systemName: "person")
                        Text("My Page")
                    }.tag(5)
                }
            }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
