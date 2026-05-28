import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../constants/responsive.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: Responsive.responsiveFont(
            context,
            desktop: 72,
            tablet: 56,
            mobile: 38,
          ),
          fontWeight: FontWeight.bold,
          height: 1.1,
          color: Colors.white,
        ),
      ),
    );
  }
}
