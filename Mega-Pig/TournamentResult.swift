//
//  TournamentResult.swift
//  Mega-Pig
//
//  Created by 조성산 on 2022/04/11.
//

import SwiftUI

struct TournamentResult: View {
    var body: some View {
        ZStack {
        //GeometryReader
            VStack {
                VStack {
                    Text("푸드 토너먼트 결과")
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                        .foregroundColor(Color.accentColor)
                    
                }
                VStack(alignment: .leading, spacing: 5){
                    Divider().opacity(0)
                    
                    HStack(spacing :65){
                    Spacer().frame(width : 7)
                    
                        Text("우승 확률")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .foregroundColor(Color.black)
                            .lineLimit(1)
                        
                        Spacer().frame(width: 1)
                        
                        Text("승률")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                            .foregroundColor(Color.black)
//                            Spacer().frame(width : 1)

                    }

                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)


                    VStack{
                        VStack(spacing:5) {
                            TournamentWinningRate()
                        }
     
                    }

                
                .padding()
            }
        }

    }
}

struct TournamentResult_Previews: PreviewProvider {
    static var previews: some View {
        TournamentResult()
    }
}
