//
//  TaskRowView.swift
//  ToDoApp
//
//  Created by Ankit Gohel on 16/07/25.
//

import SwiftUI

struct TaskRowView: View {
    var task: Task
    var onToggle: () -> Void
    var onRowTap: () -> Void
    
    var body: some View {
        HStack {
            Text(task.title)
            Spacer()
            Button {
                onToggle()
            } label: {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(BorderedButtonStyle())
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onRowTap()
        }
    }
}

#Preview {
    TaskRowView(task: Task(title: "Test Task"), onToggle: {
        
    }, onRowTap: {
        
    })
}
