//
//  ContentView.swift
//  TaskManager
//
//  Created by Luca Bernardis on 28/04/24.
//

import SwiftUI


struct ContentView: View {
    
    @State private var selection  = TaskSection.all
    @State private var allTasks  = Task.exapmles()
    @State private var userCreatedGroups: [TaskGroup] = TaskGroup.examples()
    @State private var searchTerm: String = ""
    
    var body: some View {
        
        NavigationSplitView{
            SidebarView(userCreatedGroups: $userCreatedGroups, selection: $selection)
                .searchable(text: $searchTerm)
        } detail: {
            
            if searchTerm.isEmpty{
                switch selection {
                case .all:
                    TaskListView(title: "All", tasks: $allTasks)
                case .done:
                    StaticTaskListView(title: "Done", tasks: allTasks.filter({$0.isCompleted}))
                case .upcoming:
                    StaticTaskListView(title: "Upcoming", tasks: allTasks.filter({!$0.isCompleted}))
                case .list(let taskGroup):
                    StaticTaskListView(title: taskGroup.title, tasks: taskGroup.tasks)
                }
            }
            
            else{
                StaticTaskListView(title: "All", tasks: allTasks.filter({$0.title.contains(searchTerm)}))
            }
        }
    }
}

#Preview {
    ContentView()
}
