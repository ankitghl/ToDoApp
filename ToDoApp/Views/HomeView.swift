//
//  HomeView.swift
//  ToDoApp
//
//  Created by Ankit Gohel on 15/07/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var showEditModal = false
    @State private var selectedTask: Task?
    @State private var selectedTaskTitle = ""
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(viewModel.tasks) { task in
                    TaskRowView(task: task) {
                        viewModel.toggleTaskCompletion(for: task)
                    } onRowTap: {
                        selectedTask = task
                        showEditModal.toggle()
                    }
                }
                .onDelete{ indexSet in
                    viewModel.deleteTask(at: indexSet)
                }
            }
            .navigationTitle("ToDo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink(destination: AddTaskView(viewModel: viewModel)) {
                    Label("", systemImage: "plus")
                }
            }
            .alert("Edit Task", isPresented: $showEditModal) {
                TextField("Task Title", text: $selectedTaskTitle)
                
                HStack{
                    Button {
                        showEditModal.toggle()
                        selectedTaskTitle = ""
                    } label: {
                        HStack {
                            Spacer()
                            Text("Cacel")
                            Spacer()
                        }
                    }
                    
                    Button {
                        viewModel.updateTask(selectedTask, with: selectedTaskTitle)
                        showEditModal.toggle()
                        selectedTaskTitle = ""
                    } label: {
                        HStack {
                            Spacer()
                            Text("Save")
                            Spacer()
                        }
                    }
                    .disabled(selectedTaskTitle.isEmpty)

                }
            }
        }
        
    }
}

#Preview {
    HomeView()
}
