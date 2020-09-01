//
//  RowView.swift
//  Checklist
//
//  Created by Lorenzo on 31/08/2020.
//  Copyright © 2020 Lorenzo. All rights reserved.
//

import SwiftUI

struct RowView: View {
    @Binding var cheklistItem: CheckListItems
    
    var body: some View {
        NavigationLink(destination: EditChecklistItemView(checklistItem: $cheklistItem)) {
            HStack {
                Text(cheklistItem.item)
                Spacer()
                Text(cheklistItem.isChecked ? "✅" : "🔲")
            }
        }
        
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(cheklistItem: .constant(CheckListItems(item: "Sample item")))
    }
}
