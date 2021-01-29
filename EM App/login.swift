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
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var password: String = ""
    @State private var confirmPass: String = ""
    @State private var passConfirmed: Bool = false
    
    @State private var selectedChar = userType.Student
    enum userType: String, CaseIterable, Codable {
        case Student
        case Teacher
        case Parent
        case Guest
    }
    
    @State private var selectedClass = userClass.Twelve
    enum userClass: Int, CaseIterable, Codable {
        case FiveA
        case FiveB
        case FiveC
        case FiveD
        case FiveE
        case SixA
        case SixB
        case SixC
        case SixD
        case SevenA
        case SevenB
        case SevenC
        case SevenD
        case EightA
        case EightB
        case EightC
        case EightD
        case NineA
        case NineB
        case NineC
        case NineD
        case TenA
        case TenB
        case TenC
        case TenD
        case Eleven
        case Twelve
    }
    
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
                            TextField("First Name", text: $firstName)
                            TextField("Last Name", text: $lastName)
                            TextField("Username", text: $username)
                            TextField("E-Mail", text: $email)
                        }
                        
                        Section(header: Text("Password")) {
                            SecureField("Password", text: $password)
                            SecureField("Confirm Password", text: $confirmPass)
                        }
                        
                        Section(header: Text("School")) {
                            Picker("User", selection: $selectedChar) {
                                Text("Student").tag(userType.Student)
                                Text("Teacher").tag(userType.Teacher)
                                Text("Parent").tag(userType.Parent)
                                Text("Guest").tag(userType.Guest)
                            }
                            
                            Picker("Class", selection: $selectedClass) {
                                Group {
                                    Text("5a").tag(userClass.FiveA)
                                    Text("5b").tag(userClass.FiveB)
                                    Text("5c").tag(userClass.FiveC)
                                    Text("5d").tag(userClass.FiveD)
                                    Text("5e").tag(userClass.FiveE)
                                }
                                Group {
                                    Text("6a").tag(userClass.SixA)
                                    Text("6b").tag(userClass.SixB)
                                    Text("6c").tag(userClass.SixC)
                                    Text("6d").tag(userClass.SixD)
                                }
                                Group {
                                    Text("7a").tag(userClass.SevenA)
                                    Text("7b").tag(userClass.SevenB)
                                    Text("7c").tag(userClass.SevenC)
                                    Text("7d").tag(userClass.SevenD)
                                }
                                Group {
                                    Text("8a").tag(userClass.EightA)
                                    Text("8b").tag(userClass.EightB)
                                    Text("8c").tag(userClass.EightC)
                                    Text("8d").tag(userClass.EightD)
                                }
                                Group {
                                    Text("9a").tag(userClass.NineA)
                                    Text("9b").tag(userClass.NineB)
                                    Text("9c").tag(userClass.NineC)
                                    Text("9d").tag(userClass.NineD)
                                }
                                Group {
                                    Text("10a").tag(userClass.TenA)
                                    Text("10b").tag(userClass.TenB)
                                    Text("10c").tag(userClass.TenC)
                                    Text("10d").tag(userClass.TenD)
                                }
                                Group {
                                    Text("11").tag(userClass.Eleven)
                                }
                                Group {
                                    Text("12").tag(userClass.Twelve)
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
