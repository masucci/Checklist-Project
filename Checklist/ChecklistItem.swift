//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Lorenzo on 27/08/2020.
//  Copyright © 2020 Lorenzo. All rights reserved.
//

import Foundation

struct CheckListItems: Identifiable, Codable {
    let id = UUID()
    var item: String
    var isChecked: Bool = false
}
