//
//  roadmap.swift
//  EM App
//
//  Created by Henry Krieger on 11.02.21.
//

import SwiftUI

struct roadmap: View {
    var body: some View {
        List {
            HStack {
                Text("News (HLG)")
                Spacer()
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .frame(width: 150, height: nil, alignment: .center)
                        .foregroundColor(.green)
                    Text("Feb 2021")
                }
            }
            HStack {
                Text("News (KaiFU)")
                Spacer()
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .frame(width: 150, height: nil, alignment: .center)
                        .foregroundColor(.green)
                    Text("Feb 2021")
                }
            }
            HStack {
                Text("Hot Story")
                Spacer()
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .frame(width: 150, height: nil, alignment: .center)
                        .foregroundColor(.green)
                    Text("Feb 2021")
                }
            }
            HStack {
                Text("Settings")
                Spacer()
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .frame(width: 150, height: nil, alignment: .center)
                        .foregroundColor(.yellow)
                    Text("Feb 2021")
                }
            }
            HStack {
                Text("Homepage Menu")
                Spacer()
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .frame(width: 150, height: nil, alignment: .center)
                        .foregroundColor(.yellow)
                    Text("Mar 2021")
                }
            }
            HStack {
                Text("News Filter")
                Spacer()
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .frame(width: 150, height: nil, alignment: .center)
                        .foregroundColor(.green)
                    Text("Mar 2021")
                }
            }
            HStack {
                Text("Untis")
                Spacer()
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .frame(width: 150, height: nil, alignment: .center)
                        .foregroundColor(.red)
                    Text("Mar 2021")
                }
            }
            HStack {
                Text("Grade Calc")
                Spacer()
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .frame(width: 150, height: nil, alignment: .center)
                        .foregroundColor(.red)
                    Text("Apr 2021")
                }
            }
        }
        .navigationTitle("Roadmap")
        .listStyle(InsetGroupedListStyle())
    }
}

struct roadmap_Previews: PreviewProvider {
    static var previews: some View {
        roadmap()
    }
}
