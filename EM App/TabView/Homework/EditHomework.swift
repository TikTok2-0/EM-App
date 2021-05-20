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
    
    @State private var week: Bool = false
    @State private var day: Bool = false
    @State private var hours: Bool = false
    
    @State var notificationTitle: String = ""
    
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
                        self.homeworkData.objectWillChange.send()
                        self.homeworkData.title = self.title
                        self.homeworkData.dueDate = self.due
                        self.homeworkData.subject = self.subject
                        self.homeworkData.comment = self.comment
                        
                        self.homeworkData.notifyWeek = self.week
                        self.homeworkData.notifyDay = self.day
                        self.homeworkData.notifyHour = self.hours
                        
                        try? self.viewContext.save()
                        
                        let manager = LocalNotificationManager()
                        if self.week {
                            UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["reminder-\(notificationTitle)-1"])
                            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["reminder-\(notificationTitle)-1"])
                            UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["reminder-\(notificationTitle)-2"])
                            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["reminder-\(notificationTitle)-2"])
                            UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["reminder-\(notificationTitle)-3"])
                            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["reminder-\(notificationTitle)-3"])
                            let messageDate = self.due.addingTimeInterval(-604800)
                            //let messageDate = self.due.addingTimeInterval(-60)
                            let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: messageDate)
                            manager.notifications = [
                                Notification(id: "reminder-\(self.title)-1", title: "Homework Reminder", datetime: dateComponents, body: "\(self.title) in \(self.subject) due next week")
                            ]
                        }
                        if self.day {
                            UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["reminder-\(notificationTitle)-1"])
                            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["reminder-\(notificationTitle)-1"])
                            UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["reminder-\(notificationTitle)-2"])
                            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["reminder-\(notificationTitle)-2"])
                            UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["reminder-\(notificationTitle)-3"])
                            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["reminder-\(notificationTitle)-3"])
                            let messageDate = self.due.addingTimeInterval(-86400)
                            //let messageDate = self.due.addingTimeInterval(-60)
                            let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: messageDate)
                            manager.notifications = [
                                Notification(id: "reminder-\(self.title)-2", title: "Homework Reminder", datetime: dateComponents, body: "\(self.title) in \(self.subject) due tomorrow")
                            ]
                        }
                        if self.hours {
                            UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["reminder-\(notificationTitle)-1"])
                            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["reminder-\(notificationTitle)-1"])
                            UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["reminder-\(notificationTitle)-2"])
                            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["reminder-\(notificationTitle)-2"])
                            UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["reminder-\(notificationTitle)-3"])
                            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["reminder-\(notificationTitle)-3"])
                            let messageDate = self.due.addingTimeInterval(-7200)
                            //let messageDate = self.due.addingTimeInterval(-60)
                            let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: messageDate)
                            manager.notifications = [
                                Notification(id: "reminder-\(self.title)-3", title: "Homework Reminder", datetime: dateComponents, body: "\(self.title) in \(self.subject) due in 2 hours")
                            ]
                        }
                        manager.schedule()

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
            
            self.week = homeworkData.notifyWeek
            self.day = homeworkData.notifyDay
            self.hours = homeworkData.notifyHour
            
            self.notificationTitle = homeworkData.title
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
