//
//  loginPad.swift
//  EM App
//
//  Created by Henry Krieger on 13.06.21.
//

import SwiftUI

struct loginPad: View {
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
                MasterViewPad()
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
                                .disableAutocorrection(true)
                                .keyboardType(.emailAddress)
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
                        }
                        
                        Section(header: Text("School")) {
                            Picker(selection: $userSettings.school, label:
                                Text("School *")) {
                                ForEach(userSettings.schools, id: \.self) { school in
                                    Text(school)
                                }
                            }
                            Picker(selection: $userSettings.userType, label:
                                Text("Role")) {
                                ForEach(userSettings.types, id: \.self) { type in
                                    Text(type)
                                }
                            }
                            Picker(selection: $userSettings.userClass, label:
                                Text("Class *")) {
                                ForEach(userSettings.classes, id: \.self) { userClass in
                                    Text(userClass)
                                }
                            }
                        }
                        
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
                    }
                    .navigationTitle("Hello")
                    .listStyle(PlainListStyle())
                }
            }
        }
    }
}

struct MasterViewPad: View {
    var body: some View {
        tabView()
    }
}

struct loginPad_Previews: PreviewProvider {
    static var previews: some View {
        loginPad()
    }
}
