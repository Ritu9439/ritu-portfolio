import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Column(
        children: [
          const SectionTitle(title: 'About Me'),
          const SizedBox(height: 30),
          const Text(
            'Experienced Flutter and Android Developer with 7+ years of expertise in building scalable mobile applications. Skilled in Flutter, Dart, Kotlin, clean architecture, REST APIs, CI/CD pipelines, and AI-assisted development workflows.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              height: 1.8,
              color: AppColors.subText,
            ),
          ),
          const SizedBox(height: 50),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: const [
              StatCard(title: '7+', subtitle: 'Years Experience'),
              StatCard(title: '15+', subtitle: 'Apps Delivered'),
              StatCard(title: '4+', subtitle: 'Flutter Years'),
              StatCard(title: '100%', subtitle: 'Passion'),
            ],
          )
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const StatCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 18,
              color: AppColors.subText,
            ),
          ),
        ],
      ),
    );
  }
}