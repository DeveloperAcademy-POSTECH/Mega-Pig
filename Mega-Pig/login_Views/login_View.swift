//
//  login_View.swift
//  Mega-Pig
//
//  Created by dohankim on 2022/04/07.
//

import SwiftUI
import Firebase
import FirebaseAuth
class AppViewModel: ObservableObject{
    let auth = Auth.auth()
    
    @Published var signedIn = false
    @Published var findpassword = false
    @Published var checkemail = false
    @Published var checktour = false
    @Published var count = 5
    
    @State var selection = 1
    
    var isSignedIn :Bool{
        return auth.currentUser != nil
    }
    func signIn(email :String, password :String){
        auth.signIn(withEmail: email, password: password) {[weak self] result, error in
            guard result != nil,error == nil else{
                return
            }
            DispatchQueue.main.async {
                self?.signedIn=true
            }
            
        }
        
        
    }
    
    func signUp(email : String, password : String){
        auth.createUser(withEmail: email, password: password) { [weak self]result, error in
            guard result != nil,error == nil else{
                return
            }
            DispatchQueue.main.async {
                self?.signedIn=true
            }
        }
    }
    
    func signout(){
        try? auth.signOut()
        self.signedIn=false
    }
    
    func sendresetemail(email : String,action : ActionCodeSettings){
        auth.sendPasswordReset(withEmail: email, actionCodeSettings: action) { error in
            guard error == nil else{
                return}
        }
        checkemail=true
    }
}

struct login_View: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
            if viewModel.signedIn{
                ContentView()
                    .navigationBarHidden(true)//로그인후 들어갈 뷰 넣기
            }
            else{
                NavigationView{real_login_View()}
                    .onAppear{
                        viewModel.signedIn=true
                    }
            }
    }
    
}

struct real_login_View: View {
    @State var username:String = ""
    @State var password:String = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Image("trafficlight 2")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Diet Light")
                .bold()
                .font(.title)
            Text("당신의 건강 신호등").font(.subheadline)
            TextField("Email",text: $username)
                .padding()
                .background(Color(.systemGray6))
                .autocapitalization(.none)
                .disableAutocorrection(true)
            SecureField("Password",text: $password)
                .padding()
                .background(Color(.systemGray6))
            
            Button(action: {
                guard !username.isEmpty, !password.isEmpty else{return}
                viewModel.signIn(email: username, password: password)
            }, label: {
                HStack{
                    Spacer()
                    Text("로그인")
                        .foregroundColor(Color.white)
                        .padding()
                    Spacer()
                }
                .background(Color.accentColor)
            })
            HStack{NavigationLink(destination: signup_email_View()
            ) {
                Text("회원가입   | ")}
                NavigationLink(destination: find_Pw_View().navigationBarHidden(true)) {
                    Text("비밀번호 재설정 이메일 보내기")
                }
            }
            
        }
        
        
        .padding()
        
        
    }
    
}




