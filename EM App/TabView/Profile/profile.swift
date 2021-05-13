//
//  profile.swift
//  EM App
//
//  Created by Henry Krieger on 19.01.21.
//

import SwiftUI
import SafariServices
import MessageUI

struct profile: View {
    @State private var showPage: Bool = false
    
    @ObservedObject var userSettings = UserSettings()
    @Environment(\.openURL) var openURL
    
    @State var showSafari = false
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Text("Username")
                        Spacer()
                        Text("\(userSettings.username)")
                    }
                    HStack {
                        Text("Name")
                        Spacer()
                        Text("\(userSettings.firstName) \(userSettings.lastName)")
                    }
                    HStack {
                        Text("E-Mail")
                        Spacer()
                        Text("\(userSettings.email)")
                    }
                    HStack {
                        Text("School")
                        Spacer()
                        Text("\(userSettings.school)")
                    }
                    HStack {
                        Text("Class")
                        Spacer()
                        Text("\(userSettings.userClass)")
                    }
                    /*HStack {
                        Text("Private Account")
                        Spacer()
                        Ellipse()
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(userSettings.isPrivate ? .green : .red)
                    }*/
                    HStack {
                        Text("Notifications")
                        Spacer()
                        Ellipse()
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(userSettings.prefersNotifications ? .green : .red)
                    }
                }
                
                Section {
                    NavigationLink(destination: Text("July 2021")) {
                    //NavigationLink(destination: untisList()) {
                        Label("Untis", systemImage: "clock")
                    }
                    NavigationLink(destination: gradeCalc()) {
                        Label("Abi Calc", systemImage: "function")
                    }
                    //NavigationLink(destination: Text("soon")) {
                    NavigationLink(destination: gradeCalcMittelstufe()) {
                        Label("Grade Calc", systemImage: "function")
                    }
                }
                
                Section {
                    Button(action: { showSafari.toggle() }) {
                        Label("HLG Website", systemImage: "house").fullScreenCover(isPresented: $showSafari) {
                            SafariView(url: URL(string: "https://www.hlg-hamburg.de")!).ignoresSafeArea(edges: .all)
                        }
                    }
                    Button(action: { showSafari.toggle() }) {
                        Label("KaiFU Website", systemImage: "crown").fullScreenCover(isPresented: $showSafari) {
                            SafariView(url: URL(string: "https://www.kaifu-gymnasium.de")!).ignoresSafeArea(edges: .all)
                        }
                    }
                    Button(action: { showSafari.toggle() }) {
                        Label("Moodle", systemImage: "link").fullScreenCover(isPresented: $showSafari) {
                            SafariView(url: URL(string: "https://lms.lernen.hamburg")!).ignoresSafeArea(edges: .all)
                        }
                    }
                    Button(action: { showSafari.toggle() }) {
                        Label("itslearning", systemImage: "link").fullScreenCover(isPresented: $showSafari) {
                            SafariView(url: URL(string: "https://kaifu.itslearning.com")!).ignoresSafeArea(edges: .all)
                        }
                    }
                }
                
                Section {
                    Button(action: {
                        self.isShowingMailView.toggle()
                    }) {
                        Label("Send Beta Feedback", systemImage: "envelope")
                    }
                    .disabled(!MFMailComposeViewController.canSendMail())
                    .sheet(isPresented: $isShowingMailView) {
                        MailView(result: self.$result)
                    }
                    
                    Button(action: { showSafari.toggle() }) {
                        Label("Insights", systemImage: "link").fullScreenCover(isPresented: $showSafari) {
                            SafariView(url: URL(string: "https://www.notion.so/EM-App-abfb7af218ea43b4baed5ece1f8144e3")!).ignoresSafeArea(edges: .all)
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: aboutus()) {
                        Label("About Us", systemImage: "info")
                    }
                    NavigationLink(destination: PrivacyPolicy()) {
                        Label("Privacy Policy", systemImage: "hand.raised")
                    }
                }
            }
            .navigationTitle("Profile")
            .listStyle(InsetGroupedListStyle())
            .toolbar(content: {
                Button(action: { showPage.toggle() }) {
                    Label("", systemImage: "gear")
                        .font(.title3)
                }
            })
            .sheet(isPresented: $showPage, content: {
                settings()
            })
        }
    }
}

struct PrivacyPolicy: View {
    @State var showSafari: Bool = false
    
    var body: some View {
        List {
            Button(action: { showSafari.toggle() }) {
                Label("Privacy Policy", systemImage: "link").fullScreenCover(isPresented: $showSafari) {
                    SafariView(url: URL(string: "https://www.privacypolicies.com/live/a3287839-794c-4c4a-b883-f18a6e586f6f")!).ignoresSafeArea(edges: .all)
                }
            }
            
            Text("All data is only stored locally on your device and we are not able to view any of that data.")
            Text("Exception: If you give feedback you consent to sharing your email address with us")
            
            Section(header: Text("Contact Info")) {
                VStack(alignment: .leading) {
                    Text("Name")
                        .fontWeight(.bold)
                    Text("Only locally (First Name, Last Name)")
                }
                VStack(alignment: .leading) {
                    Text("Email Address")
                        .fontWeight(.bold)
                    Text("Only locally (E-Mail)")
                    Text("Exception: Feedback")
                }
                VStack(alignment: .leading) {
                    Text("Phone Number")
                        .fontWeight(.bold)
                    Text("-")
                }
                VStack(alignment: .leading) {
                    Text("Physical Address")
                        .fontWeight(.bold)
                    Text("-")
                }
                VStack(alignment: .leading) {
                    Text("Other User Contact Info")
                        .fontWeight(.bold)
                    Text("Only locally (Username, School, Role, Class)")
                }
            }
            Section(header: Text("User Content")) {
                VStack(alignment: .leading) {
                    Text("Emails or Text Messages")
                        .fontWeight(.bold)
                    Text("-")
                }
                VStack(alignment: .leading) {
                    Text("Photos or Videos")
                        .fontWeight(.bold)
                    Text("-")
                }
                VStack(alignment: .leading) {
                    Text("Audio Data")
                        .fontWeight(.bold)
                    Text("-")
                }
                VStack(alignment: .leading) {
                    Text("Gameplay Content")
                        .fontWeight(.bold)
                    Text("-")
                }
                VStack(alignment: .leading) {
                    Text("Customer Support")
                        .fontWeight(.bold)
                    Text("When you give feedback we get access to your email address.")
                }
                VStack(alignment: .leading) {
                    Text("Other User Content")
                        .fontWeight(.bold)
                    Text("-")
                }
            }
            Section(header: Text("Identifiers")) {
                VStack(alignment: .leading) {
                    Text("User ID")
                        .fontWeight(.bold)
                    Text("-")
                }
                VStack(alignment: .leading) {
                    Text("Device ID")
                        .fontWeight(.bold)
                    Text("-")
                }
            }
            Section(header: Text("Diagnostics")) {
                VStack(alignment: .leading) {
                    Text("Crash Data")
                        .fontWeight(.bold)
                    Text("Shared with us within beta phase for debugging")
                }
                VStack(alignment: .leading) {
                    Text("Performance Data")
                        .fontWeight(.bold)
                    Text("-")
                }
                VStack(alignment: .leading) {
                    Text("Other Diagnostic Data")
                        .fontWeight(.bold)
                    Text("-")
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Privacy Policy")
    }
}



struct profile_Previews: PreviewProvider {
    static var previews: some View {
        profile()
    }
}
