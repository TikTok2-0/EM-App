//
//  ContentView.swift
//  EM App
//
//  Created by Henry Krieger on 12.01.21.
//

import SwiftUI
//import CoreData

struct ContentView: View {
    //@EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var userSettings = UserSettings()
        
    var body: some View {
        if userSettings.firstLogin {
            login()
        } else {
            tabView()
        }
        /*VStack {
            if viewRouter.currentPage == "onboardingView" {
                login()
            } else if viewRouter.currentPage == "homeView" {
                tabView()
            }
        }*/
    }
}
/*
class ViewRouter: ObservableObject {
    @Published var currentPage: String
}*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}


class UserSettings: ObservableObject {
    @Published var firstLogin: Bool {
        didSet {
            UserDefaults.standard.set(firstLogin, forKey: "firstLogin")
        }
    }
    
    @Published var firstName: String {
        didSet {
            UserDefaults.standard.set(firstName, forKey: "firstName")
        }
    }
    
    @Published var lastName: String {
        didSet {
            UserDefaults.standard.set(lastName, forKey: "lastName")
        }
    }
    
    @Published var username: String {
        didSet {
            UserDefaults.standard.set(username, forKey: "username")
        }
    }
    
    @Published var email: String {
        didSet {
            UserDefaults.standard.set(email, forKey: "email")
        }
    }
    
    @Published var isPrivate: Bool {
        didSet {
            UserDefaults.standard.set(isPrivate, forKey: "isAccountPrivate")
        }
    }
    
    @Published var prefersNotifications: Bool {
        didSet {
            UserDefaults.standard.set(prefersNotifications, forKey: "prefersNotifications")
        }
    }
    
    @Published var ringtone: String {
        didSet {
            UserDefaults.standard.set(ringtone, forKey: "ringtone")
        }
    }
    public var ringtones = ["Chimes", "Signal", "Waves"]
    
    @Published var password: String {
        didSet {
            UserDefaults.standard.set(password, forKey: "password")
        }
    }
    
    @Published var userClass: String {
        didSet {
            UserDefaults.standard.set(userClass, forKey: "userClass")
        }
    }
    public var classes = ["5a", "5b", "5c", "5d", "5e", "6a", "6b", "6c", "6d", "6e", "7", "8", "9", "10", "11", "12"]
    
    @Published var userType: String {
        didSet {
            UserDefaults.standard.set(userType, forKey: "userType")
        }
    }
    public var types = ["Student", "Teacher", "Parent", "Guest"]
    
    init() {
        self.firstLogin = UserDefaults.standard.object(forKey: "firstLogin") as? Bool ?? true
        self.firstName = UserDefaults.standard.object(forKey: "firstName") as? String ?? ""
        self.lastName = UserDefaults.standard.object(forKey: "lastName") as? String ?? ""
        self.username = UserDefaults.standard.object(forKey: "username") as? String ?? ""
        self.email = UserDefaults.standard.object(forKey: "email") as? String ?? ""
        self.isPrivate = UserDefaults.standard.object(forKey: "isAccountPrivate") as? Bool ?? true
        self.prefersNotifications = UserDefaults.standard.object(forKey: "prefersNotifications") as? Bool ?? false
        self.ringtone = UserDefaults.standard.object(forKey: "ringtone") as? String ?? ""
        self.password = UserDefaults.standard.object(forKey: "password") as? String ?? ""
        self.userClass = UserDefaults.standard.object(forKey: "userClass") as? String ?? ""
        self.userType = UserDefaults.standard.object(forKey: "userType") as? String ?? ""
    }
}
