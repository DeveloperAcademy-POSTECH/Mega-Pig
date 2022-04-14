//
//  BarChart.swift
//  Mega-Pig
//
//  Created by 조성산 on 2022/04/11.
//

import SwiftUI

struct BarChart : View {
    @Binding var percent: Float

    init(percentage: Binding<Float>){
        self._percent = percentage
    }

    var body: some View {

        HStack {
            Text("Rate").padding (5)
            Spacer()
            Text("\(String(format: "%02.f", arguments: [self.percent * 100]))%").padding(5)
        }
        .background(LeftPart(pct: CGFloat(percent)).fill(Color.red))
        .background(RightPart(pct: CGFloat(percent)).fill(Color.green))
        .padding(10)
    }

    struct LeftPart: Shape {
        let pct: CGFloat

        func path(in rect: CGRect) -> Path {
            var p = Path()
            p.addRoundedRect(in: CGRect(x: 0, y: 0, width: rect.size.width * pct, height: rect.size.height), cornerSize: .zero)
            return p
        }
    }

    struct RightPart: Shape {
        let pct: CGFloat

        func path(in rect: CGRect) -> Path {
            var p = Path()
            p.addRoundedRect(in: CGRect(x: rect.size.width * pct, y: 0, width: rect.size.width * (1-pct), height: rect.size.height), cornerSize: .zero)
            return p
        }
    }

}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart(percentage: .constant(0.75))
    }
}
