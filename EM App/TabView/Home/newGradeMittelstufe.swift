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
    @State var year: Int
    @State var selectedGrade = ""
    @State var grade = ["1+ / 15P", "1 / 14P", "1- / 13P", "2+ / 12P", "2 / 11P", "2- / 10P", "3+ / 9P", "3 / 8P", "3- / 7P", "4+ / 6P", "4 / 5P", "4- / 4P", "5+ / 3P", "5 / 2P", "5- / 1P", "6 / 0P"]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Subject Details")) {
                    TextField("Title", text: $title)
                    //Stepper("\(year). Klasse", value: $year, in: 5...10)
                }
                Section(header: Text("Class")) {
                    Picker("Class", selection: $year) {
                        Text("5").tag(5)
                        Text("6").tag(6)
                        Text("7").tag(7)
                        Text("8").tag(8)
                        Text("9").tag(9)
                        Text("10").tag(10)
                    }.pickerStyle(SegmentedPickerStyle())
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
                        if self.year == 5 {
                            let newGrade = Grade(context: viewContext)
                            newGrade.title = self.title
                            newGrade.grade = Int64(gradeChange(input: self.selectedGrade))
                        } else if self.year == 6 {
                            let newGrade = GradeSix(context: viewContext)
                            newGrade.title = self.title
                            newGrade.grade = Int64(gradeChange(input: self.selectedGrade))
                        } else if self.year == 7 {
                            let newGrade = GradeSeven(context: viewContext)
                            newGrade.title = self.title
                            newGrade.grade = Int64(gradeChange(input: self.selectedGrade))
                        } else if self.year == 8 {
                            let newGrade = GradeEight(context: viewContext)
                            newGrade.title = self.title
                            newGrade.grade = Int64(gradeChange(input: self.selectedGrade))
                        } else if self.year == 9 {
                            let newGrade = GradeNine(context: viewContext)
                            newGrade.title = self.title
                            newGrade.grade = Int64(gradeChange(input: self.selectedGrade))
                        } else if self.year == 10 {
                            let newGrade = GradeTen(context: viewContext)
                            newGrade.title = self.title
                            newGrade.grade = Int64(gradeChange(input: self.selectedGrade))
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

func gradeChange(input: String) -> Int {
    var output: Int = 0
    if input == "1+ / 15P" {
        output = 15
    } else if input == "1 / 14P" {
        output = 14
    } else if input == "1- / 13P" {
        output = 13
    } else if input == "2+ / 12P" {
        output = 12
    } else if input == "2 / 11P" {
        output = 11
    } else if input == "2- / 10P" {
        output = 10
    } else if input == "3+ / 9P" {
        output = 9
    } else if input == "3 / 8P" {
        output = 8
    } else if input == "3- / 7P" {
        output = 7
    } else if input == "4+ / 6P" {
        output = 6
    } else if input == "4 / 5P" {
        output = 5
    } else if input == "4- / 4P" {
        output = 4
    } else if input == "5+ / 3P" {
        output = 3
    } else if input == "5 / 2P" {
        output = 2
    } else if input == "5- / 1P" {
        output = 1
    } else if input == "6 / 0P" {
        output = 0
    }
    return output
}

struct newGradeMittelstufe_Previews: PreviewProvider {
    static var previews: some View {
        newGrade()
    }
}
