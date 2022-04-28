//
//  MyPageView.swift
//  Mega-Pig
//
//  Created by 황정현 on 2022/04/13.
//

import SwiftUI

struct MyPageView: View {
    @State var userName = "치느님"
    
    @EnvironmentObject var viewModel: AppViewModel
    
    let radius: CGFloat = 10
       var body: some View
       {
           GeometryReader
           {geometry in
               let width = geometry.size.width
               let height = geometry.size.height
               let topHeight = height * 0.15
               let bottomHeight = height * 0.85
               NavigationView
               {
                   VStack(spacing: height * 0.01)
                   {
                       
                       VStack(spacing: 0)
                       {
                           HStack(alignment: .center, spacing: 0)
                           {
                               Image("userImg.orange").resizable().frame(width: width*0.2, height: width * 0.2, alignment: .center).padding(width * 0.05)
                               VStack{
                                   Text("환영합니다!").frame(width: width * 0.5, height: topHeight * 0.14, alignment:.leading).font(.system(size: 14))
                                   Text(userName).frame(width: width * 0.5, height: topHeight * 0.2, alignment:.leading).font(.system(size: 20))
                               }.frame(width: width * 0.7, height: topHeight * 0.6, alignment: .leading)
                           }.frame(width:width, height: topHeight, alignment: .center)
                       }.frame(width: width, height: topHeight, alignment: .center)
                       VStack
                       {
                           let buttonArea = bottomHeight * 0.3
                           VStack(spacing: buttonArea * 0.01){
                               VStack {
                                   NavigationLink(destination: EditView())
                                   {
                                       Text("개인정보 수정").frame(minWidth: 0, maxWidth: .infinity)
                                           .font(.system(size: 18))
                                           .padding(buttonArea * 0.08)
                                           .foregroundColor(.white)
                                           .overlay(
                                               RoundedRectangle(cornerRadius: radius)
                                                   .stroke(Color.accentColor, lineWidth: 2)
                                       )
                                   }
                               }.background(Color.accentColor)
                                   .cornerRadius(radius)
                                   .frame(width: width * 0.9, height: buttonArea / 3, alignment: .center)
                               VStack {
                                   NavigationLink(destination: TermsOfUseView())
                                   {
                                       Text("서비스 사용약관").frame(minWidth: 0, maxWidth: .infinity)
                                           .font(.system(size: 18))
                                           .padding(buttonArea * 0.08)
                                           .foregroundColor(.white)
                                           .overlay(
                                               RoundedRectangle(cornerRadius: radius)
                                                   .stroke(Color.accentColor, lineWidth: 2)
                                       )
                                   }
                               }.background(Color.accentColor)
                                   .cornerRadius(radius)
                                   .frame(width: width * 0.9, height: buttonArea / 3, alignment: .center)
                               Button(action: {
                                   print("PRESSED 로그아웃")
                                   viewModel.signout()
                                   })
                               {
                                   Text("로그아웃")
                                       .frame(minWidth: 0, maxWidth: .infinity)
                                       .font(.system(size: 18))
                                       .padding(buttonArea * 0.08)
                                       .foregroundColor(.white)
                                       .overlay(
                                           RoundedRectangle(cornerRadius: radius)
                                               .stroke(Color.accentColor, lineWidth: 2)
                                   )
                                }.background(Color.accentColor)
                                   .cornerRadius(radius)
                                   .frame(width: width * 0.9, height: buttonArea / 3, alignment: .center)
                           }.frame(width: width * 0.95, height: buttonArea * 1.1, alignment: .center)
                           .overlay(
                            RoundedRectangle(cornerRadius: radius).stroke(Color.accentColor, lineWidth: 2))
                       }.frame(width: width, height: bottomHeight, alignment: .top)
                   }.frame(width: width, height: height, alignment: .center)
               }

//               }
           }
       }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
