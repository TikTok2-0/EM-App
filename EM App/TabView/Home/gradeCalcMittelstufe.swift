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
    var gradeFive: FetchedResults<Grade>
    @FetchRequest(entity: GradeSix.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \GradeSix.title, ascending: true) ])
    var gradeSix: FetchedResults<GradeSix>
    @FetchRequest(entity: GradeSeven.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \GradeSeven.title, ascending: true) ])
    var gradeSeven: FetchedResults<GradeSeven>
    @FetchRequest(entity: GradeEight.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \GradeEight.title, ascending: true) ])
    var gradeEight: FetchedResults<GradeEight>
    @FetchRequest(entity: GradeNine.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \GradeNine.title, ascending: true) ])
    var gradeNine: FetchedResults<GradeNine>
    @FetchRequest(entity: GradeTen.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \GradeTen.title, ascending: true) ])
    var gradeTen: FetchedResults<GradeTen>
    @State private var addSubject: Bool = false
    @State private var info: Bool = false
    
    @ObservedObject var userSettings = UserSettings() 
    @State var schnittGes: Double = 0.0
    
    var sum5: Int64 {
        gradeFive.reduce(0) { $0 + $1.grade }
    }
    var sum6: Int64 {
        gradeSix.reduce(0) { $0 + $1.grade }
    }
    var sum7: Int64 {
        gradeSeven.reduce(0) { $0 + $1.grade }
    }
    var sum8: Int64 {
        gradeEight.reduce(0) { $0 + $1.grade }
    }
    var sum9: Int64 {
        gradeNine.reduce(0) { $0 + $1.grade }
    }
    var sum10: Int64 {
        gradeTen.reduce(0) { $0 + $1.grade }
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
    @State var selectedYear: Int = 5
    
    var body: some View {
        List {
            Picker("Year", selection: $selectedYear) {
                Text("5").tag(5)
                Text("6").tag(6)
                Text("7").tag(7)
                Text("8").tag(8)
                Text("9").tag(9)
                Text("10").tag(10)
            }.pickerStyle(SegmentedPickerStyle())
            
            if self.selectedYear == 5 {
                Section(header: Text("5th Grade")) {
                    let average = Double( Double(sum5) / Double(gradeFive.count) )
                    let schnitt = Double( (17 - average) / 3 )
                    HStack {
                        Text("Average")
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(Double(round(100*schnitt)/100), specifier: "%.1f")")
                            .fontWeight(.bold)
                    }
                    ForEach(gradeFive) { item in
                        HStack {
                            Text("\(item.title)")
                            Spacer()
                            let changedGrade = gradeChange(input: Int(item.grade))
                            Text("\(changedGrade)")
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            viewContext.delete(gradeFive[index])
                        }
                        do {
                            try viewContext.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            else if self.selectedYear == 6 {
                Section(header: Text("6th Grade")) {
                    let average = Double( Double(sum6) / Double(gradeSix.count) )
                    let schnitt = Double( (17 - average) / 3 )
                    HStack {
                        Text("Average")
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(Double(round(100*schnitt)/100), specifier: "%.1f")")
                            .fontWeight(.bold)
                    }
                    ForEach(gradeSix) { item in
                        HStack {
                            Text("\(item.title)")
                            Spacer()
                            let changedGrade = gradeChange(input: Int(item.grade))
                            Text("\(changedGrade)")
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            viewContext.delete(gradeSix[index])
                        }
                        do {
                            try viewContext.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            else if self.selectedYear == 7 {
                Section(header: Text("7th Grade")) {
                    let average = Double( Double(sum7) / Double(gradeSeven.count) )
                    let schnitt = Double( (17 - average) / 3 )
                    HStack {
                        Text("Average")
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(Double(round(100*schnitt)/100), specifier: "%.1f")")
                            .fontWeight(.bold)
                    }
                    ForEach(gradeSeven) { item in
                        HStack {
                            Text("\(item.title)")
                            Spacer()
                            let changedGrade = gradeChange(input: Int(item.grade))
                            Text("\(changedGrade)")
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            viewContext.delete(gradeSeven[index])
                        }
                        do {
                            try viewContext.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            else if self.selectedYear == 8 {
                Section(header: Text("8th Grade")) {
                    let average = Double( Double(sum8) / Double(gradeEight.count) )
                    let schnitt = Double( (17 - average) / 3 )
                    HStack {
                        Text("Average")
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(Double(round(100*schnitt)/100), specifier: "%.1f")")
                            .fontWeight(.bold)
                    }
                    ForEach(gradeEight) { item in
                        HStack {
                            Text("\(item.title)")
                            Spacer()
                            let changedGrade = gradeChange(input: Int(item.grade))
                            Text("\(changedGrade)")
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            viewContext.delete(gradeEight[index])
                        }
                        do {
                            try viewContext.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            else if self.selectedYear == 9 {
                Section(header: Text("9th Grade")) {
                    let average = Double( Double(sum9) / Double(gradeNine.count) )
                    let schnitt = Double( (17 - average) / 3 )
                    HStack {
                        Text("Average")
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(Double(round(100*schnitt)/100), specifier: "%.1f")")
                            .fontWeight(.bold)
                    }
                    ForEach(gradeNine) { item in
                        HStack {
                            Text("\(item.title)")
                            Spacer()
                            let changedGrade = gradeChange(input: Int(item.grade))
                            Text("\(changedGrade)")
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            viewContext.delete(gradeNine[index])
                        }
                        do {
                            try viewContext.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            else if self.selectedYear == 10 {
                Section(header: Text("10th Grade")) {
                    let average = Double( Double(sum10) / Double(gradeTen.count) )
                    let schnitt = Double( (17 - average) / 3 )
                    HStack {
                        Text("Average")
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(Double(round(100*schnitt)/100), specifier: "%.1f")")
                            .fontWeight(.bold)
                    }
                    ForEach(gradeTen) { item in
                        HStack {
                            Text("\(item.title)")
                            Spacer()
                            let changedGrade = gradeChange(input: Int(item.grade))
                            Text("\(changedGrade)")
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            viewContext.delete(gradeTen[index])
                        }
                        do {
                            try viewContext.save()
                        } catch {
                            print(error.localizedDescription)
                        }
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
            newGradeMittelstufe(year: selectedYear)
        }
    }
}

struct gradeCalcMittelstufe_Previews: PreviewProvider {
    static var previews: some View {
        gradeCalc()
    }
}
