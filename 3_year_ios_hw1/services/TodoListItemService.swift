//
//  TodoListItemService.swift
//  3_year_ios_hw1
//
//  Created by Карим Хамид on 04.02.2024.
//

import Foundation
import CoreData

class TodoListItemService {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func create(isComplete: Bool, name: String, dateAdded: Date) {
        let newItem = TodoListItem(context: self.context)

        newItem.id = UUID()
        newItem.isComplete = isComplete
        newItem.name = name
        newItem.dateAdded = dateAdded

        do {
            try context.save()
        } catch {
            fatalError("Failed to save context: \(error.localizedDescription)")
        }
    }

    func update(id: UUID, isComplete: Bool) {
        let itemID = id as NSUUID
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "TodoListItem")
        fetchRequest.predicate = NSPredicate(format: "id == %@", itemID as CVarArg)
        fetchRequest.fetchLimit = 1

        do {
            let test = try context.fetch(fetchRequest)
            let itemToUpdate = test[0] as! NSManagedObject
            itemToUpdate.setValue(isComplete, forKey: "isComplete")
        } catch {
            fatalError("Failed to save context: \(error.localizedDescription)")
        }
    }

    func delete(todoListItem: TodoListItem) {
        context.delete(todoListItem)

        do {
            try context.save()
        } catch {
            fatalError("Failed to save context after deletion: \(error.localizedDescription)")
        }
    }

}
