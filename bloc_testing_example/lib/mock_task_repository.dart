import 'i_task_repository.dart';
import 'task.dart';

const mockTasks = <Task>[
  Task(id: '1', title: 'Task 1'),
  Task(id: '2', title: 'Task 2'),
  Task(id: '3', title: 'Task 3'),
  Task(id: '4', title: 'Task 4', isUrgent: true),
  Task(id: '5', title: 'Task 5'),
  Task(id: '6', title: 'Task 6'),
  Task(id: '7', title: 'Task 7', isUrgent: true),
  Task(id: '8', title: 'Task 8'),
  Task(id: '9', title: 'Task 9', isUrgent: true),
  Task(id: '10', title: 'Task 10', isUrgent: true),
];

class MockTaskRepository implements ITaskRepository {
  @override
  Future<List<Task>> fetchAllTasks() async =>
      Future.delayed(const Duration(seconds: 2), () => [...mockTasks]);

  @override
  Future<List<Task>> fetchUrgentTasks() async {
    await Future.delayed(const Duration(seconds: 2));

    final urgentTasks =
        List<Task>.from(mockTasks.where((task) => task.isUrgent));

    return urgentTasks;
  }
}
