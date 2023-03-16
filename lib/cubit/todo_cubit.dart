import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

// part 'todo_state.dart';

class TodoCubit extends Cubit<List<String>> {
  TodoCubit() : super([]);

  void add(String value) {
    emit([...state, value]);
    print(state.length);
  }

  void remove(int index) {
    state.removeAt(index);
    emit([...state]);
    print(state.length);
  }
}
