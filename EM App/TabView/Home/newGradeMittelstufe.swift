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
    @State var grade = ["1+ / 15P", "1 / 14P", "1- / 13P", "2+ / 12P", "2 / 11P", "2- / 10P", "3+ / 9P", "3 / 8P", "3- / 7P", "4+ / 6P", "4 / 5P", "4- / 4P", "5+ / 3P", "5 / 2P", "5- / 1P", "6 / 0P"]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Subject Details")) {
                    TextField("Title", text: $title)
                    //Stepper("\(year). Klasse", value: $year, in: 5...10)
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
                            if selectedGrade == "1+ / 15P" {
                                newGrade.grade = 15
                            } else if selectedGrade == "1 / 14P" {
                                newGrade.grade = 14
                            } else if selectedGrade == "1- / 13P" {
                                newGrade.grade = 13
                            } else if selectedGrade == "2+ / 12P" {
                                newGrade.grade = 12
                            } else if selectedGrade == "2 / 11P" {
                                newGrade.grade = 11
                            } else if selectedGrade == "2- / 10P" {
                                newGrade.grade = 10
                            } else if selectedGrade == "3+ / 9P" {
                                newGrade.grade = 9
                            } else if selectedGrade == "3 / 8P" {
                                newGrade.grade = 8
                            } else if selectedGrade == "3- / 7P" {
                                newGrade.grade = 7
                            } else if selectedGrade == "4+ / 6P" {
                                newGrade.grade = 6
                            } else if selectedGrade == "4 / 5P" {
                                newGrade.grade = 5
                            } else if selectedGrade == "4- / 4P" {
                                newGrade.grade = 4
                            } else if selectedGrade == "5+ / 3P" {
                                newGrade.grade = 3
                            } else if selectedGrade == "5 / 2P" {
                                newGrade.grade = 2
                            } else if selectedGrade == "5- / 1P" {
                                newGrade.grade = 1
                            } else if selectedGrade == "6 / 0P" {
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
                        Text("Add Grade")
                    }
                }
            }
            .navigationTitle("Add Grade")
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct newGradeMittelstufe_Previews: PreviewProvider {
    static var previews: some View {
        newGrade()
    }
}
