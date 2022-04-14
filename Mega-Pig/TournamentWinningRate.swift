//
//  TournamentWinningRate.swift
//  Mega-Pig
//
//  Created by 조성산 on 2022/04/11.
//

import SwiftUI

struct TournamentWinningRate: View {
    var body: some View {
        VStack{
        
            HStack(spacing: 10){
                   VStack(alignment: .leading, spacing: 0){
                       Divider().opacity(0)
                       
                       HStack(spacing :5){
                                       Image("myfood01")
                                           .resizable()
                                           .frame(width: 50, height: 50)
                           HStack(){
                               BarChart(percentage: .constant(0.61))
                                   .frame(width:160, height:10)
                           }
                           HStack{
                               BarChart(percentage:.constant(0.70))
                                   .frame(width:160, height: 10)
                           }
                       }
                   }
               }
               .padding(20)
               .background(Color.white)
               .cornerRadius(10)
            HStack(spacing: 10){
                   VStack(alignment: .leading, spacing: 0){
                       Divider().opacity(0)
                       
                       HStack(spacing :5){
                                       Image("myfood02")
                                           .resizable()
                                           .frame(width: 50, height: 50)
                           HStack(){
                               BarChart(percentage: .constant(0.26))
                                   .frame(width:160, height:10)
                           }
                           HStack{
                               BarChart(percentage:.constant(0.48))
                                   .frame(width:160, height: 10)
                           }
                       }
                   }
               }
               .padding(20)
               .background(Color.white)
               .cornerRadius(10)
            HStack(spacing: 10){
                   VStack(alignment: .leading, spacing: 0){
                       Divider().opacity(0)
                       
                       HStack(spacing :5){
                                       Image("myfood03")
                                           .resizable()
                                           .frame(width: 50, height: 50)
                           HStack(){
                               BarChart(percentage: .constant(0.15))
                                   .frame(width:160, height:10)
                           }
                           HStack{
                               BarChart(percentage:.constant(0.30))
                                   .frame(width:160, height: 10)
                           }
                       }
                   }
               }
               .padding(20)
               .background(Color.white)
               .cornerRadius(10)
            HStack(spacing: 10){
                   VStack(alignment: .leading, spacing: 0){
                       Divider().opacity(0)
                       
                       HStack(spacing :5){
                                       Image("myfood04")
                                           .resizable()
                                           .frame(width: 50, height: 50)
                           HStack(){
                               BarChart(percentage: .constant(0.09))
                                   .frame(width:160, height:10)
                           }
                           HStack{
                               BarChart(percentage:.constant(0.21))
                                   .frame(width:160, height: 10)
                           }
                       }
                   }
               }
               .padding(20)
               .background(Color.white)
               .cornerRadius(10)
            HStack(spacing: 10){
                   VStack(alignment: .leading, spacing: 0){
                       Divider().opacity(0)
                       
                       HStack(spacing :5){
                                       Image("myfood05")
                                           .resizable()
                                           .frame(width: 50, height: 50)
                           HStack(){
                               BarChart(percentage: .constant(0.04))
                                   .frame(width:160, height:10)
                           }
                           HStack{
                               BarChart(percentage:.constant(0.14))
                                   .frame(width:160, height: 10)
                           }
                       }
                   }
               }
               .padding(20)
               .background(Color.white)
               .cornerRadius(10)
            }
    }
}

struct TournamentWinningRate_Previews: PreviewProvider {
    static var previews: some View {
        TournamentWinningRate()
    }
}
