import 'package:flutter/material.dart';
import 'package:todo/card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> todos = [
    "Go for a walk",
    "Study Flutter",
    "Buy groceries",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[300],
        title: Text("Todo", style: TextStyle(color: Colors.white)),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return TodoCard(
                      onDelete: (){
                        setState(() {
                          todos.removeAt(index);
                        });
                      },
                      title: todos[index],
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
                        ElevatedButton(
                          onPressed: () {
                            final text = controller.text.trim();
                            if (text.isNotEmpty) {
                              setState(() {
                                todos.add(text);
                              });
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
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
