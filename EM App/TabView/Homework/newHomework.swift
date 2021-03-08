//
//  newHomework.swift
//  EM App
//
//  Created by Henry Krieger on 08.03.21.
//

import SwiftUI

struct newHomework: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    @ObservedObject var userSettings = UserSettings()
    
    @State private var title: String = ""
    @State private var subject: String = ""
    @State private var due = Date()
    @State private var comment: String = ""
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Title", text: $title)
                    Picker(selection: $subject, label: Text("Subject")) {
                        ForEach(userSettings.subjects, id: \.self) { subject in
                            Text("\(subject)")
                        }
                    }
                    DatePicker("Due Date", selection: $due, displayedComponents: .date)
                }
                Section {
                    TextEditor(text: $comment)
                }
                Section {
                    Button(action: {
                        let newHW = Homework(context: viewContext)
                        newHW.title = self.title
                        newHW.subject = self.subject
                        newHW.dueDate = self.due
                        newHW.comment = self.comment
                    
                        do {
                            try viewContext.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }) {
                        Text("Add Homework")
                    }
                }
            }.navigationTitle("Add Homework")
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct newHomework_Previews: PreviewProvider {
    static var previews: some View {
        newHomework()
    }
}
