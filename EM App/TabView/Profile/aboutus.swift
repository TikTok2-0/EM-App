//
//  aboutus.swift
//  EM App
//
//  Created by Henry Krieger on 31.03.21.
//

import SwiftUI
import MessageUI

struct aboutus: View {
    @Environment(\.openURL) var openURL
    
    @State var showSafari = false
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    
    var body: some View {
            List {
                Section(header: Text("Info")) {
                    Text("© 2021 Henry Krieger")
                        .fontWeight(.bold)
                }
                
                Section(header: Text("Bugs")) {
                    Text("Found a bug? Tell us!")
                    Button(action: {
                        self.isShowingMailView.toggle()
                    }) {
                        Label("Send Feedback", systemImage: "envelope")
                    }
                    .disabled(!MFMailComposeViewController.canSendMail())
                    .sheet(isPresented: $isShowingMailView) {
                        MailView(result: self.$result)
                    }
                }
                
                Section(header: Text("Open-Source Libraries")) {
                    //Text("This app uses the following open-source libraries:")
                    VStack {
                        HStack {
                            Text("URLImage")
                                .fontWeight(.bold)
                            Spacer()
                            Button(action: { showSafari.toggle() }) {
                                Text("Link").fullScreenCover(isPresented: $showSafari) {
                                    SafariView(url: URL(string: "https://github.com/dmytro-anokhin/url-image")!).ignoresSafeArea(edges: .all)
                                }
                            }
                        }
                        Text("MIT License \nCopyright (c) 2019 Dmytro Anokhin \nPermission is hereby granted, free of charge, to any person obtaining a copy \nof this software and associated documentation files (the 'Software'), to deal \nin the Software without restriction, including without limitation the rights \nto use, copy, modify, merge, publish, distribute, sublicense, and/or sell \ncopies of the Software, and to permit persons to whom the Software is \nfurnished to do so, subject to the following conditions: \n\nThe above copyright notice and this permission notice shall be included in all \ncopies or substantial portions of the Software. \n\nTHE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.")
                    }
                }
                
                Section(header: Text("Backend Libraries")) {
                    VStack {
                        HStack {
                            Text("BSD 3 License GITPYTHON")
                                .fontWeight(.bold)
                            Spacer()
                            /*Button(action: { showSafari.toggle() }) {
                                Text("Link").fullScreenCover(isPresented: $showSafari) {
                                    SafariView(url: URL(string: "")!).ignoresSafeArea(edges: .all)
                                }
                            }*/
                        }
                        Text("Copyright (C) 2008, 2009 Michael Trier and contributo\nAll rights reserved.\nRedistribution and use in source and binary forms, with or without\nmodification, are permitted provided that the following conditions\nare met:\n\n* Redistributions of source code must retain the above copyright\nnotice, this list of conditions and the following disclaimer.\n\n* Redistributions in binary form must reproduce the above copyright\nnotice, this list of conditions and the following disclaimer in the\ndocumentation and/or other materials provided with the distribution.\n\n* Neither the name of the GitPython project nor the names of\nits contributors may be used to endorse or promote products derived\nfrom this software without specific prior written permission.\n\nTHIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS\n'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT\nLIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR\nA PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT\nOWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,\nSPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED\nTO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR\nPROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF\nLIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING\nNEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS\nSOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.")
                    }
                    VStack {
                        HStack {
                            Text("BSD3 License beautifulsoup4")
                                .fontWeight(.bold)
                            Spacer()
                            /*Button(action: { showSafari.toggle() }) {
                                Text("Link").fullScreenCover(isPresented: $showSafari) {
                                    SafariView(url: URL(string: "")!).ignoresSafeArea(edges: .all)
                                }
                            }*/
                        }
                        Text("Copyright 2011 Leonard Richardson\nRedistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:\n\n1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.\n\n2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.\n\nTHIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.")
                    }
                    VStack {
                        HStack {
                            Text("LGPL License MariaDB")
                                .fontWeight(.bold)
                            Spacer()
                            /*Button(action: { showSafari.toggle() }) {
                                Text("Link").fullScreenCover(isPresented: $showSafari) {
                                    SafariView(url: URL(string: "")!).ignoresSafeArea(edges: .all)
                                }
                            }*/
                        }
                        Text("GNU LESSER GENERAL PUBLIC LICENSE\nVersion 3, 29 June 2007\nCopyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>\nEveryone is permitted to copy and distribute verbatim copies\nof this license document, but changing it is not allowed.\n\nThis version of the GNU Lesser General Public License incorporates\nthe terms and conditions of version 3 of the GNU General Public\nLicense, supplemented by the additional permissions listed below.\n\n0. Additional Definitions.\n\nAs used herein, 'this License' refers to version 3 of the GNU Lesser\nGeneral Public License, and the 'GNU GPL' refers to version 3 of the GNU\nGeneral Public License.\n\n'The Library' refers to a covered work governed by this License,\nother than an Application or a Combined Work as defined below.\n\nAn 'Application' is any work that makes use of an interface provided\nby the Library, but which is not otherwise based on the Library.\nDefining a subclass of a class defined by the Library is deemed a mode\nof using an interface provided by the Library.\n\nA 'Combined Work' is a work produced by combining or linking an\nApplication with the Library.  The particular version of the Library\nwith which the Combined Work was made is also called the 'Linked\nVersion'.\n\nThe 'Minimal Corresponding Source' for a Combined Work means the\nCorresponding Source for the Combined Work, excluding any source code\nfor portions of the Combined Work that, considered in isolation, are\nbased on the Application, and not on the Linked Version.\n\nThe 'Corresponding Application Code' for a Combined Work means the\nobject code and/or source code for the Application, including any data\nand utility programs needed for reproducing the Combined Work from the\nApplication, but excluding the System Libraries of the Combined Work.\n\n1. Exception to Section 3 of the GNU GPL.\n\nYou may convey a covered work under sections 3 and 4 of this License\nwithout being bound by section 3 of the GNU GPL.\n\n2. Conveying Modified Versions.\n\nIf you modify a copy of the Library, and, in your modifications, a\nfacility refers to a function or data to be supplied by an Application\nthat uses the facility (other than as an argument passed when the\nfacility is invoked), then you may convey a copy of the modified\nversion:\n\na) under this License, provided that you make a good faith effort to\nensure that, in the event an Application does not supply the\nfunction or data, the facility still operates, and performs\nwhatever part of its purpose remains meaningful, or\n\nb) under the GNU GPL, with none of the additional permissions of\nthis License applicable to that copy.\n\n3. Object Code Incorporating Material from Library Header Files.\n\nThe object code form of an Application may incorporate material from\na header file that is part of the Library.  You may convey such object\ncode under terms of your choice, provided that, if the incorporated\nmaterial is not limited to numerical parameters, data structure\nlayouts and accessors, or small macros, inline functions and templates\n(ten or fewer lines in length), you do both of the following:\n\na) Give prominent notice with each copy of the object code that the\nLibrary is used in it and that the Library and its use are\ncovered by this License.\n\nb) Accompany the object code with a copy of the GNU GPL and this license\ndocument.\n\n4. Combined Works.\n\nYou may convey a Combined Work under terms of your choice that,\ntaken together, effectively do not restrict modification of the\nportions of the Library contained in the Combined Work and reverse\nengineering for debugging such modifications, if you also do each of\nthe following:\n\na) Give prominent notice with each copy of the Combined Work that\nthe Library is used in it and that the Library and its use are\ncovered by this License.\n\nb) Accompany the Combined Work with a copy of the GNU GPL and this license\ndocument.\n\nc) For a Combined Work that displays copyright notices during\nexecution, include the copyright notice for the Library among\nthese notices, as well as a reference directing the user to the\ncopies of the GNU GPL and this license document.\n\nd) Do one of the following:\n\n0) Convey the Minimal Corresponding Source under the terms of this\nLicense, and the Corresponding Application Code in a form\nsuitable for, and under terms that permit, the user to\nrecombine or relink the Application with a modified version of\nthe Linked Version to produce a modified Combined Work, in the\nmanner specified by section 6 of the GNU GPL for conveying\nCorresponding Source.\n\n1) Use a suitable shared library mechanism for linking with the\nLibrary.  A suitable mechanism is one that (a) uses at run time\na copy of the Library already present on the user's computer\nsystem, and (b) will operate properly with a modified version\nof the Library that is interface-compatible with the Linked\nVersion.\n\ne) Provide Installation Information, but only if you would otherwise\nbe required to provide such information under section 6 of the\nGNU GPL, and only to the extent that such information is\nnecessary to install and execute a modified version of the\nCombined Work produced by recombining or relinking the\nApplication with a modified version of the Linked Version. (If\nyou use option 4d0, the Installation Information must accompany\nthe Minimal Corresponding Source and Corresponding Application\nCode. If you use option 4d1, you must provide the Installation\nInformation in the manner specified by section 6 of the GNU GPL\nfor conveying Corresponding Source.)\n\n5. Combined Libraries.\n\nYou may place library facilities that are a work based on the\nLibrary side by side in a single library together with other library\nfacilities that are not Applications and are not covered by this\nLicense, and convey such a combined library under terms of your\nchoice, if you do both of the following:\n\na) Accompany the combined library with a copy of the same work based\non the Library, uncombined with any other library facilities,\nconveyed under the terms of this License.\n\nb) Give prominent notice with the combined library that part of it\nis a work based on the Library, and explaining where to find the\naccompanying uncombined form of the same work.\n\n6. Revised Versions of the GNU Lesser General Public License.\n\nThe Free Software Foundation may publish revised and/or new versions\nof the GNU Lesser General Public License from time to time. Such new\nversions will be similar in spirit to the present version, but may\ndiffer in detail to address new problems or concerns.\n\nEach version is given a distinguishing version number. If the\nLibrary as you received it specifies that a certain numbered version\nof the GNU Lesser General Public License 'or any later version'\napplies to it, you have the option of following the terms and\nconditions either of that published version or of any later version\npublished by the Free Software Foundation. If the Library as you\nreceived it does not specify a version number of the GNU Lesser\nGeneral Public License, you may choose any version of the GNU Lesser\nGeneral Public License ever published by the Free Software Foundation.\n\nIf the Library as you received it specifies that a proxy can decide\nwhether future versions of the GNU Lesser General Public License shall\napply, that proxy's public statement of acceptance of any version is\npermanent authorization for you to choose that version for the\nLibrary.")
                    }
                    VStack {
                        HStack {
                            Text("BSD3 License Colorama")
                                .fontWeight(.bold)
                            Spacer()
                            /*Button(action: { showSafari.toggle() }) {
                                Text("Link").fullScreenCover(isPresented: $showSafari) {
                                    SafariView(url: URL(string: "")!).ignoresSafeArea(edges: .all)
                                }
                            }*/
                        }
                        Text("Copyright (c) 2010 Jonathan Hartley\nAll rights reserved.\n\nRedistribution and use in source and binary forms, with or without\nmodification, are permitted provided that the following conditions are met:\n\n* Redistributions of source code must retain the above copyright notice, this\nlist of conditions and the following disclaimer.\n\n* Redistributions in binary form must reproduce the above copyright notice,\nthis list of conditions and the following disclaimer in the documentation\nand/or other materials provided with the distribution.\n\n* Neither the name of the copyright holders, nor those of its contributors\nmay be used to endorse or promote products derived from this software without\nspecific prior written permission.\n\nTHIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND\nANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED\nWARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE\nDISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE\nFOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL\nDAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR\nSERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER\nCAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,\nOR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE\nOF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.")
                    }
                }
                
                Section(header: Text("Icons")) {
                    HStack {
                        Text("SF Symbols")
                            .fontWeight(.bold)
                        Spacer()
                        Button(action: { showSafari.toggle() }) {
                            Text("Link").fullScreenCover(isPresented: $showSafari) {
                                SafariView(url: URL(string: "https://developer.apple.com/sf-symbols/")!).ignoresSafeArea(edges: .all)
                            }
                        }
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
