import 'package:bloc_testing_example/mock_task_repository.dart';
import 'package:bloc_testing_example/task_cubit.dart';
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

    tearDown(() {
      taskCubit.close();
    });
  });
}
