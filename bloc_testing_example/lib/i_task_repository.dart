import 'task.dart';

abstract class ITaskRepository {
  Future<List<Task>> fetchAllTasks();

  Future<List<Task>> fetchUrgentTasks();
}
