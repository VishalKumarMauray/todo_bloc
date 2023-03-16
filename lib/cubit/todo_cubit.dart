import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> with HydratedMixin {
  TodoCubit() : super(TodoState(tasks: []));

  void add(String value) {
    print(state.tasks.length);
    state.tasks.add(value);
    emit(TodoState(tasks: state.tasks));
  }

  void remove(int index) {
    print(state.tasks.length);
    state.tasks.removeAt(index);
    emit(TodoState(tasks: state.tasks));
  }

  @override
  TodoState? fromJson(Map<String, dynamic> json) {
    return TodoState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TodoState state) {
    return state.toMap();
  }
}
