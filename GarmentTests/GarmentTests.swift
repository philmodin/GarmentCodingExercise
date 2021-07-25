//
//  GarmentTests.swift
//  GarmentTests
//
//  Created by endOfLine on 7/24/21.
//

import CoreData
import XCTest
@testable import Garment

class GarmentTests: XCTestCase {

    let context = PersistenceController.shared.container.viewContext
    
    override func setUpWithError() throws {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Garment")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try PersistenceController.shared.container.persistentStoreCoordinator.execute(deleteRequest, with: context)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGarmentAdd() throws {
        let newGarment = Garment(context: context)
        newGarment.title = "Test Item"
        newGarment.timestamp = Date()
        
        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            XCTFail("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
