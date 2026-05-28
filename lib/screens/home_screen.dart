import 'package:flutter/material.dart';
import '../widgets/about_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/featured_solutions_section.dart';
import '../widgets/modern_hero_section.dart';
import '../widgets/premium_contact_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/services_section.dart';
import '../widgets/skills_section.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static final projectsKey = GlobalKey();

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            ModernHeroSection(
              onViewProjects: () {
                Scrollable.ensureVisible(
                  projectsKey.currentContext!,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
            ),
            const ServicesSection(),
            const SkillsSection(),

            FeaturedSolutionsSection(key: projectsKey),

            const ExperienceTimelineSection(),
            const PremiumContactSection(),
          ],
        ),
      ),
    );
  }
}