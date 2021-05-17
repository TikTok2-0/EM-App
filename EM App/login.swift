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
    
    @State var allowNotifications: Bool = false
    
    @ObservedObject var userSettings = UserSettings()
    
    @State var required: Bool = (
        UserSettings().school != "" && UserSettings().userClass != ""
    )
    
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
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                            TextField("E-Mail", text: $userSettings.email)
                                .autocapitalization(.none)
                                .keyboardType(.emailAddress)
                                .disableAutocorrection(true)
                            /*Toggle(isOn: $userSettings.isPrivate) {
                                Text("Private Account")
                            }*/
                            Button(action: {
                                allowNotifications = true
                                let manager = LocalNotificationManager()
                                manager.requestAuthorization()
                            }) {
                                Label("Allow Notifications", systemImage: "exclamationmark.circle")
                            }
                            Toggle(isOn: $userSettings.prefersNotifications) {
                                Text("Notifications")
                            }.disabled(!allowNotifications)
                            /*Picker(selection: $userSettings.ringtone, label: Text("Ringtone")) {
                                ForEach(userSettings.ringtones, id: \.self) { ringtone in
                                    Text(ringtone)
                                }
                            }*/
                        }
                        
                        /*
                        Section(header: Text("Password")) {
                            HStack {
                                SecureField("Password", text: $userSettings.password)
                                Image(systemName: "eye")
                            }
                            SecureField("Confirm Password", text: $confirmPass)
                        }*/
                        
                        Section(header: Text("School")) {
                            Picker(selection: $userSettings.school, label: Text("School *")) {
                                ForEach(userSettings.schools, id: \.self) { school in
                                    Text(school)
                                }
                            }
                            
                            Picker(selection: $userSettings.userType, label: Text("Role")) {
                                ForEach(userSettings.types, id: \.self) { userType in
                                    Text(userType)
                                }
                            }
                            
                            Picker(selection: $userSettings.userClass, label: Text("Class *")) {
                                ForEach(userSettings.classes, id: \.self) { userClass in
                                    Text(userClass)
                                }
                            }
                        }
                        
                        /*Section(header: Text("Terms and Conditions")) {
                            NavigationLink(
                                destination: TaC(),
                                label: {
                                    Text("Read TaC")
                                })
                            
                            Toggle(isOn: $acceptTerms, label: {
                                Text("Accept Terms and Conditions")
                            })
                        }*/
                        
                        Section(header: Text("Beta")) {
                            Button(action: {
                                showLoginView.toggle()
                                userSettings.firstLogin.toggle()
                                
                            }) {
                                Text("Open Beta")
                            }.disabled(
                                UserSettings().school == "" || UserSettings().userClass == ""
                            )
                        }
                        
                        /*Section(header: Text("Start")) {
                            Button(action: {}) {
                                Text("Go")
                            }.disabled(true)
                        }*/
                    }
                    .navigationTitle("Hello")
                }
            }
        }
    }
}

struct MasterView: View {
    var body: some View {
        tabView()
    }
}

struct TaC: View {
    var body: some View {
        Text("Our terms and conditions \nare under construction")
            .padding()
    }
}

struct login_Previews: PreviewProvider {
    static var previews: some View {
        login()
    }
}
