
// import 'package:flutter_test/flutter_test.dart'; 
// import 'package:layout_task/features/domain/entities/task.dart'; 
// import 'package:layout_task/features/domain/repositories/task_repository.dart'; 
// import 'package:layout_task/features/domain/usecases/create_task_usecase.dart'; 
// import 'package:mockito/mockito.dart'; 


// class MockTaskRepository extends Mock implements TaskRepository {}

// void main(){
//   late CreateTaskUseCase createTaskUseCase; 
//   late MockTaskRepository mockTaskRepository;  

//   setUp((){
//     taskRepository = MockTaskRepository();
//     createTaskUseCase = CreateTaskUseCase(taskRepository:mockTaskRepository);
//   });  


//   test("create task use case", () async {
//     final task = Task(
//       title: "title",
//       // description: "description",
//       deadline: "deadline",
//     );

//     when(mockTaskRepository.createTask(task)).thenAnswer((_) async => task);

//     final result = await createTaskUseCase.createTask(task);

//     expect(result, task);
//   });
// }