//
//  login.swift
//  EM App
//
//  Created by Henry Krieger on 19.01.21.
//

import SwiftUI
import Combine

struct login: View {
    @State var showLoginView: Bool = false
    @State private var acceptTerms: Bool = false
    
    @State private var confirmPass: String = ""
    @State private var passConfirmed: Bool = false
    
    @ObservedObject var userSettings = UserSettings()
    
    var body: some View {
        VStack {
            if showLoginView {
                MasterView()
                    //.animation(.spring())
                    .transition(.slide)
            } else {
                NavigationView {
                    Form {
                        Section(header: Text("Your Info")) {
                            TextField("First Name", text: $userSettings.firstName)
                            TextField("Last Name", text: $userSettings.lastName)
                            TextField("Username", text: $userSettings.username)
                            TextField("E-Mail", text: $userSettings.email)
                            Toggle(isOn: $userSettings.isPrivate) {
                                Text("Private Account")
                            }
                            Toggle(isOn: $userSettings.prefersNotifications) {
                                Text("Notifications")
                            }
                            Picker(selection: $userSettings.ringtone, label: Text("Ringtone")) {
                                ForEach(userSettings.ringtones, id: \.self) { ringtone in
                                    Text(ringtone)
                                }
                            }
                        }
                        
                        Section(header: Text("Password")) {
                            HStack {
                                SecureField("Password", text: $userSettings.password)
                                Image(systemName: "eye")
                            }
                            SecureField("Confirm Password", text: $confirmPass)
                        }
                        
                        Section(header: Text("School")) {
                            Picker(selection: $userSettings.userType, label: Text("Type")) {
                                ForEach(userSettings.types, id: \.self) { userType in
                                    Text(userType)
                                }
                            }
                            
                            Picker(selection: $userSettings.userClass, label: Text("Class")) {
                                ForEach(userSettings.classes, id: \.self) { userClass in
                                    Text(userClass)
                                }
                            }
                        }
                        
                        Section(header: Text("Terms and Conditions")) {
                            NavigationLink(
                                destination: TaC(),
                                label: {
                                    Text("Read TaC")
                                })
                            
                            Toggle(isOn: $acceptTerms, label: {
                                Text("Accept Terms and Conditions")
                            })
                        }
                        
                        Section(header: Text("Beta")) {
                            Button(action: { showLoginView.toggle() }) {
                                Text("Access Beta")
                            }.disabled(!acceptTerms)
                        }
                        
                        Section(header: Text("Start")) {
                            Button(action: {}) {
                                Text("Go")
                            }.disabled(true)
                        }
                    }
                    .navigationTitle("Hello")
                }
            }
        }
    }
}

class UserSettings: ObservableObject {
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

struct MasterView: View {
    var body: some View {
        tabView()
    }
}

struct TaC: View {
    var body: some View {
        Text("Read through our terms and conditions")
    }
}

struct login_Previews: PreviewProvider {
    static var previews: some View {
        login()
    }
}
