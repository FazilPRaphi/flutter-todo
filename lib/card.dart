import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key,required this.title,required this.onDelete});

  final String title;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, color: Colors.deepOrange),
            
                ),
                
              ],
            ),
            const Expanded(
              child: SizedBox(width: 20),
            ),
            IconButton(onPressed:onDelete,
             icon: Icon(Icons.done)),
          ],
          
        ),
      ),
    );
  }
}
