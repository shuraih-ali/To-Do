import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
 final Function(bool?)? onChanged;
 final Function(BuildContext)? deleteFunction;
 const ToDoTile({
    super.key,
    required this.taskName,
    required this.onChanged,
    required this.taskCompleted,
    required this.deleteFunction,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),

      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFunction, icon: Icons.delete,
            backgroundColor:Colors.red.shade400,
            borderRadius:BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: const Color.fromARGB(255, 104, 212, 255),
              ),
              Text(
                
                taskName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: 
                  taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                      decorationThickness: 2.0
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
