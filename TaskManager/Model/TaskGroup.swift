//
//  TaskGroup.swift
//  TaskManager
//
//  Created by Luca Bernardis on 28/04/24.
//

import Foundation

struct TaskGroup : Identifiable, Hashable{
    
    let id = UUID()
    var title: String
    let creationDate: Date
    var tasks: [Task]
    
    init(title: String, tasks: [Task] = []) {
        self.title = title
        self.creationDate = Date()
        self.tasks = tasks
    }
    
    static func example() -> TaskGroup {
        let task1 = Task(title: "Task 1")
        let task2 = Task(title: "Task 3")
        let task3 = Task(title: "Task 3")
        
        var group = TaskGroup(title: "Personal")
        group.tasks = [task1, task2, task3]
        return group
    }
    
    static func examples() -> [TaskGroup] {
        let group1 = TaskGroup.example()
        let group2 = TaskGroup(title: "NewGroup")
        return [group1, group2]
    }
}
