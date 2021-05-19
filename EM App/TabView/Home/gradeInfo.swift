//
//  gradeInfo.swift
//  EM App
//
//  Created by Henry Krieger on 06.03.21.
//

import SwiftUI

struct gradeInfo: View {
    var abiFächer = [["1)", "Deutsch"], ["2)", "Englisch"], ["3)", "Mathematik"], ["4)", "Profilgebendes Fach"], ["5)", "Künstlerisches Fach"], ["6)", "Gesellschaftswissenschaftliches Fach"], ["7)", "Naturwissenschaft"], ["8)", "weiteres Prüfungsfach"]]
    var otherInfo = ["If either 5) or 7) is your profile subject, equivalent semester results will be factored into the calculation", "Only 40 semester results can be used for the final grade. Of your courses a maximum of 3 may be practical music courses.", "You cannot decide which of your courses actually factor into your final grade. A bespoke program will automatically calculate your best possible results. The rest of your grades will appear on your final school report in parentheses.", "You can only have five points or less in a maximum of one fifth of your courses. This equals to six of your courses being sub-courses if the minimum of 32 semester results is used in order to calculate your grade.", "You mustn’t have 0 points in any of your courses."]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Which of your grades will be part of the Abitur average?")) {
                    ForEach(abiFächer, id: \.self) { item in
                        HStack {
                            Text("\(item[0])")
                                .fontWeight(.light)
                            Spacer()
                            Text("\(item[1])")
                                .fontWeight(.light)
                        }
                    }
                }
                Section(header: Text("What else do you need to know?")) {
                    ForEach(otherInfo, id: \.self) { item in
                        HStack {
                            Text("\(item)")
                                .fontWeight(.light)
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Information")
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct gradeInfo_Previews: PreviewProvider {
    static var previews: some View {
        gradeInfo()
    }
}
