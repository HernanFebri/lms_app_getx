import 'package:flutter/material.dart';
import 'package:lms_app_getx/app/utils/app_color.dart';

class MyCourseCard extends StatelessWidget {
  final String title;
  final String? price;
  final double? rating;
  final String imageUrl;
  final String? meetings;

  const MyCourseCard({
    Key? key,
    required this.title,
    this.price,
    this.rating,
    required this.imageUrl,
    this.meetings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          // Gambar di sebelah kiri
          ClipRRect(
            borderRadius:
                const BorderRadius.horizontal(left: Radius.circular(15.0)),
            child: Image.asset(
              imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  if (price != null)
                    Text(
                      price!,
                      style: const TextStyle(
                          fontSize: 14, color: AppColors.primary),
                    ),
                  if (meetings != null)
                    Text(
                      meetings!,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  const SizedBox(height: 5),
                  if (rating != null)
                    Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.yellow),
                        Text('$rating', style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
