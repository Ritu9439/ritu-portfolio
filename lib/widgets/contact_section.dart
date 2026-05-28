import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
      child: Column(
        children: [
          const SectionTitle(title: 'Contact Me'),
          const Text(
            'Available for Flutter, Mobile App Development and Cross Platform Opportunities',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.subText,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Column(
              children: [
                Text(
                  'ritunambath@gmail.com',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                Text(
                  '+91 6359338882',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                Text(
                  'Ahmedabad, India',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}