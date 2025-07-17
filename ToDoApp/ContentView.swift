//
//  ContentView.swift
//  ToDoApp
//
//  Created by Ankit Gohel on 15/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        TabView {
            HomeView().tabItem {
                Label("Home", systemImage: "list.dash")
            }
            
//            AddTaskView().tabItem {
//                Label("Add Task", systemImage: "plus.app")
//            }
//        }View().tabItem {
//                Label("Add Task", systemImage: "plus.app")
//            }
//        }
    }
}

#Preview {
    ContentView()
}
