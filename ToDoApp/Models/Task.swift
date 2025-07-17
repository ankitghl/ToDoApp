//
//  Task.swift
//  ToDoApp
//
//  Created by Ankit Gohel on 16/07/25.
//

import Foundation


struct Task: Identifiable, Codable {
    var id: UUID
    var title: String
    var isCompleted: Bool
    
    init(id: UUID = UUID(), title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}
