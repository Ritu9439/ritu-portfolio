import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'Body Roundness Calculator',
        'desc': 'Health analytics app for body fat distribution analysis.'
      },
      {
        'title': 'Fall Risk Assessment',
        'desc': 'Mobility and activity monitoring application.'
      },
      {
        'title': 'HEALTHYA',
        'desc': 'Remote consultation and telemedicine platform.'
      },
      {
        'title': 'PASAUDIT',
        'desc': 'Operational auditing and compliance platform.'
      },
    ];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Column(
        children: [
          const SectionTitle(title: 'Featured Projects'),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.2,
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];

              return Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [
                            AppColors.primary,
                            AppColors.secondary,
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      project['title']!,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      project['desc']!,
                      style: const TextStyle(
                        color: AppColors.subText,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}