//
//  EditChecklistItemView.swift
//  Checklist
//
//  Created by Lorenzo on 27/08/2020.
//  Copyright © 2020 Lorenzo. All rights reserved.
//

import SwiftUI

struct EditChecklistItemView: View {
    @Binding var checklistItem: CheckListItems
    
    var body: some View {
        Form {
            TextField("Name", text: $checklistItem.item)
            Toggle(isOn: $checklistItem.isChecked) {
                Text("Completed")
            }
        }
    }
}

struct EditChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditChecklistItemView(checklistItem: .constant(CheckListItems(item: "Sample item")))
    }
}
