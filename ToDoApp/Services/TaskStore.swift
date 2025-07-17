//
//  DataStore.swift
//  ToDoApp
//
//  Created by Ankit Gohel on 17/07/25.
//

import Foundation

protocol TaskStoreProtocol {
    func loadTasks() -> [Task]
    func saveTasks(_ tasks: [Task])
}


class TaskStore: TaskStoreProtocol {
    private let tasksKey = "tasks_key"
        
    func loadTasks() -> [Task] {
        guard let data = UserDefaults.standard.data(forKey: tasksKey),
        let tasks = try? JSONDecoder().decode([Task].self, from: data) else {
            return []
        }
        return tasks;
    }
    
    func saveTasks(_ tasks: [Task]) {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: tasksKey)    
        }
    }
}
