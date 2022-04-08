//
//  ListView.swift
//  Mega-Pig
//
//  Created by 한연희 on 2022/04/08.
//

import SwiftUI

let lunchMenu = ["칼로리: 568Cal", "지방: 30.6g", "탄수화물: 24.56", "단백질: 45.16g"]
let dinnerMenu = ["칼로리: 568Cal", "지방: 30.6g", "탄수화물: 24.56", "단백질: 45.16g"]

struct CheckListView: View {
    var body: some View {
        List {
            Text("돈까스 1인분 (200g)").font(.title)
            ForEach(lunchMenu, id: \.self) {
                Text($0)
            }
            Text("쫄면").font(.title)
            ForEach(dinnerMenu, id: \.self) {
                Text($0)
            }
        }
    }
}

struct CheckListView_Previews: PreviewProvider {
    static var previews: some View {
        CheckListView()
    }
}

