//
//  EatenView.swift
//  Mega-Pig
//
//  Created by Choi Inho on 2022/04/14.
//

import SwiftUI


struct EatenView: View {
	@State private var eatList : [String] = ["와퍼", "콰트로치즈버거"]
	@Binding var selection : Int
	@Binding var image : UIImage?
	
	init(selection : Binding<Int>, image : Binding<UIImage?>){
		_selection = selection
		_image = image
		
	}

	
	var body: some View {
		VStack {
			Text("드시지 않은 음식은 삭제해주세요.")
			List {
				ForEach(eatList, id: \.self) {
					Text("\($0)")
				}
				.onDelete(perform: removeRoes)
			}
			
		}
	}
	func removeRoes(at offsets: IndexSet) {
		eatList.remove(atOffsets: offsets)
	}
}

