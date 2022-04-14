//
//  TestView.swift
//  Mega-Pig
//
//  Created by 황정현 on 2022/04/08.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var viewModel: AppViewModel

    var body: some View {
            
        Button( action: {viewModel.signout()}, label:{ Text("sign out")})
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
