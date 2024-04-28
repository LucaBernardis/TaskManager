//
//  TaskView.swift
//  TaskManager
//
//  Created by Luca Bernardis on 28/04/24.
//

import SwiftUI

struct TaskView: View {
    
    @Binding var task: Task
    
    var body: some View {
        HStack{
            Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                .onTapGesture {
                    task.isCompleted.toggle()
                }
            TextField("New task", text: $task.title)
                .textFieldStyle(.plain)
            
        }
    }
}

#Preview {
    TaskView(task: .constant(Task.example()))
        .padding()
}
