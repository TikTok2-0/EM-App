//
//  gradeInfo.swift
//  EM App
//
//  Created by Henry Krieger on 06.03.21.
//

import SwiftUI

struct gradeInfo: View {
    var abiFächer = [["1)", "Deutsch"], ["2)", "Englisch"], ["3)", "Mathematik"], ["4)", "Profilgebendes Fach"], ["5)", "Künstlerisches Fach"], ["6)", "Gesellschaftswissenschaftliches Fach"], ["7)", "Naturwissenschaft"], ["8)", "weiteres Prüfungsfach"]]
    var otherInfo = ["Wenn 5) oder 7) das profilgebende Fach ist, werden entsprechende Semesterergebnisse eingebracht.", "Es können maximal 40 Semesterergebnisse eingebracht werden (einschließlich Seminar), aber maximal 3 musikpraktische Kurse.", "Was letztendlich wirklich eingebracht wird, entscheidet das Programm der Oberstufe, da dieses die bestmögliche Note ermittelt; die restlichen Ergebnisse werden eingeklammert gedruckt", "Maximal 1/5 aller eingebrachten Ergebnisse darf unter 5P liegen => maximal 6 Unterkurse wenn das Minimum von 32 Semesterergebnissen eingebracht wird", "Keine Note darf 0 Punkte betragen!"]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Welche Noten werden in den Abiturschnitt eingerechnet?")) {
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
                Section(header: Text("Was gilt es sonst noch zu beachten?")) {
                    ForEach(otherInfo, id: \.self) { item in
                        HStack {
                            Text("\(item)")
                                .fontWeight(.light)
                            Spacer()
                        }
                    }
                }
            }.padding()
            .navigationTitle("Informationen")
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct gradeInfo_Previews: PreviewProvider {
    static var previews: some View {
        gradeInfo()
    }
}
