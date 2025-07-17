//
//  HomeViewModel.swift
//  ToDoApp
//
//  Created by Ankit Gohel on 15/07/25.
//

import Foundation


class HomeViewModel: ObservableObject {
    @Published var tasks: [Task] = [] {
        didSet {
            taskStore.saveTasks(tasks)
        }
    }
    private var taskStore: TaskStoreProtocol
    
    init(taskStore: TaskStoreProtocol = TaskStore()) {
        self.taskStore = taskStore
        self.tasks = taskStore.loadTasks()
    }
    
    func addTask(title: String) {
        let newTask = Task(title: title)
        tasks.append(newTask)
    }
    
    func toggleTaskCompletion(for task: Task) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id}) else { return }
        tasks[index].isCompleted.toggle()
        moveCompletedTasksToBottom()
    }
    
    private func moveCompletedTasksToBottom() {
        tasks.sort { (task1, task2) -> Bool in
            return task1.isCompleted != task2.isCompleted
        }
    }
    
    func deleteTask(at offset: IndexSet) {
        tasks.remove(atOffsets: offset)
    }
    
    func updateTask(_ task: Task?, with title: String) {
        guard let task = task else { return }
        guard let index = tasks.firstIndex(where: {$0.id == task.id}) else { return }
        tasks[index].title = title
    }
}
