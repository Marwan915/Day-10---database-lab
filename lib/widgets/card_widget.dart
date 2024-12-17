import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final int? id;
  final String? name;
  final int? age;
  final double? salary;
  const CardWidget({
    super.key,
    required this.age,
    required this.id,
    required this.name,
    required this.salary,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('$id )'),
                const SizedBox(width: 8),
                Text(name!),
              ],
            ),
            Text(age.toString()),
            Text(salary.toString()),
          ],
        ),
      ),
    );
  }
}
