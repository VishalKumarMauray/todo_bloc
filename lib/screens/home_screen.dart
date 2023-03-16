import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/cubit/todo_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final TodoCubit reference;

  @override
  void initState() {
    super.initState();
    reference = BlocProvider.of<TodoCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textInput = TextEditingController();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.grey[400],
          padding: const EdgeInsets.fromLTRB(32, 48, 32, 4),
          child: Column(
            children: [
              Text(
                'TO DO App',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type Something Here...',
                            hintStyle: Theme.of(context).textTheme.titleMedium,
                          ),
                          controller: textInput,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.black,
                    ),
                    child: IconButton(
                      onPressed: () {
                        reference.add(textInput.text);
                      },
                      icon: const Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              BlocBuilder<TodoCubit, TodoState>(
                builder: (context, state) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.tasks.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 70,
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.check_circle_outline_rounded,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text(
                                  state.tasks[index],
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  reference.remove(index);
                                },
                                icon: const Icon(Icons.delete_outline),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
