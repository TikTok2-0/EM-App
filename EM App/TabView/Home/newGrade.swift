//
//  newGrade.swift
//  EM App
//
//  Created by Henry Krieger on 05.03.21.
//

import SwiftUI

struct newGrade: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @State var title = ""
    @State var eA = false
    @State var abitur = 10
    @State var abiCheck = false
    @State var s1 = 10
    @State var s2 = 10
    @State var s3 = 10
    @State var s4 = 10
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Subject Details")) {
                    TextField("Title", text: $title)
                }
                Section(header: Text("Oberstufe")) {
                    Stepper("S1: \(s1)P", value: $s1, in: 0...15)
                    Stepper("S2: \(s2)P", value: $s2, in: 0...15)
                    Stepper("S3: \(s3)P", value: $s3, in: 0...15)
                    Stepper("S4: \(s4)P", value: $s4, in: 0...15)
                }
                Section(header: Text("Abitur")) {
                    Toggle("Schriftliches/Mündliches Prüfungsfach?", isOn: $abiCheck)
                    Stepper("Abitur: \(abitur)P", value: $abitur, in: 0...15).disabled(!abiCheck)
                    Toggle("Erhöht?", isOn: $eA)
                }
                Section {
                    Button(action: {
                        //guard self.comment != "" else {return}
                            let newSubject = Subject(context: viewContext)
                            newSubject.title = self.title
                            if self.eA {
                                newSubject.s1 = Int(self.s1)*2
                                newSubject.s2 = Int(self.s2)*2
                                newSubject.s3 = Int(self.s3)*2
                                newSubject.s4 = Int(self.s4)*2
                            } else {
                                newSubject.s1 = Int(self.s1)
                                newSubject.s2 = Int(self.s2)
                                newSubject.s3 = Int(self.s3)
                                newSubject.s4 = Int(self.s4)
                            }
                            newSubject.eA = self.eA
                            if self.abiCheck {
                                newSubject.abitur = self.abitur
                            } else {
                                newSubject.abitur = 0
                            }
                            newSubject.abiCheck = self.abiCheck
                        
                            do {
                                try viewContext.save()
                                //print("Series saved.")
                                presentationMode.wrappedValue.dismiss()
                            } catch {
                                print(error.localizedDescription)
                            }
                    }) {
                        Text("Save Subject")
                    }
                }
            }
            .navigationTitle("New Subject")
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct newGrade_Previews: PreviewProvider {
    static var previews: some View {
        newGrade()
    }
}
