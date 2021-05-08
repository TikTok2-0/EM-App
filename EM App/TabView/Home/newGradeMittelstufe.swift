//
//  newGradeMittelstufe.swift
//  EM App
//
//  Created by Henry Krieger on 12.03.21.
//

import SwiftUI

struct newGradeMittelstufe: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @State var title = ""
    @State var year: Int = 5
    @State var selectedGrade = ""
    @State var grade = ["1+ / 15", "1 / 14", "1- / 13", "2+ / 12", "2 / 11", "2- / 10", "3+ / 9", "3 / 8", "3- / 7", "4+ / 6", "4 / 5", "4- / 4", "5+ / 3", "5 / 2", "5- / 1", "6 / 0"]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Subject Details")) {
                    TextField("Title", text: $title)
                    Stepper("\(year). Klasse", value: $year, in: 5...10)
                }
                Section(header: Text("Grade")) {
                    Picker(selection: $selectedGrade, label: Text("Final Grade:")) {
                        ForEach(grade, id: \.self) { grade in
                            Text(grade)
                        }
                    }
                }
                Section {
                    Button(action: {
                        //guard self.comment != "" else {return}
                            let newGrade = Grade(context: viewContext)
                            newGrade.title = self.title
                            newGrade.year = Int64(self.year)
                            if selectedGrade == "1+ / 15" {
                                newGrade.grade = 15
                            } else if selectedGrade == "1 / 14" {
                                newGrade.grade = 14
                            } else if selectedGrade == "1- / 13" {
                                newGrade.grade = 13
                            } else if selectedGrade == "2+ / 12" {
                                newGrade.grade = 12
                            } else if selectedGrade == "2 / 11" {
                                newGrade.grade = 11
                            } else if selectedGrade == "2- / 10" {
                                newGrade.grade = 10
                            } else if selectedGrade == "3+ / 9" {
                                newGrade.grade = 9
                            } else if selectedGrade == "3 / 8" {
                                newGrade.grade = 8
                            } else if selectedGrade == "3- / 7" {
                                newGrade.grade = 7
                            } else if selectedGrade == "4+ / 6" {
                                newGrade.grade = 6
                            } else if selectedGrade == "4 / 5" {
                                newGrade.grade = 5
                            } else if selectedGrade == "4- / 4" {
                                newGrade.grade = 4
                            } else if selectedGrade == "5+ / 3" {
                                newGrade.grade = 3
                            } else if selectedGrade == "5 / 2" {
                                newGrade.grade = 2
                            } else if selectedGrade == "5- / 1" {
                                newGrade.grade = 1
                            } else if selectedGrade == "6 / 0" {
                                newGrade.grade = 0
                            }
                        
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

struct newGradeMittelstufe_Previews: PreviewProvider {
    static var previews: some View {
        newGrade()
    }
}
