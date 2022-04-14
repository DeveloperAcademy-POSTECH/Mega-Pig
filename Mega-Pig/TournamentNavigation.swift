//
//  TournamentNavigation.swift
//  Mega-Pig
//
//  Created by 조성산 on 2022/04/11.
//

//
//  Tournament_navigation.swift
//  Mega-Pig
//
//  Created by 조성산 on 2022/04/10.
//

import SwiftUI

struct TournamentNavigation: View {
    var body: some View {
        ZStack{

                    NavigationView{
                        ScrollView{
                            ZStack{
                                Image("foodtournament")
                                    .resizable()
                                    .frame(width: 350, height: 600)
                                    .blur(radius: 10)
                                VStack(spacing : 20){

                            
                                    Text("토너먼트 오픈까지")
                                        .fontWeight(.bold)
                                        .font(.system(size: 25))
                                        .foregroundColor(Color.accentColor)

                                    Text("남은 시간")
                                        .fontWeight(.bold)
                                        .font(.system(size: 25))
                                        .foregroundColor(Color.accentColor)
                                    TournamentTimer()
                                        NavigationLink("지난 결과 확인", destination: OtherScreen())
                                                    .font(.system(size:25))
                                                    .foregroundColor(Color.black)

                            }
                        }
                            
                            

                            
                        
                           
                        }

                    }
    
                    
                    

                    
                
            
        }
    }
}

struct OtherScreen: View{
    var body: some View {
        TournamentResult()
    }
}

struct Tournament_navigation_Previews: PreviewProvider {
    static var previews: some View {
        TournamentNavigation()
    }
}

