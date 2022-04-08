//
//  ContentView.swift
//  Mega-Pig
//
//  Created by Choi Inho on 2022/04/07.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView{
            CameraView()
                .tabItem {
                    Image(systemName: "camera")
                    Text("Camera")
                }
            CheckListView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("CheckList")
                }
        }
    }
}

struct HometView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

