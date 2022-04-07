//
//  DietLogView.swift
//  Mega-Pig
//
//  Created by 한연희 on 2022/04/08.
//

import SwiftUI

struct DietLogView: View {
    var body: some View {
        Image("firechicken")
            .resizable()
            .scaledToFill()
            .frame(width: 140)
            .clipped()
    }
}

struct DietLogView_Previews: PreviewProvider {
    static var previews: some View {
        DietLogView()
    }
}
