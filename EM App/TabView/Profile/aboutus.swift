//
//  aboutus.swift
//  EM App
//
//  Created by Henry Krieger on 31.03.21.
//

import SwiftUI

struct aboutus: View {
    @Environment(\.openURL) var openURL
    
    var body: some View {
            List {
                Section(header: Text("Info")) {
                    Text("© 2021 Henry Krieger")
                        .fontWeight(.bold)
                }
                
                Section(header: Text("Bugs")) {
                    Text("Found a bug? Report it to: \nhenry.krieger@me.com")
                    Button(action: { openURL(URL(string: "mailto:henry.krieger@me.com")!) }) {
                        Label("henry.krieger@me.com", systemImage: "envelope")
                    }
                }
                
                Section(header: Text("Open-Source Libraries")) {
                    //Text("This app uses the following open-source libraries:")
                    VStack {
                        HStack {
                            Text("URLImage")
                                .fontWeight(.bold)
                            Spacer()
                            Link("Link", destination: URL(string: "https://github.com/dmytro-anokhin/url-image")!)
                        }
                        Text("MIT License \nCopyright (c) 2019 Dmytro Anokhin \nPermission is hereby granted, free of charge, to any person obtaining a copy \nof this software and associated documentation files (the 'Software'), to deal \nin the Software without restriction, including without limitation the rights \nto use, copy, modify, merge, publish, distribute, sublicense, and/or sell \ncopies of the Software, and to permit persons to whom the Software is \nfurnished to do so, subject to the following conditions: \n\nThe above copyright notice and this permission notice shall be included in all \ncopies or substantial portions of the Software. \n\nTHE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.")
                    }
                }
                
                Section(header: Text("Icons")) {
                    HStack {
                        Text("SF Symbols")
                            .fontWeight(.bold)
                        Spacer()
                        Link("Link", destination: URL(string: "https://developer.apple.com/sf-symbols/")!)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("About Us")
    }
}

struct aboutus_Previews: PreviewProvider {
    static var previews: some View {
        aboutus()
    }
}
