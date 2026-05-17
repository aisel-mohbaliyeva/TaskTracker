import SwiftUI
import SwiftData

struct ContentView: View {

    @State private var taskCount: Int = 0
    @Query private var tasks: [Task]
    @Environment(\.modelContext) private var modelContext
    @State private var newTaskTitle = ""

    var body: some View {

        VStack {

            Text("Task Tracker")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom)
            
            HStack{
                TextField("New task", text: $newTaskTitle)
                    .textFieldStyle(.roundedBorder)
                Button("Add"){
                    addTask()
                }
                .buttonStyle(.borderedProminent)
                .disabled(newTaskTitle.isEmpty)
            }
        
            // List of task
            List {

                ForEach(tasks) { task in

                    HStack {
                        Text(task.title)
                            .strikethrough(task.isCompleted)
                        Image(systemName: task.isCompleted ? "checkmark.seal.fill" :"circle")
                        
                    }
                    .onTapGesture {
                        toggleTask(task)
                    }
                }
                
                .onDelete(perform: deleteTask)

                
                
            }
            .padding()
        }
    }
    
    private func addTask() {
        let newTask = Task(title: newTaskTitle)
        modelContext.insert(newTask) // save it to the database
            newTaskTitle = ""
        
    }
    
    func toggleTask(_ task: Task) {
        task.isCompleted.toggle()
        }
    
//    deletes the task by swiping left
 private func deleteTask(at offsets: IndexSet) {
     for index in offsets {
         modelContext.delete(tasks[index])
     }
         
    }
}

#Preview {
    ContentView()
}
