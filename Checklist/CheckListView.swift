//
//  CheckListView.swift
//  Checklist
//
//  Created by Lorenzo on 21/08/2020.
//  Copyright © 2020 Lorenzo. All rights reserved.
//

import SwiftUI


struct CheckListView: View {
    
    @ObservedObject var checklist = Checklist()
    @State var newChecklistItemViewIsVisible = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.checklistItems) { item in
                    RowView(cheklistItem: self.$checklist.checklistItems[item])
                }
                    
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItems)
                
            }
            .navigationBarItems(leading: Button(action: {
                self.newChecklistItemViewIsVisible = true
            }) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Add item")
                }
                }, trailing: EditButton())
                .navigationBarTitle("Checklist", displayMode: .inline)
            .onAppear {
                self.checklist.showItems()
                self.checklist.saveListItems()
            }
        }.sheet(isPresented: self.$newChecklistItemViewIsVisible) {
            NewChecklistItemView(checklist: self.checklist)
        }
    }
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CheckListView()
    }
}

