//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by Luca Bernardis on 28/04/24.
//

import SwiftUI

@main
struct TaskManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands{
            CommandMenu("Task"){
                Button("Add New Task"){
                    
                }
                .keyboardShortcut(KeyEquivalent("t"), modifiers: .command)
            }
            
            CommandGroup(after: .newItem){
                Button("Add New Group"){
                    
                }
                .keyboardShortcut(KeyEquivalent("g"), modifiers: .command)
            }
        }
        
        WindowGroup("Special"){
            Text("Second Window")
                .frame(minWidth: 200, idealWidth: 300, minHeight: 200)
        }
        .defaultPosition(.center)
    }
}
