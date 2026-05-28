import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class ModernAboutSection extends StatelessWidget {
  const ModernAboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      color: const Color(0xFFF7F7F7),
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 80,
      ),
      child: width > 1000
          ? const Row(
        children: [
          Expanded(
            flex: 5,
            child: AboutLeftSection(),
          ),
          SizedBox(width: 40),
          Expanded(
            flex: 4,
            child: AboutRightSection(),
          ),
        ],
      )
          : const Column(
        children: [
          AboutLeftSection(),
          SizedBox(height: 50),
          AboutRightSection(),
        ],
      ),
    );
  }
}

class AboutLeftSection extends StatelessWidget {
  const AboutLeftSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // SMALL TITLE
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            "it's me",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ),

        const SizedBox(height: 40),

        // MAIN TITLE
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Hello! ',
                style: GoogleFonts.poppins(
                  fontSize: 72,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: 'I’m Ritu',
                style: GoogleFonts.poppins(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // ROLE
        Row(
          children: [

            Container(
              width: 80,
              height: 1,
              color: Colors.black54,
            ),

            const SizedBox(width: 20),

            Text(
              'Flutter Developer',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),

            const SizedBox(width: 15),

            const Icon(
              Icons.auto_awesome,
              size: 28,
            ),
          ],
        ),

        const SizedBox(height: 40),

        // DESCRIPTION
        SizedBox(
          width: 700,
          child: Text(
            'Experienced Flutter and Android Developer with 7+ years of expertise in building scalable mobile applications. Passionate about clean architecture, modern UI experiences, AI-assisted development workflows, and solving real-world problems through technology.',
            style: GoogleFonts.poppins(
              fontSize: 20,
              height: 1.8,
              color: Colors.black87,
            ),
          ),
        ),

        const SizedBox(height: 40),

        // POINTS
        const AboutBullet(
          text: 'Cross-platform mobile expert',
        ),

        const AboutBullet(
          text: 'Scalable production-ready applications',
        ),

        const AboutBullet(
          text: 'Flutter, AI & clean architecture enthusiast',
        ),

        const SizedBox(height: 60),

        // BUTTONS
        Wrap(
          spacing: 25,
          runSpacing: 20,
          children: [

            // CONTACT BUTTON
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.15),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  )
                ],
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 26,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  "Let's Talk",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // DOWNLOAD CV
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
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
        ),
      ],
    );
  }
}

class AboutRightSection extends StatelessWidget {
  const AboutRightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [

        // GRADIENT BLUR
        Container(
          height: 450,
          width: 450,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                Colors.pink.withOpacity(.5),
                Colors.blue.withOpacity(.3),
                Colors.transparent,
              ],
            ),
          ),
        ),

        // IMAGE
        Container(
          height: 650,
          width: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              'assets/profile.png',
              fit: BoxFit.cover,
            ),
          ),
        ),

        // FLOATING CARD
        Positioned(
          top: 50,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.9),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.08),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  'Flutter Expert',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  '7+ Years Experience',
                  style: GoogleFonts.poppins(
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AboutBullet extends StatelessWidget {
  final String text;

  const AboutBullet({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [

          const Icon(
            Icons.check_rounded,
            color: Colors.black,
          ),

          const SizedBox(width: 15),

          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}