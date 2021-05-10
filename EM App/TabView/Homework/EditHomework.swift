//
//  EditHomework.swift
//  EM App
//
//  Created by Henry Krieger on 10.05.21.
//

import SwiftUI

struct EditHomework: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    @ObservedObject var userSettings = UserSettings()
    
    @ObservedObject var homeworkData: FetchedResults<Homework>.Element
    
    @State private var title: String = ""
    @State private var subject: String = ""
    @State private var due = Date()
    @State private var comment: String = ""
    
    var body: some View {
        //NavigationView {
            List {
                Section(header: Text("General Information")) {
                    TextField("Title", text: $title)
                    Picker(selection: $subject, label: Text("Subject")) {
                        ForEach(userSettings.subjects, id: \.self) { subject in
                            Text("\(subject)")
                        }
                    }
                    DatePicker("Due Date", selection: $due)//, displayedComponents: .date)
                }
                Section(header: Text("Comment")) {
                    TextEditor(text: $comment)
                }
                Section {
                    Button(action: {
                        self.homeworkData.objectWillChange.send()
                        self.homeworkData.title = self.title
                        self.homeworkData.dueDate = self.due
                        self.homeworkData.subject = self.subject
                        self.homeworkData.comment = self.comment
                        try? self.viewContext.save()

                        // better do this at the end of activity
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Save Homework")
                    }
                }
            }.navigationTitle("Edit Homework")
            .listStyle(InsetGroupedListStyle())
        //}
        .onAppear {
            self.title = homeworkData.title
            self.due = homeworkData.dueDate
            self.subject = homeworkData.subject
            self.comment = homeworkData.comment
        }
    }
}

/*
struct EditHomework_Previews: PreviewProvider {
    static var previews: some View {
        EditHomework()
    }
}
*/
