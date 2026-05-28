import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/constants/responsive.dart';

class ExperienceTimelineSection extends StatelessWidget {
  const ExperienceTimelineSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final experiences = [
      {
        "year": "September 2025 — January 2026",
        "company": "TintBytes.com",
        "role": "Lead Mobile Application Developer",

        "description":
            "Led end-to-end mobile application development from architecture to deployment. Leveraged AI-assisted development tools including Cursor, Claude, ChatGPT, and Gemini to accelerate development workflows, debugging, optimization, and engineering productivity.",

        "skills": [
          "Flutter",
          "AI Workflows",
          "Cursor",
          "CI/CD",
          "Architecture",
        ],
      },

      {
        "year": "December 2024 — April 2025",
        "company": "iPath Solutions, Ahmedabad",
        "role": "Senior Android & Flutter Developer",

        "description":
            "Worked in agile teams delivering scalable Android and Flutter applications. Improved legacy applications for compatibility with modern Android versions while enhancing performance, stability, and user experience through strategic refactoring and optimization.",

        "skills": ["Flutter", "Android", "Agile", "Optimization", "REST API"],
      },

      {
        "year": "September 2020 — December 2024",
        "company": "ADDV HealthTech Solutions, Ahmedabad",
        "role": "Senior Mobile Developer",

        "description":
            "Migrated multiple production applications from Java to Kotlin and later to Flutter. Implemented MVVM and BLoC architectures, integrated Bitrise CI/CD pipelines, mentored trainees, improved code quality through reviews and testing, and managed development workflows using JIRA and Bitbucket.",

        "skills": ["Flutter", "Kotlin", "BLoC", "MVVM", "Bitrise", "JIRA"],
      },

      {
        "year": "November 2017 — May 2020",
        "company": "Eleganz IT Solutions Pvt Ltd, Ahmedabad",
        "role": "Senior Android Developer",

        "description":
            "Built Android applications from scratch using Kotlin while mentoring junior developers on architecture and coding standards. Collaborated directly with clients to transform business requirements into scalable mobile solutions.",

        "skills": [
          "Android",
          "Kotlin",
          "Architecture",
          "Mentoring",
          "Client Communication",
        ],
      },

      {
        "year": "May 2016 — June 2017",
        "company": "TOPS Technology Pvt Ltd, Ahmedabad",
        "role": "Android Trainer",

        "description":
            "Conducted practical training sessions for students and interns on C, C++, Core Java, and Android development. Guided learners through real-world projects, coding practices, resume building, and interview preparation.",

        "skills": ["Android", "Java", "Training", "Mentorship", "C++"],
      },

      {
        "year": "January 2016 — April 2016",
        "company": "MSP IT Concept, Ahmedabad",
        "role": "Android Trainee",

        "description":
            "Completed professional Android development training and built advanced Android applications while strengthening foundational mobile development and problem-solving skills.",

        "skills": ["Android", "Java", "Mobile Apps", "Learning"],
      },
    ];

    return Container(
      width: double.infinity,
      color: Colors.black,

      child: Stack(
        children: [
          // GRID BACKGROUND
          Positioned.fill(child: CustomPaint(painter: GridPainter())),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) ? 20 : 80,
              vertical: Responsive.isMobile(context) ? 60 : 100,
            ),

            child: Column(
              children: [
                // TITLE
                Text(
                  "Where I've Worked",

                  textAlign: TextAlign.center,

                  style: GoogleFonts.poppins(
                    fontSize: Responsive.isMobile(context)
                        ? 34
                        : width < 1100
                        ? 52
                        : 68,

                    fontWeight: FontWeight.bold,

                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "From healthcare systems to enterprise mobile platforms.",

                  textAlign: TextAlign.center,

                  style: GoogleFonts.poppins(
                    fontSize: Responsive.isMobile(context) ? 15 : 20,

                    color: Colors.white70,
                  ),
                ),

                SizedBox(height: Responsive.isMobile(context) ? 60 : 100),

                // MOBILE
                if (Responsive.isMobile(context) ||
                    Responsive.isTablet(context))
                  Column(
                    children: List.generate(experiences.length, (index) {
                      final experience = experiences[index];

                      return MobileTimelineCard(
                        index: index,
                        isLast: index == experiences.length - 1,
                        experience: experience,
                      );
                    }),
                  )
                // DESKTOP
                else
                  Column(
                    children: List.generate(experiences.length, (index) {
                      final experience = experiences[index];

                      final isLeft = index % 2 == 0;

                      return DesktopTimelineRow(
                        index: index,
                        isLeft: isLeft,
                        experience: experience,
                        isLast: index == experiences.length - 1,
                      );
                    }),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DesktopTimelineRow extends StatelessWidget {
  final int index;
  final bool isLeft;
  final bool isLast;
  final Map experience;

  const DesktopTimelineRow({
    super.key,
    required this.index,
    required this.isLeft,
    required this.experience,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    // IntrinsicHeight forces the Row to size itself to the tallest child (the card)
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // Makes the center line stretch
        children: [
          // LEFT
          Expanded(
            child: isLeft
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    // Give space before the next item
                    child: TimelineCard(experience: experience, index: index),
                  )
                : const SizedBox(),
          ),

          // CENTER LINE
          SizedBox(
            width: 100,
            child: Column(
              children: [
                // TOP LINE (only hidden for the very first item's top part if desired,
                // but keeping it matches your original design style)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.cyanAccent.withOpacity(.4),
                  ),
                ),

                // DOT
                Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.cyanAccent, width: 3),
                  ),
                ),

                // BOTTOM LINE
                Expanded(
                  child: isLast
                      ? const SizedBox()
                      : Container(
                          width: 2,
                          color: Colors.cyanAccent.withOpacity(.4),
                        ),
                ),
              ],
            ),
          ),

          // RIGHT
          Expanded(
            child: !isLeft
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: TimelineCard(experience: experience, index: index),
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}

class MobileTimelineCard extends StatelessWidget {
  final int index;
  final bool isLast;
  final Map experience;

  const MobileTimelineCard({
    super.key,
    required this.index,
    required this.isLast,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // LINE
          Column(
            children: [
              Container(
                height: 20,
                width: 2,
                color: Colors.cyanAccent.withOpacity(.4),
              ),

              Container(
                height: 18,
                width: 18,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.cyanAccent, width: 3),
                ),
              ),

              Expanded(
                child: isLast
                    ? const SizedBox()
                    : Container(
                        width: 2,
                        color: Colors.cyanAccent.withOpacity(.4),
                      ),
              ),
            ],
          ),

          const SizedBox(width: 20),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: TimelineCard(experience: experience, index: index),
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineCard extends StatefulWidget {
  final Map experience;
  final int index;

  const TimelineCard({
    super.key,
    required this.experience,
    required this.index,
  });

  @override
  State<TimelineCard> createState() => _TimelineCardState();
}

class _TimelineCardState extends State<TimelineCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return MouseRegion(
          onEnter: (_) {
            setState(() {
              isHovered = true;
            });
          },

          onExit: (_) {
            setState(() {
              isHovered = false;
            });
          },

          child: AnimatedContainer(
            duration: const Duration(milliseconds: 350),

            transform: Matrix4.identity()..translate(0.0, isHovered ? -8 : 0),

            padding: EdgeInsets.all(Responsive.isMobile(context) ? 24 : 36),

            decoration: BoxDecoration(
              color: const Color(0xFF050505),

              borderRadius: BorderRadius.circular(32),

              border: Border.all(
                color: isHovered
                    ? Colors.cyanAccent.withOpacity(.5)
                    : Colors.white10,
              ),

              boxShadow: [
                BoxShadow(
                  color: isHovered
                      ? Colors.cyanAccent.withOpacity(.12)
                      : Colors.transparent,

                  blurRadius: 30,
                ),
              ],
            ),

            child:Wrap(
              runSpacing: 24,
              children: [

                // YEAR
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Icon(
                      Icons.work_outline_rounded,
                      size: 20,
                      color: Colors.cyanAccent,
                    ),

                    const SizedBox(width: 12),

                    Flexible(
                      child: Text(
                        widget.experience["year"],

                        softWrap: true,

                        style: GoogleFonts.poppins(
                          fontSize:
                          Responsive.isMobile(context)
                              ? 13
                              : 16,

                          color: Colors.cyanAccent,

                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                // TITLE
                SizedBox(
                  width: double.infinity,

                  child: Text(
                    widget.experience["company"],

                    softWrap: true,

                    style: GoogleFonts.poppins(
                      fontSize:
                      Responsive.isMobile(context)
                          ? 26
                          : 38,

                      fontWeight: FontWeight.bold,

                      color: Colors.white,
                    ),
                  ),
                ),

                // ROLE
                SizedBox(
                  width: double.infinity,

                  child: Text(
                    widget.experience["role"],

                    softWrap: true,

                    style: GoogleFonts.poppins(
                      fontSize:
                      Responsive.isMobile(context)
                          ? 16
                          : 22,

                      color: Colors.white70,
                    ),
                  ),
                ),

                // DESCRIPTION
                SizedBox(
                  width: double.infinity,

                  child: Text(
                    widget.experience["description"],

                    softWrap: true,

                    style: GoogleFonts.poppins(
                      fontSize:
                      Responsive.isMobile(context)
                          ? 14
                          : 18,

                      height: 1.8,

                      color: Colors.white70,
                    ),
                  ),
                ),

                // SKILLS
                Wrap(
                  spacing: 12,
                  runSpacing: 12,

                  children:
                  (widget.experience["skills"]
                  as List<String>)
                      .map((skill) {

                    return AnimatedContainer(

                      duration:
                      const Duration(
                        milliseconds: 300,
                      ),

                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),

                      decoration: BoxDecoration(

                        color: isHovered
                            ? Colors.cyanAccent
                            .withOpacity(.12)
                            : Colors.white
                            .withOpacity(.04),

                        borderRadius:
                        BorderRadius.circular(
                          30,
                        ),

                        border: Border.all(
                          color: isHovered
                              ? Colors.cyanAccent
                              .withOpacity(.3)
                              : Colors.white10,
                        ),
                      ),

                      child: Text(
                        skill,

                        style: GoogleFonts.poppins(
                          fontSize:
                          Responsive.isMobile(
                              context)
                              ? 11
                              : 14,

                          color: Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            )
          ),
        )
        .animate()
        .fade(delay: Duration(milliseconds: widget.index * 200))
        .slideY(begin: .15, delay: Duration(milliseconds: widget.index * 200));
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(.04)
      ..strokeWidth = 1;

    const spacing = 80.0;

    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
