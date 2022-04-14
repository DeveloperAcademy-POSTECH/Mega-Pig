//
//  ContentView.swift
//  Mega-Pig
//
//  Created by Choi Inho on 2022/04/07.
//

import SwiftUI




struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @State public var selection = AppViewModel().selection
	
	@State private var image : UIImage?
	
	
    var body: some View {
        
        GeometryReader { geometry in
                    VStack(spacing: 0) {
                        TabView(selection: $selection) {
                            CalendarView().frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .center)
                            .tabItem {
                                Image(systemName: "calendar")
                                Text("Calendar")
                            }.tag(1)
                            TournamentView().frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .center)
                                .navigationBarHidden(true)
                            .tabItem {
                                Image(systemName: "network")
                                Text("WorldCup")
                            }.tag(2)
							CameraView(image: $image, selection: $selection).frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .center)
                            .tabItem {
								Image(systemName: "camera")
								Text("Camera")
								}
							.tag(3)
							
                            Ranking().frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .center)
                            .tabItem {
                                Image(systemName: "1.circle")
                                Text("Ranking")
                            }.tag(4)
                            MyPageView().frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .center)
                            .tabItem {
                                Image(systemName: "person")
                                Text("My Page")
                            }.tag(5)
							
//							EatenView().frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .center)
//							.tabItem{
//								Text("Test")
//							}.tag(6)
								
                        }
                    }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
