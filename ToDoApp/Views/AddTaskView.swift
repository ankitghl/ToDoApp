//
//  AddTaskView.swift
//  ToDoApp
//
//  Created by Ankit Gohel on 15/07/25.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: HomeViewModel
    @State private var taskTitle: String = ""
    
    var body: some View {
        Form {
            TextField("Task Title", text: $taskTitle)
            
            Section {
                Button {
                    viewModel.addTask(title: taskTitle)
                    dismiss()
                } label: {
                    HStack {
                        Spacer()
                        Text("Save")
                        Spacer()
                    }
                }
                .disabled(taskTitle.isEmpty)
            }
        }
        
    }
}

#Preview {
    @Previewable @StateObject var viewModel: HomeViewModel = HomeViewModel()
    AddTaskView(viewModel: viewModel)
}
