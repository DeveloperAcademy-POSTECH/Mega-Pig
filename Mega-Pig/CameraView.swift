//
//  CameraView.swift
//  Mega-Pig
//
//  Created by Choi Inho on 2022/04/14.
//

import SwiftUI

struct CameraView: View {
	
	@State private var showSheet : Bool = false
	@State private var showImagePicker : Bool = false
	@State private var sourceType : UIImagePickerController.SourceType = .camera
	@Binding private var image : UIImage?
	@Binding private var selection : Int
	
	init(image : Binding<UIImage?>, selection : Binding<Int>){
		_image = image
		_selection = selection
	}
	
	var body: some View {
		NavigationView {
			VStack{
				
				Image(uiImage: image ?? UIImage(named: "placeholder")!)
					.resizable()
					.frame(width: 300, height: 300)
				
				Button("Choose Picture") {
					self.showSheet = true
				}.padding()
					.actionSheet(isPresented : $showSheet){
						ActionSheet(title: Text("Select Photo"),
									message: Text("Choose"), buttons: [
										.default(Text("Photo Library")) {
											self.showImagePicker = true
											self.sourceType = .photoLibrary
										},
										.default(Text("Camera")) {
											self.showImagePicker = true
											self.sourceType = .camera
										},
										.cancel()
									])
					}
				NavigationLink(destination: EatenView(selection: $selection, image: $image)){
					Text("이미지 분석하기")
				}
			}.navigationTitle("사진 분석기")
		}.sheet(isPresented: $showImagePicker) {
			ImagePicker(image: $image, isShown: self.$showImagePicker, sourceType: self.sourceType, selection: $selection)
		}
	}
}
