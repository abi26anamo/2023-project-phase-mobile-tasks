import 'task.dart';

class TaskManager{
  List<Task> tasks = [];
  // Add a new task
  void addTask(Task task){
    tasks.add(task);
  }

  // Get task by title
  Task? getTaskByTitle (String title){
    for (var task in tasks){
      if (task.title == title){
        return task;
      }
    }
    return null;
  }

  // view all the tasks

  void viewAllTasks(){
    for (var task in tasks){
      print(task.title);
    }
  }

  // view all the completed tasks
  void viewCompletedTasks(){
    for (var task in tasks){
      if (task.taskStatus == status.completed){
        print(task.title);
      }
    }
  }

  // view all the pending tasks
  void viewPendingTasks(){
    for (var task in tasks){
      if (task.taskStatus == status.pending){
        print(task.title);
      }
    }
  }

  // Edit a task 
  void editTask(Task task, String newTitle, String newDescription, DateTime newDueDate){
    task.title = newTitle;
    task.description = newDescription;
    task.dueDate = newDueDate;
  }

//delete a task
  void deleteTask(Task task){
    tasks.remove(task);
  }

}