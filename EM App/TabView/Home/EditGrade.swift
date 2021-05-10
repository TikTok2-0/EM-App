//
//  EditGrade.swift
//  EM App
//
//  Created by Henry Krieger on 10.05.21.
//

import SwiftUI

struct EditGrade: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @ObservedObject var gradeData: FetchedResults<Subject>.Element
    
    @State var title = ""
    @State var eA = false
    @State var abitur = 10
    @State var abiCheck = false
    @State var s1 = 10
    @State var s2 = 10
    @State var s3 = 10
    @State var s4 = 10
    
    var body: some View {
        //NavigationView {
            List {
                Section(header: Text("Subject Details")) {
                    TextField("Title", text: $title)
                }
                Section(header: Text("Grades")) {
                    Stepper("S1: \(s1)P", value: $s1, in: 0...15)
                    Stepper("S2: \(s2)P", value: $s2, in: 0...15)
                    Stepper("S3: \(s3)P", value: $s3, in: 0...15)
                    Stepper("S4: \(s4)P", value: $s4, in: 0...15)
                }
                Section(header: Text("Abitur")) {
                    Toggle("Written/Oral Exam", isOn: $abiCheck)
                    Stepper("Abitur: \(abitur)P", value: $abitur, in: 0...15).disabled(!abiCheck)
                    Toggle("Higher Level", isOn: $eA)
                }
                Section {
                    Button(action: {
                        //guard self.comment != "" else {return}
                        /*let newSubject = Subject(context: viewContext)
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
                        newSubject.abiCheck = self.abiCheck*/
                        
                        self.gradeData.objectWillChange.send()
                        self.gradeData.title = self.title
                        self.gradeData.eA = self.eA
                        self.gradeData.abiCheck = self.abiCheck
                        self.gradeData.abitur = self.abitur
                        if self.eA {
                            self.gradeData.s1 = self.s1*2
                            self.gradeData.s2 = self.s2*2
                            self.gradeData.s3 = self.s3*2
                            self.gradeData.s4 = self.s4*2
                        } else {
                            self.gradeData.s1 = self.s1
                            self.gradeData.s2 = self.s2
                            self.gradeData.s3 = self.s3
                            self.gradeData.s4 = self.s4
                        }
                        try? self.viewContext.save()

                        // better do this at the end of activity
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Save Subject")
                    }
                }
            }
            .navigationTitle("Edit Subject")
            .listStyle(InsetGroupedListStyle())
        //}
        .onAppear {
            self.title = gradeData.title
            self.eA = gradeData.eA
            self.abitur = gradeData.abitur
            self.abiCheck = gradeData.abiCheck
            if gradeData.eA {
                self.s1 = gradeData.s1/2
                self.s2 = gradeData.s2/2
                self.s3 = gradeData.s3/2
                self.s4 = gradeData.s4/2
            } else {
                self.s1 = gradeData.s1
                self.s2 = gradeData.s2
                self.s3 = gradeData.s3
                self.s4 = gradeData.s4
            }
        }
    }
}

/*
struct EditGrade_Previews: PreviewProvider {
    static var previews: some View {
        EditGrade()
    }
}
*/
