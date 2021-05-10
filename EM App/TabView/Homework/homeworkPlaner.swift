//
//  homeworkPlaner.swift
//  EM App
//
//  Created by Henry Krieger on 08.03.21.
//

import SwiftUI

struct homeworkPlaner: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Homework.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Homework.dueDate, ascending: true),
        NSSortDescriptor(keyPath: \Homework.subject, ascending: true)
    ])
    var homework: FetchedResults<Homework>
    
    @State var editHomework = false
    
    let createHW: [Any] = ["", "", Date(), ""]
    @State private var newHW: Bool = false
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }()
    
    @State private var maxLines: Int = 1
    
    var body: some View {
        NavigationView {
            List {
                ForEach(homework) { hw in
                    NavigationLink(destination: EditHomework(homeworkData: hw)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(hw.title)")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                Text("\(hw.subject)")
                                Text("\(hw.dueDate, formatter: Self.taskDateFormat)")
                                if hw.comment != "" {
                                    Text("\(hw.comment)")
                                        //.lineLimit(maxLines)
                                }
                                /*Button(action: { editHomework.toggle() }) {
                                    Label("Edit", systemImage: "pencil")
                                }.sheet(isPresented: $editHomework) {
                                    Text("soon")
                                    //updateHomework(homework: hw)
                                }*/
                            }
                        }.padding(10)
                    }
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
                /*.onTapGesture {
                    if maxLines == 1 {
                        maxLines = 20
                    } else {
                        maxLines = 1
                    }
                }*/
            }
            .navigationTitle("Homework Planer")
            .listStyle(InsetGroupedListStyle())
            .navigationBarItems(
                leading:
                    EditButton(),
                trailing:
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

/*struct updateHomework: View {
    var homework: Homework
    //@State var newTitle = homework.title == "2"
    //@State var newDueDate = homework.dueDate
    //@State var newComment = homework.comment
    //@State var newSubject = homework.subject
    
    var body: some View {
        //@State var newTitle = homework.title
        @State var newTitle = "New Title"
        
        TextField("", text: $newTitle)
        Text("test text")
    }
}*/

struct homeworkPlaner_Previews: PreviewProvider {
    static var previews: some View {
        homeworkPlaner()
    }
}
