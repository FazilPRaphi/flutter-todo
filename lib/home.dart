import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/card.dart';
import 'package:todo/models/todo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final Box<Todo> todoBox;

  @override
  void initState() {
    super.initState();
    todoBox = Hive.box<Todo>('todos');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[300],
        title: const Text('Todo', style: TextStyle(color: Colors.white)),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder<Box<Todo>>( 
                valueListenable: todoBox.listenable(),
                builder: (context, box, _) {
                  return ListView.builder(
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      final todo = box.getAt(index);
                      if (todo == null) {
                        return const SizedBox.shrink();
                      }

                      return TodoCard(
                        onDelete: () {
                          todoBox.deleteAt(index);
                        },
                        title: todo.title,
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final controller = TextEditingController();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Add Todo'),
                      content: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          labelText: 'Todo text',
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(style: ElevatedButton.styleFrom(
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                        ),
                          onPressed: () {
                            final text = controller.text.trim();
                            if (text.isNotEmpty) {
                              todoBox.add(Todo(title: text));
                            }
                            Navigator.pop(context);
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Icon(Icons.add,color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
}
