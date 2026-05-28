import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/colors.dart';
import 'dart:html' as html;
class HeroSection extends StatelessWidget {
  final VoidCallback onViewProjects;

  const HeroSection({
    super.key,
    required this.onViewProjects,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: width > 900
          ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: HeroText(
              onViewProjects: onViewProjects,
            ),
          ),          const SizedBox(width: 50),
          Expanded(child: HeroImage()),
        ],
      )
          : Column(
        children: [
          HeroText(
            onViewProjects: onViewProjects,
          ),
          const SizedBox(height: 40),
          const HeroImage(),
        ],
      ),
    );
  }
}
class HeroText extends StatelessWidget {
  final VoidCallback onViewProjects;

  const HeroText({
    super.key,
    required this.onViewProjects,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const Text(
      'Hi, I’m',
      style: TextStyle(fontSize: 28),
    ),
    const SizedBox(height: 10),
    const Text(
    'Ritu Nambath',
    style: TextStyle(
    fontSize: 54,
    fontWeight: FontWeight.bold,
    ),
    ).animate().fade().slideX(),
    const SizedBox(height: 20),
    AnimatedTextKit(
    repeatForever: true,
    animatedTexts: [
    TyperAnimatedText(
    'Lead Flutter Developer',
    textStyle: const TextStyle(
    fontSize: 28,
    color: AppColors.primary,
    fontWeight: FontWeight.w600,
    ),
    ),
    TyperAnimatedText(
    'Cross Platform Engineer',
    textStyle: const TextStyle(
    fontSize: 28,
    color: AppColors.primary,
    fontWeight: FontWeight.w600,
    ),
    ),
    ],
    ),
    const SizedBox(height: 30),
    const Text(
    'Building scalable, modern, and production-ready mobile applications with Flutter and clean architecture.',
    style: TextStyle(
    fontSize: 18,
    height: 1.7,
    color: AppColors.subText,
    ),
    ),
    const SizedBox(height: 40),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [

            // VIEW PROJECTS BUTTON
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.secondary,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(.35),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ElevatedButton.icon(
                  onPressed: onViewProjects,
                  icon: const Icon(
                    Icons.rocket_launch_rounded,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'View Projects',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 22,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
            ),

            // DOWNLOAD RESUME BUTTON
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.card.withOpacity(.7),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(.3),
                  ),
                ),
                child: OutlinedButton.icon(
                  onPressed: () async {
                    const resumeUrl = 'assets/resume.pdf';

                    html.AnchorElement(href: resumeUrl)
                      ..setAttribute(
                        'download',
                        'Ritu_Nambath_Resume.pdf',
                      )
                      ..click();
                  },
                  icon: const Icon(
                    Icons.download_rounded,
                    color: AppColors.primary,
                  ),
                  label: const Text(
                    'Download Resume',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide.none,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 22,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 420,
        width: 420,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(.25),
              blurRadius: 35,
              spreadRadius: 8,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            'assets/profile.png',
            fit: BoxFit.cover,
          ),
        ),
      )
          .animate(
        onPlay: (controller) =>
            controller.repeat(reverse: true),
      )
          .moveY(
        begin: 0,
        end: -12,
        duration: 2.seconds,
      ),
    );
  }
}