// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'todo_cubit.dart';

class TodoState {
  List<String> tasks;
  TodoState({required this.tasks});

  @override
  String toString() => '$tasks';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tasks': tasks,
    };
  }

  factory TodoState.fromMap(Map<String, dynamic> map) {
    return TodoState(
        tasks: List<String>.from(
      (map['tasks'] as List<String>),
    ));
  }

  String toJson() => json.encode(toMap());

  factory TodoState.fromJson(String source) =>
      TodoState.fromMap(json.decode(source) as Map<String, dynamic>);
}
