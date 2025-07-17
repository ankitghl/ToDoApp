//
//  DataStore.swift
//  ToDoApp
//
//  Created by Ankit Gohel on 17/07/25.
//

import Foundation

struct DataStore {
    private let tasksKey = "tasks_key"
        
    func loadTasks() -> [Task] {
        guard let data = UserDefaults.standard.data(forKey: tasksKey),
        let decoded = try? JSONDecoder().decode([Task].self, from: data) else {
            return []
        }
        return decoded;
    }
    
    func saveTasks(_ tasks: [Task]) {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: tasksKey)    
        }
    }
}
