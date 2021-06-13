//
//  settingsPad.swift
//  EM App
//
//  Created by Henry Krieger on 13.06.21.
//

import SwiftUI

struct settingsPad: View {
    @ObservedObject var userSettings = UserSettings()
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Form {
            Section(header: Text("Important")) {
                Text("Restart the App to apply the changes")
                    .font(.caption)
                    .frame(width: nil, height: 50, alignment: .center)
            }
            
            Section(header: Text("Your Info")) {
                TextField("First Name", text: $userSettings.firstName)
                TextField("Last Name", text: $userSettings.lastName)
                TextField("Username", text: $userSettings.username)
                    .autocapitalization(.none)
                TextField("E-Mail", text: $userSettings.email)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                /*Toggle(isOn: $userSettings.isPrivate) {
                    Text("Private Account")
                }*/
                Picker(selection: $userSettings.userClass, label: Text("Class")) {
                    ForEach(userSettings.classes, id: \.self) { userClass in
                        Text(userClass)
                    }
                }
                Toggle(isOn: $userSettings.prefersNotifications) {
                    Text("Notifications")
                }
                /*Picker(selection: $userSettings.ringtone, label: Text("Ringtone")) {
                    ForEach(userSettings.ringtones, id: \.self) { ringtone in
                        Text(ringtone)
                    }
                }*/
            }
            
            Section(header: Text("Accent Color")) {
                Button(action: { userSettings.accentColor = "Default Blue" }) {
                    HStack {
                        Text("Default")
                            .foregroundColor(Color("Default Blue"))
                        Spacer()
                        Ellipse()
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(Color("Default Blue"))
                    }
                }
                Button(action: { userSettings.accentColor = "Schlaganfall Schwarz" }) {
                    HStack {
                        Text("Schlaganfall Schwarz")
                            .foregroundColor(Color("Schlaganfall Schwarz"))
                        Spacer()
                        Ellipse()
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(Color("Schlaganfall Schwarz"))
                    }
                }
                Button(action: { userSettings.accentColor = "Einhundertsiebenundachzig Grün" }) {
                    HStack {
                        Text("Einhundertsiebenundachzig Grün")
                            .foregroundColor(Color("Einhundertsiebenundachzig Grün"))
                        Spacer()
                        Ellipse()
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(Color("Einhundertsiebenundachzig Grün"))
                    }
                }
                Button(action: { userSettings.accentColor = "Prinzen Pink" }) {
                    HStack {
                        Text("Prinzen Pink")
                            .foregroundColor(Color("Prinzen Pink"))
                        Spacer()
                        Ellipse()
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(Color("Prinzen Pink"))
                    }
                }
                Button(action: { userSettings.accentColor = "Geringverdiener Grau" }) {
                    HStack {
                        Text("Geringverdiener Grau")
                            .foregroundColor(Color("Geringverdiener Grau"))
                        Spacer()
                        Ellipse()
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(Color("Geringverdiener Grau"))
                    }
                }
                Button(action: { userSettings.accentColor = "Rote Rakete" }) {
                    HStack {
                        Text("Rote Rakete")
                            .foregroundColor(Color("Rote Rakete"))
                        Spacer()
                        Ellipse()
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(Color("Rote Rakete"))
                    }
                }
                Button(action: { userSettings.accentColor = "Corona Coral" }) {
                    HStack {
                        Text("Corona Coral")
                            .foregroundColor(Color("Corona Coral"))
                        Spacer()
                        Ellipse()
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(Color("Corona Coral"))
                    }
                }
            }
            
            Section(header: Text("App Icon")) {
                Button(action: { UIApplication.shared.setAlternateIconName(nil) }) {
                    HStack {
                        if colorScheme == .dark {
                            Text("Dark Logo")
                                .foregroundColor(.white)
                        } else {
                            Text("Dark Logo")
                                .foregroundColor(.black)
                        }
                        Spacer()
                        Image("Logo_bluegreen")
                            .resizable()
                            .frame(width: 48, height: 48, alignment: .center)
                            .cornerRadius(12.0)
                    }
                }
                Button(action: {
                    UIApplication.shared.setAlternateIconName("AppIcon-2")
                }) {
                    HStack {
                        if colorScheme == .dark {
                            Text("Light Logo")
                                .foregroundColor(.white)
                        } else {
                            Text("Light Logo")
                                .foregroundColor(.black)
                        }
                        Spacer()
                        Image("Logo_orangepink")
                            .resizable()
                            .frame(width: 48, height: 48, alignment: .center)
                            .cornerRadius(12.0)
                    }
                }
            }
            
            Section(header: Text("DANGER ZONE")) {
                Button(action: { userSettings.firstLogin = true }) {
                    Label("Logout", systemImage: "person.crop.circle.badge.xmark")
                        .foregroundColor(.red)
                }
            }
        }
        .navigationTitle("Settings")
    }
}

struct settingsPad_Previews: PreviewProvider {
    static var previews: some View {
        settingsPad()
    }
}
