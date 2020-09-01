//
//  Checklist.swift
//  Checklist
//
//  Created by Lorenzo on 27/08/2020.
//  Copyright © 2020 Lorenzo. All rights reserved.
//

import Foundation

class Checklist: ObservableObject{
    
     @Published var checklistItems = [
        CheckListItems(item: "Walk the dog"),
        CheckListItems(item: "Brush my teeth"),
        CheckListItems(item:"Learn iOS Development", isChecked: true),
        CheckListItems(item: "Soccer practice"),
        CheckListItems(item: "Eat ice cream", isChecked: true)
    ]
    
    init() {
        print("Documents directory is: \(documentsDirectory())")
        print("Data file path is: \(dataFilePath())")
        loadListItems()
    }
    
    func showItems() {
        for element in checklistItems {
            print(element)
        }
    }
    
    func deleteListItem(withItems: IndexSet) {
        checklistItems.remove(atOffsets: withItems)
        saveListItems()
    }
    
    func moveListItems(withItems: IndexSet, destination: Int) {
        checklistItems.move(fromOffsets: withItems, toOffset: destination)
        showItems()
        saveListItems()
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklist.plist")
    }
    
    func saveListItems() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(checklistItems)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding item array: \(error.localizedDescription)")
        }
    }
    
    func loadListItems() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
        do {
            checklistItems = try decoder.decode([CheckListItems].self, from: data)
        } catch {
            print("Error decoding item array: \(error.localizedDescription )")
            }
        }
    }
}
