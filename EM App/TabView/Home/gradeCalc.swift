//
//  gradeCalc.swift
//  EM App
//
//  Created by Henry Krieger on 23.02.21.
//

import SwiftUI

struct gradeCalc: View {
    @State private var addSubject: Bool = false
    
    var body: some View {
        List {
            ForEach(1..<51, id: \.self) { item in
                Text("Item \(item)")
            }
        }
        .navigationTitle("Grades")
        .listStyle(InsetGroupedListStyle())
        .navigationBarItems(trailing:
            HStack {
                Button(action: {
                    addSubject.toggle()
                }, label: {
                    Image(systemName: "plus.circle")
                        .imageScale(.large)
                })
            }
        )
        .sheet(isPresented: $addSubject) {
            Text("soon")
        }
    }
}

struct gradeCalc_Previews: PreviewProvider {
    static var previews: some View {
        gradeCalc()
    }
}
