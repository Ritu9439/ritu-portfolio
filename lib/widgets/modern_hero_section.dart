import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/constants/colors.dart';

class ModernHeroSection extends StatelessWidget {
  final VoidCallback onViewProjects;

  const ModernHeroSection({
    super.key,
    required this.onViewProjects,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      color: AppColors.greyBackground,
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 40,
      ),
      child: Column(
        children: [

          // TOP NAV MINI
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              // LOGO
              Container(
                padding: const EdgeInsets.only(bottom: 4),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                ),
                child: Text(
                  "it's me",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 50),

          // MAIN SECTION
          width > 1000
              ? Row(
            children: [

              // LEFT
              Expanded(
                flex: 5,
                child: HeroLeftSection(
                  onViewProjects: onViewProjects,
                ),
              ),

              const SizedBox(width: 30),

              // RIGHT
              const Expanded(
                flex: 4,
                child: HeroRightSection(),
              ),
            ],
          )
              : Column(
            children: [

              HeroLeftSection(
                onViewProjects: onViewProjects,
              ),

              const SizedBox(height: 50),

              const HeroRightSection(),
            ],
          ),
        ],
      ),
    );
  }

  Widget topMenu(String title) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),

              const SizedBox(width: 8),

              const Icon(
                Icons.arrow_outward_rounded,
                size: 18,
                color: Colors.black,
              ),
            ],
          ),

          const SizedBox(height: 6),

          Container(
            height: 1,
            width: 100,
            color: Colors.black26,
          ),
        ],
      ),
    );
  }
}

class HeroLeftSection extends StatelessWidget {
  final VoidCallback onViewProjects;

  const HeroLeftSection({
    super.key,
    required this.onViewProjects,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // WAVE
        Text(
          '👋',
          style: GoogleFonts.poppins(
            fontSize: 34,
          ),
        ),


        // TITLE
        RichText(
          text: TextSpan(
            children: [

              TextSpan(
                text: 'Hello! ',
                style: GoogleFonts.poppins(
                  fontSize: 82,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),

              TextSpan(
                text: 'I’m Ritu',
                style: GoogleFonts.poppins(
                  fontSize: 82,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),

        // ROLE
        Row(
          children: [

            Container(
              width: 120,
              height: 1.2,
              color: Colors.black45,
            ),

            const SizedBox(width: 20),

            Text(
              'Flutter Developer',
              style: GoogleFonts.poppins(
                fontSize: 30,
                color: Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            ),

            const SizedBox(width: 18),

            const Icon(
              Icons.auto_awesome,
              size: 30,
              color: Colors.black,
            )
          ],
        ),

        const SizedBox(height: 45),

        // DESCRIPTION
        SizedBox(
          width: 700,
          child: Text(
            'Experienced Flutter and Android Developer with 7+ years of expertise in building scalable mobile applications, modern UI experiences, and production-ready cross-platform solutions.',
            style: GoogleFonts.poppins(
              fontSize: 20,
              height: 1.8,
              color: Colors.black87,
            ),
          ),
        ),

        const SizedBox(height: 50),

        // POINTS
        heroPoint('Cross-platform mobile expert'),
        heroPoint('Production-ready scalable apps'),
        heroPoint('Clean architecture & AI workflows'),

        const SizedBox(height: 60),

        // BUTTONS
        Wrap(
          spacing: 30,
          runSpacing: 20,
          children: [

            // PROJECT BUTTON
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(60),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.15),
                    blurRadius: 25,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: onViewProjects,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 38,
                    vertical: 28,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                child: Text(
                  "View Projects",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // DOWNLOAD BUTTON
            InkWell(
              onTap: () async {
                const resumeUrl = 'assets/resume.pdf';

                html.AnchorElement(href: resumeUrl)
                  ..setAttribute(
                    'download',
                    'Ritu_Nambath_Resume.pdf',
                  )
                  ..click();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 18,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Text(
                      'Download CV',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(width: 10),

                    const Icon(
                      Icons.arrow_downward_rounded,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    ).animate().fade(duration: 700.ms).slideX(begin: -.1);
  }

  Widget heroPoint(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [

          const Icon(
            Icons.check_rounded,
            color: Colors.black,
          ),

          const SizedBox(width: 16),

          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.black87,
            ),
          )
        ],
      ),
    );
  }
}

class HeroRightSection extends StatelessWidget {
  const HeroRightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [

        // GRADIENT
        Positioned(
          top: 0,
          left: 50,
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.pink.withOpacity(.45),
                  Colors.blue.withOpacity(.35),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        // IMAGE
        Container(
          height: 700,
          width: 520,
          child: Image.asset(
            'assets/profile.png',
            fit: BoxFit.cover,
          ),
        ),

        // FLOATING CARD
        Positioned(
          right: 0,
          top: 20,
          child: floatingCard(
            title: "Flutter Expert",
            subtitle: "7+ Years Experience",
          ),
        ),

        Positioned(
          left: 0,
          bottom: 200,
          child: floatingCard(
            title: "15+ Apps",
            subtitle: "Published Projects",
          ),
        ),
      ],
    ).animate().fade(duration: 800.ms).slideX(begin: .1);
  }

  Widget floatingCard({
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.52),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.52),
            blurRadius: 20,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            subtitle,
            style: GoogleFonts.poppins(
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}