//
//  settings.swift
//  EM App
//
//  Created by Henry Krieger on 15.01.21.
//

import SwiftUI

struct settings: View {
    @ObservedObject var userSettings = UserSettings()
    
    var body: some View {
        NavigationView {
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
                    TextField("E-Mail", text: $userSettings.email)
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
            }
            .navigationTitle("Settings")
        }
    }
}

struct settings_Previews: PreviewProvider {
    static var previews: some View {
        settings()
    }
}
