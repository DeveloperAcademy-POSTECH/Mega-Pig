//
//  Mega_PigApp.swift
//  Mega-Pig
//
//  Created by Choi Inho on 2022/04/07.
//

import SwiftUI
import Firebase
import FirebaseAuth
@main
struct Mega_PigApp: App {
    
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            let viewModel=AppViewModel()
            login_View()
                .environmentObject(viewModel)
                
        }
    }
}
class AppDelegate: NSObject ,UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
    
    
}
