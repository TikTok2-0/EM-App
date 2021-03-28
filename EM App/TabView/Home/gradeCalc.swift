//
//  gradeCalc.swift
//  EM App
//
//  Created by Henry Krieger on 23.02.21.
//

import SwiftUI

struct gradeCalc: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Subject.entity(), sortDescriptors: [])
    var subject: FetchedResults<Subject>
    @State private var addSubject: Bool = false
    @State private var info: Bool = false
    
    @ObservedObject var userSettings = UserSettings()
    
    var sumS1: Int {
        subject.reduce(0) { $0 + $1.s1 }
    }
    var sumS2: Int {
        subject.reduce(0) { $0 + $1.s2 }
    }
    var sumS3: Int {
        subject.reduce(0) { $0 + $1.s3 }
    }
    var sumS4: Int {
        subject.reduce(0) { $0 + $1.s4 }
    }
    var sumAbi: Int {
        subject.reduce(0) { $0 + $1.abitur }
    }
    
    var body: some View {
        List {
            Section {
                HStack {
                    Text("Semester")
                    Spacer()
                    Text("\(sumS1 + sumS2 + sumS3 + sumS4)")
                }
                HStack {
                    Text("Abitur")
                    Spacer()
                    Text("\(sumAbi*5)")
                }
                HStack {
                    Text("Total")
                        .fontWeight(.bold)
                    Spacer()
                    Text("\(sumS1 + sumS2 + sumS3 + sumS4 + (sumAbi * 5))")
                        .fontWeight(.bold)
                }
                HStack {
                    Text("Average")
                    Spacer()
                    let x = (17 / 3) - Double(sumS1 + sumS2 + sumS3 + sumS4 + (sumAbi * 5)) / 180
                    Text("\( Double(round(1000*x)/1000), specifier: "%.2f")")
                }
            }
            
            Section {
                ForEach(subject) { item in
                    HStack {
                        Text("\(item.title)")
                            .font(.title3)
                            //.fontWeight(.bold)
                        Spacer()
                        Text("\(item.s1)")
                            .frame(width: 25, height: nil, alignment: .center)
                        Text("\(item.s2)")
                            .frame(width: 25, height: nil, alignment: .center)
                        Text("\(item.s3)")
                            .frame(width: 25, height: nil, alignment: .center)
                        Text("\(item.s4)")
                            .frame(width: 25, height: nil, alignment: .center)
                        if item.abiCheck {
                            Text("\(item.abitur)")
                                .frame(width: 25, height: nil, alignment: .center)
                        } else {
                            Text("-")
                                .frame(width: 25, height: nil, alignment: .center)
                        }
                        Ellipse()
                            .frame(width: 10, height: 10, alignment: .center)
                            .foregroundColor(item.eA ? .green : .red)
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        viewContext.delete(subject[index])
                    }
                    do {
                        try viewContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        .navigationTitle("Abi Calc")
        .listStyle(InsetGroupedListStyle())
        .navigationBarItems(
            //leading:
                //EditButton(),
            trailing:
                HStack {
                    Button(action: {
                        info.toggle()
                    }, label: {
                        Image(systemName: "info.circle")
                            .imageScale(.large)
                    }).padding(.trailing, 5)
                    .sheet(isPresented: $info) {
                        gradeInfo()
                    }
                    Button(action: {
                        addSubject.toggle()
                    }, label: {
                        Image(systemName: "plus.circle")
                            .imageScale(.large)
                    })
                    .sheet(isPresented: $addSubject) {
                        newGrade()
                    }
                }
        )
        /*.sheet(isPresented: $addSubject) {
            if addSubject {
                newGrade()
            }
            if info {
                gradeInfo()
            }
        }*/
    }
}

struct gradeCalc_Previews: PreviewProvider {
    static var previews: some View {
        gradeCalc()
    }
}
