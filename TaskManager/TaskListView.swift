//
//  TaskListView.swift
//  TaskManager
//
//  Created by Luca Bernardis on 28/04/24.
//

import SwiftUI

struct TaskListView: View {
    
    let title: String
    @Binding var tasks: [Task]
    @State private var inspectorIsShown: Bool = false
    
    var body: some View {
        List($tasks){ $task in
            TaskView(task: $task)
        }
        .toolbar{
            ToolbarItemGroup{
                Button(action: {
                    tasks.append(Task(title: "New Task"))
                }, label: {
                    Label("Add new Task", systemImage:  "plus")
                })
                .keyboardShortcut(KeyEquivalent("n"), modifiers: .command)
                
                Button(action: {
                    inspectorIsShown.toggle()
                }, label: {
                    Label("Show inspector", image: "sidebar.right")
                })
            }
        }
        .inspector(isPresented: $inspectorIsShown){
            Text("Show some details")
        }
    }
        
}

#Preview {
    TaskListView(title: "All", tasks: .constant(Task.exapmles()))
}
