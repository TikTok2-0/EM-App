//
//  gradeCalcMittelstufe.swift
//  EM App
//
//  Created by Henry Krieger on 12.03.21.
//

import SwiftUI

struct gradeCalcMittelstufe: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Grade.entity(), sortDescriptors: [])
    var grade: FetchedResults<Grade>
    @State private var addSubject: Bool = false
    @State private var info: Bool = false
    
    @ObservedObject var userSettings = UserSettings() 
    @State var schnittGes: Double = 0.0
    
    var sum5: Int64 {
        grade.reduce(0) { $0 + $1.grade }
    }
    var sum6: Int64 {
        grade.reduce(0) { $0 + $1.grade }
    }
    var sum7: Int64 {
        grade.reduce(0) { $0 + $1.grade }
    }
    var sum8: Int64 {
        grade.reduce(0) { $0 + $1.grade }
    }
    var sum9: Int64 {
        grade.reduce(0) { $0 + $1.grade }
    }
    var sum10: Int64 {
        grade.reduce(0) { $0 + $1.grade }
    }
    
    func gradeChange(input: Int) -> String {
        var output: String = ""
        if input == 15 {
            output = "1+ / 15"
            return output
        }
        else if input == 14 {
            output = "1 / 14"
        }
        else if input == 13 {
            output = "1- / 13"
        }
        else if input == 12 {
            output = "2+ / 12"
        }
        else if input == 11 {
            output = "1 / 11"
        }
        else if input == 10 {
            output = "2- / 10"
        }
        else if input == 13 {
            output = "3+ / 9"
        }
        else if input == 13 {
            output = "1 / 8"
        }
        else if input == 13 {
            output = "3- / 7"
        }
        else if input == 13 {
            output = "4+ / 6"
        }
        else if input == 13 {
            output = "4 / 5"
        }
        else if input == 13 {
            output = "4- / 4"
        }
        else if input == 13 {
            output = "5+ / 3"
        }
        else if input == 13 {
            output = "5 / 2"
        }
        else if input == 13 {
            output = "5- / 1"
        }
        else if input == 13 {
            output = "6 / 0"
        }
        return output
    }
    
    var body: some View {
        List {
            Section(header: Text("5th Class")) {
                HStack {
                    Text("5th Grade Average")
                        .fontWeight(.bold)
                    Spacer()
                    Text("\(sum5)")
                        .fontWeight(.bold)
                }
                ForEach(grade) { item in
                    if item.year == 5 {
                        HStack {
                            Text("\(item.title)")
                            Spacer()
                            let changedGrade = gradeChange(input: Int(item.grade))
                            Text("\(changedGrade)")
                        }
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        viewContext.delete(grade[index])
                    }
                    do {
                        try viewContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            Section(header: Text("6th Class")) {
                HStack {
                    Text("6th Grade Average")
                        .fontWeight(.bold)
                    Spacer()
                    Text("\(sum6)")
                        .fontWeight(.bold)
                }
                ForEach(grade) { item in
                    if item.year == 6 {
                        HStack {
                            Text("\(item.title)")
                            Spacer()
                            let changedGrade = gradeChange(input: Int(item.grade))
                            Text("\(changedGrade)")
                        }
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        viewContext.delete(grade[index])
                    }
                    do {
                        try viewContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            Section(header: Text("7th Class")) {
                HStack {
                    Text("7th Grade Average")
                        .fontWeight(.bold)
                    Spacer()
                    Text("\(sum7)")
                        .fontWeight(.bold)
                }
                ForEach(grade) { item in
                    if item.year == 7 {
                        HStack {
                            Text("\(item.title)")
                            Spacer()
                            let changedGrade = gradeChange(input: Int(item.grade))
                            Text("\(changedGrade)")
                        }
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        viewContext.delete(grade[index])
                    }
                    do {
                        try viewContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            Section(header: Text("8th Class")) {
                HStack {
                    Text("8th Grade Average")
                        .fontWeight(.bold)
                    Spacer()
                    Text("\(sum8)")
                        .fontWeight(.bold)
                }
                ForEach(grade) { item in
                    if item.year == 8 {
                        HStack {
                            Text("\(item.title)")
                            Spacer()
                            let changedGrade = gradeChange(input: Int(item.grade))
                            Text("\(changedGrade)")
                        }
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        viewContext.delete(grade[index])
                    }
                    do {
                        try viewContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            Section(header: Text("9th Class")) {
                HStack {
                    Text("9th Grade Average")
                        .fontWeight(.bold)
                    Spacer()
                    Text("\(sum9)")
                        .fontWeight(.bold)
                }
                ForEach(grade) { item in
                    if item.year == 9 {
                        HStack {
                            Text("\(item.title)")
                            Spacer()
                            let changedGrade = gradeChange(input: Int(item.grade))
                            Text("\(changedGrade)")
                        }
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        viewContext.delete(grade[index])
                    }
                    do {
                        try viewContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            Section(header: Text("10th Class")) {
                HStack {
                    Text("10th Grade Average")
                        .fontWeight(.bold)
                    Spacer()
                    Text("\(sum10)")
                        .fontWeight(.bold)
                }
                ForEach(grade) { item in
                    if item.year == 10 {
                        HStack {
                            Text("\(item.title)")
                            Spacer()
                            let changedGrade = gradeChange(input: Int(item.grade))
                            Text("\(changedGrade)")
                        }
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        viewContext.delete(grade[index])
                    }
                    do {
                        try viewContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        .navigationTitle("Grades")
        .listStyle(InsetGroupedListStyle())
        .navigationBarItems(trailing:
            Button(action: {
                addSubject.toggle()
            }, label: {
                Image(systemName: "plus.circle")
                    .imageScale(.large)
            })
        )
        .sheet(isPresented: $addSubject) {
            newGradeMittelstufe()
        }
    }
}

struct gradeCalcMittelstufe_Previews: PreviewProvider {
    static var previews: some View {
        gradeCalc()
    }
}
