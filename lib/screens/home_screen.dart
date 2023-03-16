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
    // TODO: implement initState
    super.initState();
    reference = BlocProvider.of<TodoCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textInput = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("TO DO's"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textInput,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    reference.add(textInput.text);
                    print(textInput.text);
                    // setState(() {});
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 16),
            BlocBuilder<TodoCubit, List<String>>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(8),
                        color: Colors.amber,
                        child: Row(
                          children: [
                            Text(state[index]),
                            IconButton(
                                onPressed: () {
                                  reference.remove(index);
                                },
                                icon: const Icon(Icons.delete))
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
    );
  }
}
