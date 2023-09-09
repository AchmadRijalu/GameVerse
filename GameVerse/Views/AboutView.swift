//
//  AboutView.swift
//  GameVerse
//
//  Created by Achmad Rijalu on 25/08/23.
//

import SwiftUI

struct AboutView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.white)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.white)]
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
    }
    @Environment(\.presentationMode) var presentationMode
    @State private var showWebView = false
    @State private var showEditAboutView = false
    @EnvironmentObject var aboutusViewModel:AboutViewModel
    var shareMethods = SharedMethods()
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image("photo").resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 200)
                        .cornerRadius(100)
                }.padding(.top, 70)
                VStack(spacing: 20) {
                    HStack {
                        Text(aboutusViewModel.aboutData.name).font(.title2).fontWeight(.medium).foregroundColor(.white)
                    }
                    HStack(alignment: .center) {
                        Text(aboutusViewModel.aboutData.description).font(.title3).fontWeight(.medium)
                            .multilineTextAlignment(.center).foregroundColor(.white)
                    }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    Spacer()
                    Button(action: {
                        SharedMethods().openEmailApp()}
                    ){ Text("Contact Me").fontWeight(.medium)
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width / 2) // Adjust padding as needed
                            .padding()
                            .background(SwiftUI.Color("PrimaryColor"))
                            .cornerRadius(16)
                    }
                    Button(action: {
                        showWebView.toggle()}
                    ) { Text("Linkedinn").fontWeight(.medium)
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width / 2) // Adjust padding as needed
                            .padding()
                            .background(SwiftUI.Color("SecondaryColor"))
                            .cornerRadius(16)
                    }
                    Spacer()
                }.padding(.top, 12)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(SwiftUI.Color("TabBarColor").edgesIgnoringSafeArea(.all))
                .navigationTitle("About").navigationBarTitleDisplayMode(.automatic)
                .sheet(isPresented: $showWebView) {
                    VStack {
                        VStack {
                            HStack {
                                Image(systemName: "arrow.backward").foregroundColor(.white).padding(.leading, 12)
                                Text("Back").font(.system(.title3)).foregroundColor(.white).onTapGesture {
                                    showWebView.toggle()
                                }
                                Spacer()
                            }
                        }.frame(maxWidth: .infinity).background(SwiftUI.Color("PrimaryColor"))
                        WebViewRepresentable(url: URL(string: "https://www.linkedin.com/in/achmadrijalu/")!)
                    }
                }
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button("Edit") {
                            showEditAboutView.toggle()
                        }
                    }
                }.sheet(isPresented: $showEditAboutView) {
                    EditAboutView(aboutViewModel: $aboutusViewModel.aboutData)
                }
        }
    }
}
struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
