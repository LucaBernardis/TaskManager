//
//  Task.swift
//  TaskManager
//
//  Created by Luca Bernardis on 28/04/24.
//

import Foundation

struct Task : Identifiable, Hashable{
    
    let id = UUID()
    var title: String
    var isCompleted: Bool
    var dueDate: Date?
    var detail: String?
    
    init(title: String, isCompleted: Bool = false, dueDate: Date? = nil, detail: String? = nil) {
        self.title = title
        self.isCompleted = isCompleted
        self.dueDate = dueDate
        self.detail = detail
    }
    
    static func example() -> Task{
        Task(title: "Buy milk", dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!)
    }
    
    static func exapmles() -> [Task]{
        [
            Task(title: "Primo task applicazione", isCompleted: true, dueDate: Calendar.current.date(byAdding: .day, value: 4, to: Date())!),
            Task(title: "Secondo task", isCompleted: false, dueDate: Calendar.current.date(byAdding: .day, value: 6, to: Date())!),
            Task(title: "Comprare cibo", isCompleted: true, dueDate: Calendar.current.date(byAdding: .day, value: 10, to: Date())!),
            Task(title: "Meccanico", isCompleted: true)
        ]
    }
}
