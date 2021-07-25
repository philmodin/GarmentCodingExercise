//
//  GarmentAddView.swift
//  Garment
//
//  Created by endOfLine on 7/24/21.
//

import SwiftUI

struct GarmentAddView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var title = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Garment Name:")
                    Spacer()
                }
                TextField("", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibilityIdentifier("garmentTitleField")
                Spacer()
            }
            .padding()
            .navigationBarTitle("ADD", displayMode: .inline)
            .navigationBarItems(
                trailing: Button(
                    "Save",
                    action: {
                        addItem()
                    }
                )
                .accessibilityIdentifier("saveGarmentButton")
            )
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Garment(context: viewContext)
            newItem.timestamp = Date()
            newItem.title = title
            do {
                try viewContext.save()
                presentationMode.wrappedValue.dismiss()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct GarmentAddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GarmentAddView()
        }
    }
}
