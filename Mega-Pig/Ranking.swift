//
//  Ranking.swift
//  Mega-Pig
//
//  Created by dohankim on 2022/04/14.
//

import SwiftUI

struct Ranking: View {
    
    var body: some View {
           VStack(spacing:10){
               Text("4월 2주차 탑3")
                   .font(.title)
                   .foregroundColor(Color.accentColor)
               HStack(spacing:10){
                   ZStack{
                       Image("userImg").resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 180, height: 150)
                       Text("1등 나일등")
                        .font(.system(size:20, weight: .semibold, design: .rounded))
                                                       .foregroundColor(.black)
                   }
               }
               HStack(spacing:10){
                   ZStack{
                       Image("userImg").resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 180, height: 150)
                       Text("2등 너이등")
                                                       .font(.system(size:20, weight: .semibold, design: .rounded))
                                                       .foregroundColor(.black)
                   }
                   ZStack{
                       Image("userImg").resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 180, height: 150)
                       Text("3등 나삼등")
                                                       .font(.system(size:20, weight: .semibold, design: .rounded))
                                                       .foregroundColor(.black)
                   }
                   
               }
               
//               VStack{
//                   Label("사용자 레이블 스타일 지정 (1)", image: "userImg")
//                                   .labelStyle(YellowBackgroundLabelStyle())
//               }
               ScrollView(.vertical, showsIndicators:false){
                   LazyVStack(pinnedViews: [.sectionFooters]){
                       Section(footer: Footer()){
                           ForEach(profilelists, id: \.self){profile in
                               HStack{
                                   Label("\(profile.number)등 \(profile.name)        -        \(profile.point)점                   ",image:profile.image)
                                       .labelStyle(greenBackgroundLabelStyle())
//                                   Label("\(profile.name)        -        \(profile.point)점 ",image:"")
//                                        .labelStyle(YellowBackgroundLabelStyle())
                                   
                               }
                               Divider()
                                .frame(height: 1)
                                .padding(.horizontal, 30)
                                .background(Color.gray)
                                .frame(width: 350)
                           }
                       }
                       
                       
                   }
                   .clipped()
               }
           }
    }
}

struct YellowBackgroundLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .frame(maxWidth: .infinity-3)
            .padding()
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
            .cornerRadius(10)
        
            
    }
}

struct greenBackgroundLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .padding()
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
            .cornerRadius(10)
            
            
    }
}


struct Ranking_Previews: PreviewProvider {
    static var previews: some View {
        Ranking()
            
    }
}


struct ProfileList: Identifiable, Hashable{
    let id = UUID()
    let image: String
    let name: String
    let number: Int
    let point: Int
}

let profilelists = [
    ProfileList(image: "userImg.orange", name: "피카츄",number: 4,point:390),
    ProfileList(image: "userImg.orange", name: "라이츄",number: 5,point:385),
    ProfileList(image: "userImg.orange", name: "파이리",number: 6,point:385),
    ProfileList(image: "userImg.orange", name: "꼬북이",number: 7,point:370),
    ProfileList(image: "userImg.orange", name: "치느님",number: 8,point:365),
    ProfileList(image: "userImg.orange", name: "마이키",number: 9,point:350),
    ProfileList(image: "userImg.orange", name: "마우스",number: 10,point:350),
    ProfileList(image: "userImg.red", name: "이로하",number: 11,point:350),
    ProfileList(image: "userImg.red", name: "알로에",number: 12,point:350),
    ProfileList(image: "userImg.red", name: "니랑나",number: 13,point:350),
    ProfileList(image: "userImg.red", name: "날아드",number: 14,point:340),
    ProfileList(image: "userImg.red", name: "펩시제",number: 15,point:335),
    ProfileList(image: "userImg.red", name: "라로콜",number: 16,point:330),
    ProfileList(image: "userImg.red", name: "김치도",number: 17,point:330),
    ProfileList(image: "userImg.red", name: "자구다",number: 18,point:320),
    ProfileList(image: "userImg.red", name: "디그다",number: 19,point:320),
    ProfileList(image: "userImg.red", name: "닥트다",number: 20,point:310)
]

struct Footer: View {
    var body: some View {
        HStack{
            Label("8등 치느님        -        365점                   ",image:"userImg.orange")
                .padding()
                .background(Color.accentColor)
                .cornerRadius(10)
                .border(Color.accentColor, width: 2)
                
        }
        .padding(.all, 3.0)
        .foregroundColor(Color.white)
    }
    
}
