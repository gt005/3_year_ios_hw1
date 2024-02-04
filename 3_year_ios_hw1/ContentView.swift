//
//  ContentView.swift
//  3_year_ios_hw1
//
//  Created by Карим Хамид on 04.02.2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(
        entity: TodoListItem.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \TodoListItem.isComplete, ascending: true),
            NSSortDescriptor(keyPath: \TodoListItem.dateAdded, ascending: false)
        ]
    ) var notCompletedItems: FetchedResults<TodoListItem>
    
    @State private var todoListItemName = "";

    var body: some View {
        VStack{
            HStack{
                TextField("Item Name", text: $todoListItemName)
                Button(
                    action: {TodoListItemService(context: context).create(isComplete: false, name: todoListItemName, dateAdded: Date())}
                ){
                    Text("Add Item")
                }
            }.padding(15)

            List {
                ForEach(notCompletedItems) { todoListItem in
                    HStack {
                        Button(action: {
                            TodoListItemService(context: context).update(id: todoListItem.id!, isComplete: !todoListItem.isComplete)
                        }) {
                            Image(systemName: todoListItem.isComplete ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(todoListItem.isComplete ? .green : .gray)
                        }
                        .buttonStyle(BorderlessButtonStyle())

                        Text(todoListItem.name ?? "Untitled")
                            .padding(.leading, 8)

                        Spacer()

                        Button(action: {
                            TodoListItemService(context: context).delete(todoListItem: todoListItem)
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
