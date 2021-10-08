import 'package:equatable/equatable.dart';

class Task extends Equatable {
  const Task({
    required this.id,
    required this.title,
    this.isUrgent = false,
  });

  final String id;
  final String title;
  final bool isUrgent;

  @override
  List<Object> get props => [id, title, isUrgent];
}
