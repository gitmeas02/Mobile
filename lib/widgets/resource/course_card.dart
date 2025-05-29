import 'package:flutter/material.dart';
import 'course.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(course.image, height: 70),
            ),
            const SizedBox(height: 12),
            Text(course.title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Row(
              children: const [
                Icon(Icons.visibility_outlined, size: 14, color: Colors.grey),
                SizedBox(width: 4),
                Text('99 នាក់បានចុះឈ្មោះ', style: TextStyle(fontSize: 11)),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    '${course.professor}\nProfessor @ITC',
                    style: const TextStyle(fontSize: 10),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${course.price}', style: const TextStyle(fontWeight: FontWeight.bold)),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward, size: 16),
                  label: const Text('Start', style: TextStyle(fontSize: 12)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
