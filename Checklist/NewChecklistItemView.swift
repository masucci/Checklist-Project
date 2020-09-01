//
//  NewChecklistItemView.swift
//  Checklist
//
//  Created by Lorenzo on 28/08/2020.
//  Copyright © 2020 Lorenzo. All rights reserved.
//

import SwiftUI

struct NewChecklistItemView: View {
    
    @State var newItemName = ""
    @Environment(\.presentationMode) var presentationMode
    var checklist: Checklist
    
    var body: some View {
        VStack {
            Text("Add new item")
            Form{
                TextField("Enter new item name here", text: $newItemName)
            Button(action: {
                var newCheklistItem = CheckListItems(item: self.newItemName)
                self.checklist.checklistItems.append(newCheklistItem)
                self.checklist.showItems()
                self.checklist.saveListItems()
                self.presentationMode.wrappedValue.dismiss()
                }) {
                HStack{
                    Image(systemName: "plus.circle.fill")
                    Text("Add new Item")
                }
            }.disabled(newItemName.count == 0)
            }
            Text("Swipe down to cancel.")
        }
    }
}

struct NewChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView(checklist: Checklist())
    }
}
