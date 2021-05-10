//
//  gradeCalcMittelstufe.swift
//  EM App
//
//  Created by Henry Krieger on 12.03.21.
//

import SwiftUI

struct gradeCalcMittelstufe: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Grade.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \Grade.title, ascending: true) ])
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
            output = "1+ / 15P"
            return output
        }
        else if input == 14 {
            output = "1 / 14P"
        }
        else if input == 13 {
            output = "1- / 13P"
        }
        else if input == 12 {
            output = "2+ / 12P"
        }
        else if input == 11 {
            output = "2 / 11P"
        }
        else if input == 10 {
            output = "2- / 10P"
        }
        else if input == 9 {
            output = "3+ / 9P"
        }
        else if input == 8 {
            output = "3 / 8P"
        }
        else if input == 7 {
            output = "3- / 7P"
        }
        else if input == 6 {
            output = "4+ / 6P"
        }
        else if input == 5 {
            output = "4 / 5P"
        }
        else if input == 4 {
            output = "4- / 4P"
        }
        else if input == 3 {
            output = "5+ / 3P"
        }
        else if input == 2 {
            output = "5 / 2P"
        }
        else if input == 1 {
            output = "5- / 1P"
        }
        else if input == 0 {
            output = "6 / 0P"
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
            /*Section(header: Text("6th Class")) {
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
            }*/
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
