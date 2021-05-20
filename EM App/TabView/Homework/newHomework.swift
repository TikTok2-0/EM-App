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
    
    @State private var week: Bool = false
    @State private var day: Bool = false
    @State private var hours: Bool = false
    
    var body: some View {
        NavigationView {
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
                Section(header: Text("Notifications")) {
                    let weekOn = Binding<Bool>(get: { self.week }, set: { self.week = $0; self.day = false; self.hours = false })
                    let dayOn = Binding<Bool>(get: { self.day }, set: { self.week = false; self.day = $0; self.hours = false })
                    let hoursOn = Binding<Bool>(get: { self.hours }, set: { self.week = false; self.day = false; self.hours = $0 })
                    
                    Toggle(isOn: weekOn) {
                        Text("1 week before")
                    }
                    Toggle(isOn: dayOn) {
                        Text("1 day before")
                    }
                    Toggle(isOn: hoursOn) {
                        Text("2 hours before")
                    }
                }
                Section {
                    Button(action: {
                        let newHW = Homework(context: viewContext)
                        newHW.title = self.title
                        newHW.subject = self.subject
                        newHW.dueDate = self.due
                        newHW.comment = self.comment
                        
                        newHW.notifyWeek = self.week
                        newHW.notifyDay = self.day
                        newHW.notifyHour = self.hours
                    
                        do {
                            try viewContext.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        let manager = LocalNotificationManager()
                        if self.week {
                            let messageDate = self.due.addingTimeInterval(-604800)
                            //let messageDate = self.due.addingTimeInterval(-60)
                            let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: messageDate)
                            manager.notifications = [
                                Notification(id: "reminder-\(self.title)-1", title: "Homework Reminder", datetime: dateComponents, body: "\(self.title) in \(self.subject) due next week")
                            ]
                        }
                        if self.day {
                            let messageDate = self.due.addingTimeInterval(-86400)
                            //let messageDate = self.due.addingTimeInterval(-60)
                            let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: messageDate)
                            manager.notifications = [
                                Notification(id: "reminder-\(self.title)-2", title: "Homework Reminder", datetime: dateComponents, body: "\(self.title) in \(self.subject) due tomorrow")
                            ]
                        }
                        if self.hours {
                            let messageDate = self.due.addingTimeInterval(-7200)
                            //let messageDate = self.due.addingTimeInterval(-60)
                            let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: messageDate)
                            manager.notifications = [
                                Notification(id: "reminder-\(self.title)-3", title: "Homework Reminder", datetime: dateComponents, body: "\(self.title) in \(self.subject) due in 2 hours")
                            ]
                        }
                        manager.schedule()
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
