//
//  homeworkPlanerPad.swift
//  EM App
//
//  Created by Henry Krieger on 13.06.21.
//

import SwiftUI
import UserNotifications

struct ItemListViewPad: View {
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }()

    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.managedObjectContext) private var managedObjectContext
    @FetchRequest var items: FetchedResults<Homework>
    
    init(sortMethod: homeworkPlanerPad.SortMethod) {
        let sortDescriptor: NSSortDescriptor
        switch sortMethod {
        case .byName:
            sortDescriptor = NSSortDescriptor(keyPath: \Homework.subject, ascending: true)
        case .byDateAdded:
            sortDescriptor = NSSortDescriptor(keyPath: \Homework.dueDate, ascending: true)
        }
        _items = .init(
            entity: Homework.entity(),
            sortDescriptors: [sortDescriptor],
            predicate: nil,
            animation: .default
        )
    }
    
    var body: some View {
        List {
            /*Button(action: {
                let manager = LocalNotificationManager()
                manager.listScheduledNotifications()
            }) {
                Text("All notifications")
            }*/
            ForEach(items) { hw in
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
                            }
                        }
                    }.padding(10)
                }
            }
            .onDelete { indexSet in
                for index in indexSet {
                    viewContext.delete(items[index])
                    UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["reminder-\(items[index].title)-1"])
                    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["reminder-\(items[index].title)-1"])
                    UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["reminder-\(items[index].title)-2"])
                    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["reminder-\(items[index].title)-2"])
                    UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["reminder-\(items[index].title)-3"])
                    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["reminder-\(items[index].title)-3"])
                }
                do {
                    try viewContext.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct homeworkPlanerPad: View {
    enum SortMethod: String, CaseIterable, Identifiable {
        var id: Self { self }
        
        case byName = "Name"
        case byDateAdded = "Date Added"
    }
    @State private var currentSortMethod = SortMethod.byDateAdded
    
    @State private var newHW: Bool = false
    
    var body: some View {
        ItemListViewPad(sortMethod: currentSortMethod)
            .navigationTitle("Homework")
            .navigationBarItems(trailing:
                HStack {
                    Menu {
                        Section {
                            Button(action: { currentSortMethod = .byDateAdded }) {
                                Label("Date", systemImage: "calendar")
                            }
                            Button(action: { currentSortMethod = .byName }) {
                                Label("Subject", systemImage: "textformat")
                            }
                        }
                    }
                    label: {
                        Image(systemName: "slider.horizontal.3")
                            .imageScale(.large)
                    }.padding(.trailing, 5)
                    
                    Button(action: { newHW.toggle() }) {
                        Image(systemName: "plus.circle")
                            .imageScale(.large)
                    }
                }
            )
        .sheet(isPresented: $newHW) {
            newHomework()
        }
    }
}

struct homeworkPlanerPad_Previews: PreviewProvider {
    static var previews: some View {
        homeworkPlanerPad()
    }
}
