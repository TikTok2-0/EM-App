//
//  untisList.swift
//  EM App
//
//  Created by Henry Krieger on 09.02.21.
//

import SwiftUI

struct untisList: View {
    @State public var week = [
        [
            ["Deutsch", "R208", "Kal", "red", "square.and.pencil", "checkmark", "green"],
            ["Physik", "R306", "Do", "gray", "infinity", "checkmark", "green"],
            ["Theater", "R201", "Pon", "orange", "mustache", "xmark", "red"],
            ["Geschichte", "R210", "Mc", "green", "clock.arrow.2.circlepath", "circle", "yellow"]
        ],
        [
            ["Wirtschaft", "R205", "Kel", "", "banknote", "checkmark", "green"],
            ["Physik", "R306", "Do", "gray", "infinity", "checkmark", "green"],
            ["Seminar", "R306", "Do", "", "mustache", "xmark", "red"],
            ["Informatik", "R104", "Ko", "", "keyboard", "circle", "yellow"]
        ],
        [
            ["Informatik", "R104", "Ko", "", "keyboard", "checkmark", "green"],
            ["Mathematik", "R205", "Mei", "blue", "function", "circle", "yellow"],
            ["Religion", "R111", "Red", "pink", "mustache", "xmark", "red"]
        ],
        [
            ["Englisch", "R303", "vB", "yellow", "pencil.circle", "checkmark", "green"],
            ["Deutsch", "R208", "Kal", "red", "square.and.pencil", "checkmark", "green"],
            ["Geschichte", "R210", "Mc", "green", "clock.arrow.2.circlepath", "xmark", "red"]
        ],
        [
            ["Mathematik", "R205", "Mei", "blue", "function", "checkmark", "green"],
            ["Englisch", "R109", "vB", "yellow", "infinity", "checkmark", "green"],
            ["Sport", "HLG Halle", "Lf", "", "sportscourt", "xmark", "red"]
        ]
    ]
    
    var body: some View {
        TabView {
            VStack {
                Text("Monday")
                    .font(.largeTitle)
                ForEach(week[0], id: \.self) { item in
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color(.gray)).opacity(0.2)
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color(item[3]))
                                        .aspectRatio(1, contentMode: .fit)
                                    Image(systemName: "\(item[4])")
                                        .font(.largeTitle)
                                        .foregroundColor(.black).opacity(0.7)
                                }
                                VStack(alignment: .leading) {
                                    Spacer()
                                    Text("\(item[0])")
                                    Spacer()
                                    Text("\(item[1])")
                                    Spacer()
                                    Text("\(item[2])")
                                    Spacer()
                                }.padding(.horizontal, 10)
                                Spacer()
                                ZStack {
                                    Ellipse()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .foregroundColor(Color(.black)).opacity(0.5)
                                    Image(systemName: "\(item[5])")
                                        .foregroundColor(Color("\(item[6])"))
                                        .font(.title)
                                }
                            }.padding(5)
                        }.frame(width: nil, height: 100, alignment: .center)
                    }.padding(.horizontal, 10)
                }
            }//.padding()
            VStack {
                Text("Tuesday")
                    .font(.largeTitle)
                ForEach(week[1], id: \.self) { item in
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color(.gray)).opacity(0.2)
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color(item[3]))
                                        .aspectRatio(1, contentMode: .fit)
                                    Image(systemName: "\(item[4])")
                                        .font(.largeTitle)
                                        .foregroundColor(.black).opacity(0.7)
                                }
                                VStack(alignment: .leading) {
                                    Spacer()
                                    Text("\(item[0])")
                                    Spacer()
                                    Text("\(item[1])")
                                    Spacer()
                                    Text("\(item[2])")
                                    Spacer()
                                }.padding(.horizontal, 10)
                                Spacer()
                                ZStack {
                                    Ellipse()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .foregroundColor(Color(.black)).opacity(0.5)
                                    Image(systemName: "\(item[5])")
                                        .foregroundColor(Color("\(item[6])"))
                                        .font(.title)
                                }
                            }.padding(5)
                        }.frame(width: nil, height: 100, alignment: .center)
                    }.padding(.horizontal, 10)
                }
            }//.padding()
            VStack {
                Text("Wednesday")
                    .font(.largeTitle)
                ForEach(week[2], id: \.self) { item in
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color(.gray)).opacity(0.2)
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color(item[3]))
                                        .aspectRatio(1, contentMode: .fit)
                                    Image(systemName: "\(item[4])")
                                        .font(.largeTitle)
                                        .foregroundColor(.black).opacity(0.7)
                                }
                                VStack(alignment: .leading) {
                                    Spacer()
                                    Text("\(item[0])")
                                    Spacer()
                                    Text("\(item[1])")
                                    Spacer()
                                    Text("\(item[2])")
                                    Spacer()
                                }.padding(.horizontal, 10)
                                Spacer()
                                ZStack {
                                    Ellipse()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .foregroundColor(Color(.black)).opacity(0.5)
                                    Image(systemName: "\(item[5])")
                                        .foregroundColor(Color("\(item[6])"))
                                        .font(.title)
                                }
                            }.padding(5)
                        }.frame(width: nil, height: 100, alignment: .center)
                    }.padding(.horizontal, 10)
                }
            }//.padding()
            VStack {
                Text("Thursday")
                    .font(.largeTitle)
                ForEach(week[3], id: \.self) { item in
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color(.gray)).opacity(0.2)
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color(item[3]))
                                        .aspectRatio(1, contentMode: .fit)
                                    Image(systemName: "\(item[4])")
                                        .font(.largeTitle)
                                        .foregroundColor(.black).opacity(0.7)
                                }
                                VStack(alignment: .leading) {
                                    Spacer()
                                    Text("\(item[0])")
                                    Spacer()
                                    Text("\(item[1])")
                                    Spacer()
                                    Text("\(item[2])")
                                    Spacer()
                                }.padding(.horizontal, 10)
                                Spacer()
                                ZStack {
                                    Ellipse()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .foregroundColor(Color(.black)).opacity(0.5)
                                    Image(systemName: "\(item[5])")
                                        .foregroundColor(Color("\(item[6])"))
                                        .font(.title)
                                }
                            }.padding(5)
                        }.frame(width: nil, height: 100, alignment: .center)
                    }.padding(.horizontal, 10)
                }
            }//.padding()
            VStack {
                Text("Friday")
                    .font(.largeTitle)
                ForEach(week[4], id: \.self) { item in
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color(.gray)).opacity(0.2)
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color(item[3]))
                                        .aspectRatio(1, contentMode: .fit)
                                    Image(systemName: "\(item[4])")
                                        .font(.largeTitle)
                                        .foregroundColor(.black).opacity(0.7)
                                }
                                VStack(alignment: .leading) {
                                    Spacer()
                                    Text("\(item[0])")
                                    Spacer()
                                    Text("\(item[1])")
                                    Spacer()
                                    Text("\(item[2])")
                                    Spacer()
                                }.padding(.horizontal, 10)
                                Spacer()
                                ZStack {
                                    Ellipse()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .foregroundColor(Color(.black)).opacity(0.5)
                                    Image(systemName: "\(item[5])")
                                        .foregroundColor(Color("\(item[6])"))
                                        .font(.title)
                                }
                            }.padding(5)
                        }.frame(width: nil, height: 100, alignment: .center)
                    }.padding(.horizontal, 10)
                }
            }//.padding()
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct untisList_Previews: PreviewProvider {
    static var previews: some View {
        untisList()
    }
}
