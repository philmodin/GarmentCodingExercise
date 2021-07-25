//
//  GarmentsSortedView.swift
//  Garment
//
//  Created by endOfLine on 7/24/21.
//

import SwiftUI

struct GarmentsSortedView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    private var garments: FetchRequest<Garment>
    
    init(sort: NSSortDescriptor) {
        garments = FetchRequest<Garment>(entity: Garment.entity(), sortDescriptors: [sort])
    }
    
    var body: some View {
        List {
            ForEach(garments.wrappedValue) { garment in
                HStack {
                    Text(garment.title ?? "untitled")
                    Spacer()
                }
            }
            .onDelete(perform: deleteItems)
        }
        .listStyle(PlainListStyle())
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { garments.wrappedValue[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct GarmentsSortedView_Previews: PreviewProvider {
    static var previews: some View {
        GarmentsSortedView(sort: NSSortDescriptor(keyPath: \Garment.timestamp, ascending: true))
    }
}
