//
//  TaskTrackerApp.swift
//  TaskTracker
//
//  Created by Aysel Mohbaliyeva on 08.05.26.
//

import SwiftUI
import SwiftData

@main
struct TaskTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
