import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../models/task.dart';
import 'uploadFile.dart';

class TaskItem extends StatefulWidget {
  final Task task;

  TaskItem(this.task);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool isExpanded = false;
  bool isSubmitted = false;

  @override
  Widget build(BuildContext context) {

    DateTime now = DateTime.now();
    DateTime deadline = widget.task.dueDate;

    int remainingDays = deadline.difference(now).inDays;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return UploadFileScreen(
                onAssignmentSubmitted: (submitted) {
                  setState(() {
                    isSubmitted = submitted;
                  });
                },
              );
            },
          );
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.task.assignee,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.task.title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 2),
              Text(widget.task.id),
              const SizedBox(height: 2),
              ReadMoreText(
                widget.task.description,
                trimLines: 1,
                textAlign: TextAlign.justify,
                trimMode: TrimMode.Line,
                trimExpandedText: 'Show less',
                trimCollapsedText: 'Read More',
                lessStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                moreStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              isSubmitted
                  ? const Text(
                'Assignment submitted',
                style: TextStyle(color: Colors.green),
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Remaining days: $remainingDays',
                    style: const TextStyle(color: Colors.red),
                  ),
                  TextButton(
                    onPressed: () {

                      setState(() {
                        isSubmitted = true;
                      });
                    },
                    child: const Text('Submit Assignment'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



//ListTile(
//       title: Text(task.title),
//       subtitle: Text(task.description),
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           IconButton(
//             icon: Icon(Icons.check),
//             onPressed: () {
//               // Implement status update functionality if needed
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.delete),
//             onPressed: () {
//               // Implement delete functionality
//             },
//           ),
//         ],
//       ),
//     );