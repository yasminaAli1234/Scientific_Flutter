import 'package:flutter/material.dart';



class MaterialPage1 extends StatefulWidget {
  @override
  State<MaterialPage1> createState() => _MaterialPage1State();
}

class _MaterialPage1State extends State<MaterialPage1> {
  final List<Materials> mat = [
    Materials(
      title: 'Session 1',
      subject: 'Maths',
      description: 'Rational Numbers assignment, Very important for your next exam...',
      dueDate: '18 Sep',
      submitted: true,
      daysLeft: null,
    ),
    Materials(
      title: 'Session 2',
      subject: 'Maths',
      description: 'Whole Numbers, Fraction, Decimals, Percentage, Ratio, Time, Measurement, Geometry, Data Analysis, Algebra, Speed ...',
      dueDate: '18 Sep',
      submitted: false,
      daysLeft: 1,
    ),
    Materials(
      title: 'Session 3',
      subject: 'Science',
      description: 'Crop Production & Mgt. Very important for your next exam...',
      dueDate: '20 Sep',
      submitted: false,
      daysLeft: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: mat.length,
        itemBuilder: (context, index) {
          return AssignmentCard(materials: mat[index]);
        },
      ),
    );
  }
}

class AssignmentCard extends StatelessWidget {
  final Materials materials;

  AssignmentCard({required this.materials});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: ListTile(
        title: Text(materials.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(materials.subject),
            Text(materials.description),
            Text('Due: ${materials.dueDate}'),
            if (materials.daysLeft != null)
              Text(
                '${materials.daysLeft} Days Left',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (materials.submitted)
              Text(
                'Submitted',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
class Materials {
  final String title;
  final String subject;
  final String description;
  final String dueDate;
  final bool submitted;
  final int? daysLeft;

  Materials({
    required this.title,
    required this.subject,
    required this.description,
    required this.dueDate,
    required this.submitted,
    this.daysLeft,
  });
}
