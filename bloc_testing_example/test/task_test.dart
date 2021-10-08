import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_testing_example/mock_task_repository.dart';
import 'package:bloc_testing_example/task.dart';
import 'package:bloc_testing_example/task_cubit.dart';
import 'package:bloc_testing_example/task_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TaskCubit test', () {
    late TaskCubit taskCubit;
    MockTaskRepository mockTaskRepository;

    setUp(() {
      EquatableConfig.stringify = true;
      mockTaskRepository = MockTaskRepository();
      taskCubit = TaskCubit(mockTaskRepository);
    });

    blocTest<TaskCubit, TaskState>(
      'emits [TaskLoadInProgress, TaskLoadSuccess] states for'
      'successful task loads',
      build: () => taskCubit,
      act: (cubit) => cubit.getAllTasks(),
      expect: () => [
        TaskLoadInProgress(),
        TaskLoadSuccess(mockTasks),
      ],
    );

    blocTest<TaskCubit, TaskState>(
      'emits [TaskLoadInProgress, TaskLoadSuccess] with correct urgent tasks',
      build: () => taskCubit,
      act: (cubit) => cubit.getUrgentTasks(),
      expect: () => [
        TaskLoadInProgress(),
        TaskLoadSuccess(const [
          Task(id: '4', title: 'Task 4', isUrgent: true),
          Task(id: '7', title: 'Task 7', isUrgent: true),
          Task(id: '9', title: 'Task 9', isUrgent: true),
          Task(id: '10', title: 'Task 10', isUrgent: true),
        ]),
      ],
    );

    tearDown(() {
      taskCubit.close();
    });
  });
}
