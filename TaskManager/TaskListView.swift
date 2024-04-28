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
    @State private var selectedTask: Task? = nil
    
    var body: some View {
        List($tasks){ $task in
            TaskView(task: $task, selectedTask: $selectedTask, inspectorIsShown: $inspectorIsShown)
        }
        .navigationTitle(title)
        .toolbar{
            ToolbarItemGroup{
                Button(action: {
                    tasks.append(Task(title: "New Task"))
                }, label: {
                    Label("Add new Task", systemImage:  "plus")
                })
                .keyboardShortcut(KeyEquivalent("t"), modifiers: .command)
                
                Button(action: {
                    inspectorIsShown.toggle()
                }, label: {
                    Label("Close Inspector", systemImage: "sidebar.right")
                })
            }
        }
        .inspector(isPresented: $inspectorIsShown){
            Group{
                if let selectedTask{
                    Text(selectedTask.title)
                        .font(.title)
                }
                else{
                    Text("Nothing selected")
                }
            }
            .frame(minWidth: 100, maxWidth: .infinity)
        }
    }
        
}

#Preview {
    TaskListView(title: "All", tasks: .constant(Task.exapmles()))
}
