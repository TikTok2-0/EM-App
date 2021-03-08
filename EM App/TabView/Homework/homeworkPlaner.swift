//
//  homeworkPlaner.swift
//  EM App
//
//  Created by Henry Krieger on 08.03.21.
//

import SwiftUI

struct homeworkPlaner: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Homework.entity(), sortDescriptors: [])
    var homework: FetchedResults<Homework>
    
    @State private var newHW: Bool = false
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    @State private var maxLines: Int = 1
    
    var body: some View {
        NavigationView {
            List {
                ForEach(homework) { hw in
                    let due = "\(hw.dueDate ?? Date())"
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(hw.title)")
                                .font(.title3)
                                .fontWeight(.bold)
                            Text("\(hw.subject)")
                            Text("\(due)")
                            Text("\(hw.comment)")
                                .lineLimit(maxLines)
                        }
                    }.padding(10)
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        viewContext.delete(homework[index])
                    }
                    do {
                        try viewContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                .onTapGesture {
                    if maxLines == 1 {
                        maxLines = 20
                    } else {
                        maxLines = 1
                    }
                }
            }
            .navigationTitle("Homework Planer")
            .listStyle(InsetGroupedListStyle())
            .navigationBarItems(trailing:
                Button(action: { newHW.toggle() }) {
                    Image(systemName: "plus.circle")
                        .imageScale(.large)
                }
            )
        }.sheet(isPresented: $newHW) {
            newHomework()
        }
    }
}

struct homeworkPlaner_Previews: PreviewProvider {
    static var previews: some View {
        homeworkPlaner()
    }
}
