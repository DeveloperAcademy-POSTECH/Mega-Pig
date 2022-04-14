//
//  ranking_view.swift
//  Mega-Pig
//
//  Created by dohankim on 2022/04/13.
//

import SwiftUI

struct ranking_view: View {
    var body: some View {
        VStack(spacing:10){
            Text("4월 2주차 탑3")
                .font(.title)
            HStack(spacing:10){
                ZStack{
                    Image("gyo_pig").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 150)
                    Text("Hip-Hop")
                                                    .font(.system(size:20, weight: .semibold, design: .rounded))
                                                    .foregroundColor(.black)
                }
                
                
            }
            HStack(spacing:10){
                ZStack{
                    Image("gyo_pig").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 150)
                    Text("Hip-Hop")
                                                    .font(.system(size:20, weight: .semibold, design: .rounded))
                                                    .foregroundColor(.black)
                }
                ZStack{
                    Image("gyo_pig").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 150)
                    Text("Hip-Hop")
                                                    .font(.system(size:20, weight: .semibold, design: .rounded))
                                                    .foregroundColor(.black)
                }
                
            }
                
        
        }
        
    }
}

struct ranking_view_Previews: PreviewProvider {
    static var previews: some View {
        ranking_view()
    }
}
