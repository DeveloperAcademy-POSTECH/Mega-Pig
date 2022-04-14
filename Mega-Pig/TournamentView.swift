//
//  TournamentView.swift
//  Mega-Pig
//
//  Created by 조성산 on 2022/04/11.
//

import SwiftUI

struct TournamentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @State private var isSheetPresented = false
    
    var body: some View {
        if viewModel.checktour{
            
            TournamentNavigation().navigationBarHidden(true)
        }
        else{
            real_TournamentView()
        }
    }



}

struct real_TournamentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @State  var foodCard1 = "myfood01"
    @State  var foodCard2 = "myfood02"
    @State private var isSheetPresented = false
    
    var body: some View {
        VStack {
            Text("2022년 3월 14일")
                .foregroundColor(Color.accentColor)
                .font(.system(size: 20))
            Text("푸드 토너먼트")
                .foregroundColor(Color.accentColor)
                .font(.system(size: 30))
            VStack{
//                Image(foodCard1)
//                    .resizable()
//                    .scaledToFit()
//                Text("VS")
//                    .font(.system(size : 25))
//                Image(foodCard2)
//                    .resizable()
//                    .scaledToFit()
                
                Button(action : {
                    if(viewModel.count==0){
                        viewModel.checktour=true
                        viewModel.selection=2
                    }
                    viewModel.count-=1
                    let food1Rand = Int.random(in: 1...8 )
                    let food2Rand = Int.random(in: 9...16)
                
                    foodCard1 = "myfood0" + String(food1Rand)
                    foodCard2 = "myfood0" + String(food2Rand)
                }, label: {
                    VStack{
                    Image(foodCard1)
                        .resizable()
                        .scaledToFit()
                        Text("VS")
//                            .font(.system(size : 25))
                    Image(foodCard2)
                        .resizable()
                        .scaledToFit()
                    }
                        
                    
                }
            )
                
                
            }.padding()
            
            
        }
        .sheet(isPresented: $isSheetPresented) {
            TournamentFinishView()
        }
    }


struct TournamentView_Previews: PreviewProvider {
    static var previews: some View {
        real_TournamentView()
    }
}
}



