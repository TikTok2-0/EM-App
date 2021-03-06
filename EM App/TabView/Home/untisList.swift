//
//  untisList.swift
//  EM App
//
//  Created by Henry Krieger on 09.02.21.
//

import SwiftUI

struct untisList: View {
    var body: some View {
        TabView {
            monday()
            tuesday()
            wednesday()
            thursday()
            friday()
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct monday: View {
    var monday = [
        ["Deutsch", "R208", "Kal", "red", "square.and.pencil", "checkmark"],
        ["Physik", "R306", "Do", "gray", "infinity", "checkmark"],
        ["Theater", "R201", "Pon", "orange", "mustache", "xmark"],
        ["Geschichte", "R210", "Mc", "green", "clock.arrow.2.circlepath", "circle"]
    ]
    var body: some View {
        //NavigationView {
            VStack {
                Text("Monday")
                    .font(.largeTitle)
                ForEach(monday, id: \.self) { item in
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color(.gray)).opacity(0.2)
                            .shadow(color: Color("superiorBlack"), radius: 10, x: 1, y: 3)
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color(item[3]))
                                Image(systemName: item[4])
                                    .font(.largeTitle)
                            }.aspectRatio(1, contentMode: .fit)
                            VStack(alignment: .leading) {
                                Spacer()
                                Text(item[0])
                                Spacer()
                                Text(item[1])
                                Spacer()
                                Text(item[2])
                                Spacer()
                            }.padding(.leading, 10)
                            Spacer()
                            ZStack {
                                Ellipse()
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .foregroundColor(Color(.systemBackground))
                                    .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                                Image(systemName: item[5])
                            }
                        }.padding()
                    }.frame(width: nil, height: 100, alignment: .center)
                    .padding()
                }
            }.padding()
            //.navigationTitle("08.03.2021")
        //}
    }
}

struct tuesday: View {
    var tuesday = [
        ["Wirtschaft", "R205", "Kel", "", "banknote", "checkmark"],
        ["Physik", "R306", "Do", "gray", "infinity", "checkmark"],
        ["Seminar", "R306", "Do", "", "mustache", "xmark"],
        ["Informatik", "R104", "Ko", "", "keyboard", "circle"]
    ]
    var body: some View {
        //NavigationView {
            VStack {
                Text("Tuesday")
                    .font(.largeTitle)
                ForEach(tuesday, id: \.self) { item in
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color(.gray)).opacity(0.2)
                            .shadow(color: Color("superiorBlack"), radius: 10, x: 1, y: 3)
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color(item[3]))
                                Image(systemName: item[4])
                                    .font(.largeTitle)
                            }.aspectRatio(1, contentMode: .fit)
                            VStack(alignment: .leading) {
                                Spacer()
                                Text(item[0])
                                Spacer()
                                Text(item[1])
                                Spacer()
                                Text(item[2])
                                Spacer()
                            }.padding(.leading, 10)
                            Spacer()
                            ZStack {
                                Ellipse()
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .foregroundColor(Color(.systemBackground))
                                    .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                                Image(systemName: item[5])
                            }
                        }.padding()
                    }.frame(width: nil, height: 100, alignment: .center)
                    .padding()
                }
            }.padding()
            //.navigationTitle("09.03.2021")
        //}
    }
}

struct wednesday: View {
    var wednesday = [
        ["Informatik", "R104", "Ko", "", "keyboard", "checkmark"],
        ["Mathematik", "R205", "Mei", "blue", "function", "circle"],
        ["Religion", "R111", "Red", "pink", "mustache", "xmark"]
    ]
    var body: some View {
        //NavigationView {
            VStack {
                Text("Wednesday")
                    .font(.largeTitle)
                ForEach(wednesday, id: \.self) { item in
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color(.gray)).opacity(0.2)
                            .shadow(color: Color("superiorBlack"), radius: 10, x: 1, y: 3)
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color(item[3]))
                                Image(systemName: item[4])
                                    .font(.largeTitle)
                            }.aspectRatio(1, contentMode: .fit)
                            VStack(alignment: .leading) {
                                Spacer()
                                Text(item[0])
                                Spacer()
                                Text(item[1])
                                Spacer()
                                Text(item[2])
                                Spacer()
                            }.padding(.leading, 10)
                            Spacer()
                            ZStack {
                                Ellipse()
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .foregroundColor(Color(.systemBackground))
                                    .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                                Image(systemName: item[5])
                            }
                        }.padding()
                    }.frame(width: nil, height: 100, alignment: .center)
                    .padding()
                }
            }.padding()
            //.navigationTitle("09.03.2021")
        //}
    }
}

struct thursday: View {
    var thursday = [
        ["Englisch", "R303", "vB", "yellow", "banknote", "checkmark"],
        ["Deutsch", "R208", "Kal", "red", "square.and.pencil", "checkmark"],
        ["Geschichte", "R210", "Mc", "green", "clock.arrow.2.circlepath", "xmark"]
    ]
    var body: some View {
        //NavigationView {
            VStack {
                Text("Thursday")
                    .font(.largeTitle)
                ForEach(thursday, id: \.self) { item in
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color(.gray)).opacity(0.2)
                            .shadow(color: Color("superiorBlack"), radius: 10, x: 1, y: 3)
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color(item[3]))
                                Image(systemName: item[4])
                                    .font(.largeTitle)
                            }.aspectRatio(1, contentMode: .fit)
                            VStack(alignment: .leading) {
                                Spacer()
                                Text(item[0])
                                Spacer()
                                Text(item[1])
                                Spacer()
                                Text(item[2])
                                Spacer()
                            }.padding(.leading, 10)
                            Spacer()
                            ZStack {
                                Ellipse()
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .foregroundColor(Color(.systemBackground))
                                    .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                                Image(systemName: item[5])
                            }
                        }.padding()
                    }.frame(width: nil, height: 100, alignment: .center)
                    .padding()
                }
            }.padding()
            //.navigationTitle("09.03.2021")
        //}
    }
}

struct friday: View {
    var friday = [
        ["Mathematik", "R205", "Mei", "blue", "function", "checkmark"],
        ["Englisch", "R109", "vB", "yellow", "infinity", "checkmark"],
        ["Sport", "HLG Halle", "Lf", "", "sportscourt", "xmark"]
    ]
    var body: some View {
        //NavigationView {
            VStack {
                Text("Friday")
                    .font(.largeTitle)
                ForEach(friday, id: \.self) { item in
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color(.gray)).opacity(0.2)
                            .shadow(color: Color("superiorBlack"), radius: 10, x: 1, y: 3)
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color(item[3]))
                                Image(systemName: item[4])
                                    .font(.largeTitle)
                            }.aspectRatio(1, contentMode: .fit)
                            VStack(alignment: .leading) {
                                Spacer()
                                Text(item[0])
                                Spacer()
                                Text(item[1])
                                Spacer()
                                Text(item[2])
                                Spacer()
                            }.padding(.leading, 10)
                            Spacer()
                            ZStack {
                                Ellipse()
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .foregroundColor(Color(.systemBackground))
                                    .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                                Image(systemName: item[5])
                            }
                        }.padding()
                    }.frame(width: nil, height: 100, alignment: .center)
                    .padding()
                }
            }.padding()
            //.navigationTitle("09.03.2021")
        //}
    }
}

struct untisList_Previews: PreviewProvider {
    static var previews: some View {
        untisList()
    }
}
