//
//  TournamentTimer.swift
//  Mega-Pig
//
//  Created by 조성산 on 2022/04/11.
//

import SwiftUI

struct TournamentTimer: View {

    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State var timeRemaining: String = " "
    let futureDate: Date = Calendar.current.date(byAdding: .minute, value: 30, to: Date()) ?? Date()
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
        let hours = remaining.hour
        let minutes = remaining.minute
        let seconds = remaining.second
        timeRemaining =
        "\(hours!) : \(minutes!) : \(seconds!)"
    }
    
    
    var body: some View {
        ZStack{

            
            Text(timeRemaining)
                .font(.system(size: 50, weight: .semibold, design: .rounded))
                .foregroundColor(.accentColor)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
        }
        .onReceive(timer, perform: { _ in updateTimeRemaining()})
        
    }
  
}

struct TournamentTimer_Previews: PreviewProvider {
    static var previews: some View {
        TournamentTimer()
    }
}
