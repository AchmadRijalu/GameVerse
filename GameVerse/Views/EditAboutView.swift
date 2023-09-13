//
//  EditAboutView.swift
//  GameVerse
//
//  Created by Achmad Rijalu on 09/09/23.
//

import SwiftUI

struct EditAboutView: View {
    @Binding var aboutViewModel: AboutModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Name", text: $aboutViewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.all, 20)
                HStack {
                    Text("Description").font(.title3).bold().padding(.leading, 20)
                    Spacer()
                }.padding(.bottom, 4)
                TextEditor(text: $aboutViewModel.description).frame(height: 100)
                    .foregroundColor(SwiftUI.Color.white) .scrollContentBackground(.hidden)
                    .background(SwiftUI.Color("TabBarColor"))
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationTitle("Edit Profile About")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button("Save") {
                            SharedMethods().saveAboutDataToUserDefaults(aboutViewModel, forKey: "aboutKey")
                            presentationMode.wrappedValue.dismiss()
                            //                            aboutModel.name = $name
                        }
                    }
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
        }
    }
}

struct EditAboutView_Previews: PreviewProvider {
    static var previews: some View {
        EditAboutView(aboutViewModel: .constant(AboutModel(name: "", description: "")))
    }
}
