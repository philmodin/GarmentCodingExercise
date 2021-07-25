//
//  GarmentsView.swift
//  Garment
//
//  Created by endOfLine on 7/24/21.
//

import SwiftUI

struct GarmentsView: View {
    
    @State private var sortDescriptors = [
        NSSortDescriptor(keyPath: \Garment.title, ascending: true),
        NSSortDescriptor(keyPath: \Garment.timestamp, ascending: false)
    ]
    
    @State private var sortOrder = 0
    
    @State private var isShowingGarmentAdd = false
    
    let sortOptions = ["Alpha", "Creation Time"]
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $sortOrder, content: {
                    ForEach(0 ..< sortOptions.count) {
                        Text(sortOptions[$0])
                    }
                })
                .pickerStyle(SegmentedPickerStyle())
                .padding(.bottom)
                Divider()
                GarmentsSortedView(sort: sortDescriptors[sortOrder])
                Spacer()
            }
            .padding()
            .navigationBarTitle("List", displayMode: .inline)
            .navigationBarItems(
                trailing: Button(
                    action: {
                        isShowingGarmentAdd = true
                    },
                    label: {
                        Image(systemName: "plus.circle")
                    }
                )
                .accessibilityIdentifier("addGarmentButton")
            )
        }
        .sheet(isPresented: $isShowingGarmentAdd, content: {
            GarmentAddView()
        })
    }    
}

struct GarmentsListView_Previews: PreviewProvider {
    static var previews: some View {
        GarmentsView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
