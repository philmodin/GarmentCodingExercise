//
//  ContentView.swift
//  Garment
//
//  Created by endOfLine on 7/24/21.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        GarmentsView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
