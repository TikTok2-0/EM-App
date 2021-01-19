//
//  testingArea.swift
//  EM App
//
//  Created by Henry Krieger on 19.01.21.
//

import SwiftUI

struct testingArea: View {
    @EnvironmentObject var truth: SourceOfTruth
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("\(self.truth.count)")
                    .font(.system(size: 150))
                    .frame(height: 200, alignment: .trailing)
                
                Spacer()
                
                Button(action:
                        {self.truth.count = self.truth.count+1})
                {
                    Text("+")
                        .font(.system(size: 50))
                }
                .padding(.bottom, 175)
            }
            .navigationTitle("Testing")
            .toolbar(content: {
                testingAreaTwo()
            })
        }
    }
}

struct testingAreaTwo: View {
    @EnvironmentObject var truth: SourceOfTruth
    
    var body: some View {
        VStack {
            Button(action: {self.truth.count = 0}) {
                Text("Reset")
            }
        }
    }
}

struct testingArea_Previews: PreviewProvider {
    static var previews: some View {
        testingArea()
            .environmentObject(SourceOfTruth())
    }
}
