import 'package:flutter/material.dart';
import 'package:tp4_flutter/theme/colors.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String article;
  final String profileImage;
  final String name;
  final String status;
  final int students;
  final String level;
  final int price;
  final String location;

  const CategoryCard({
    super.key,
    required this.image,
    required this.article,
    required this.profileImage,
    required this.name,
    required this.status,
    required this.students,
    required this.level,
    required this.price,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163.66,
      height: 275.15,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          Image.asset(image, width: 101, height: 97.8),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Microsoft word',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.wifi, size: 8.51),
                      const SizedBox(width: 4),
                      Text(level),
                    ],
                  ),
                  const SizedBox(width: 4),
                  Row(
                    children: [
                      const Icon(Icons.people, size: 8.51),
                      const SizedBox(width: 4),
                      Text('$students នាក់'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 7.8),
              // button
              Container(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 34.55677795410156,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF8F8F8),
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      // splashFactory: NoSplash.splashFactory,
                      // elevation: ,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6.8),
                      child: Row(
                        children: [
                          // Avatar
                          Container(
                            width: 27.56,
                            height: 28.04,
                            decoration: BoxDecoration(
                              border: Border.all(width: 3, color: Colors.white),
                              borderRadius: BorderRadius.circular(999),
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(profileImage),
                              radius: 16,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Name and Location
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // name
                                  Text(
                                    name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  // status and location
                                  Row(
                                    children: [
                                      Text(
                                        status,
                                        style: const TextStyle(
                                          color: Colors.black12,
                                          fontSize: 10,
                                        ),
                                      ),
                                      const SizedBox(width: 1.1),
                                      Text(
                                        '@ $location',
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // price
              const SizedBox(height: 6.3),
              // price
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                      const Text(
                        '\$',
                        style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '$price',
                        style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        ),
                      ),
                      ],
                    ),
                    SizedBox(
                      height: 26.17,
                      width: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonColor4,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding:
                              EdgeInsets
                                  .zero, // Add this to remove default padding
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Start',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.iconColor,
                              ),
                            ),
                            const Icon(Icons.arrow_forward, size: 12),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
