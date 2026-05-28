import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturedSolutionsSection extends StatelessWidget {
  const FeaturedSolutionsSection({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    final solutions = [

      {
        "title": "Telemedicine\nPlatform",
        "subtitle":
        "Built scalable healthcare applications with video consultations, appointment systems, and secure communication workflows.",
        "category": "Healthcare System",
        "icon": Icons.monitor_heart_outlined,
        "tech": [
          "Flutter",
          "BLoC",
          "OpenTok",
          "REST API",
        ],
      },

      {
        "title": "Enterprise\nAudit System",
        "subtitle":
        "Developed operational auditing and compliance management systems with real-time issue tracking and reporting.",
        "category": "Enterprise Solution",
        "icon": Icons.fact_check_outlined,
        "tech": [
          "Flutter",
          "Firebase",
          "CI/CD",
          "Bitrise",
        ],
      },

      {
        "title": "Mobility\nAssessment App",
        "subtitle":
        "Created health and movement analysis systems to evaluate activity patterns and performance metrics.",
        "category": "Health Analytics",
        "icon": Icons.accessibility_new_rounded,
        "tech": [
          "Flutter",
          "Analytics",
          "Tracking",
          "Charts",
        ],
      },

      {
        "title": "Bluetooth Sensor\nIntegration",
        "subtitle":
        "Integrated Bluetooth SDK devices for real-time monitoring and hardware communication systems.",
        "category": "IoT Integration",
        "icon": Icons.bluetooth_connected_rounded,
        "tech": [
          "Bluetooth",
          "SDK",
          "Native",
          "Flutter",
        ],
      },
    ];

    return Container(
      width: double.infinity,
      color: const Color(0xFFF7F7F7),

      padding: EdgeInsets.symmetric(
        horizontal: width < 600 ? 20 : 60,
        vertical: width < 600 ? 60 : 100,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // TOP SECTION
          width > 1000
              ? Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              Expanded(
                child: leftTitle(context),
              ),

              const SizedBox(width: 80),

              Expanded(
                child: Padding(
                  padding:
                  const EdgeInsets.only(
                    top: 50,
                  ),
                  child: description(context),
                ),
              ),
            ],
          )
              : Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              leftTitle(context),

              const SizedBox(height: 30),

              description(context),
            ],
          ),

          SizedBox(
            height: width < 600 ? 50 : 80,
          ),

          // GRID
          LayoutBuilder(
            builder: (context, constraints) {

              int crossAxisCount = 2;

              if (constraints.maxWidth < 700) {
                crossAxisCount = 1;
              }

              return GridView.builder(
                itemCount: solutions.length,

                shrinkWrap: true,

                physics:
                const NeverScrollableScrollPhysics(),

                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(

                  crossAxisCount: crossAxisCount,

                  crossAxisSpacing:
                  width < 600 ? 20 : 30,

                  mainAxisSpacing:
                  width < 600 ? 20 : 30,

                  childAspectRatio:
                  width < 600
                      ? .78
                      : width < 1100
                      ? .82
                      : .95,
                ),

                itemBuilder: (context, index) {

                  final solution =
                  solutions[index];

                  return SolutionCard(
                    index: index,
                    title:
                    solution["title"]
                    as String,
                    subtitle:
                    solution["subtitle"]
                    as String,
                    category:
                    solution["category"]
                    as String,
                    icon:
                    solution["icon"]
                    as IconData,
                    tech:
                    solution["tech"]
                    as List<String>,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget leftTitle(BuildContext context) {

    final width =
        MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [

        Row(
          children: [

            Container(
              width: 40,
              height: 1.5,
              color: Colors.black,
            ),

            const SizedBox(width: 10),

            Text(
              "FEATURED SOLUTIONS",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                color: Colors.black87,
                fontSize:
                width < 600 ? 12 : 14,
              ),
            ),
          ],
        ),

        const SizedBox(height: 30),

        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,

          child: Text(
            "ENTERPRISE\nMOBILE\nSOLUTIONS",
            style: GoogleFonts.poppins(
              fontSize:
              width < 600
                  ? 42
                  : width < 1100
                  ? 58
                  : 82,

              fontWeight:
              FontWeight.bold,

              height: 1.05,

              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget description(BuildContext context) {

    final width =
        MediaQuery.of(context).size.width;

    return Text(
      "Real-world cross-platform systems built with Flutter, scalable architecture, backend integrations, and modern engineering workflows.",

      style: GoogleFonts.poppins(
        fontSize:
        width < 600 ? 15 : 20,

        height: 1.9,

        color: Colors.black87,
      ),
    );
  }
}

class SolutionCard extends StatefulWidget {

  final int index;
  final String title;
  final String subtitle;
  final String category;
  final IconData icon;
  final List<String> tech;

  const SolutionCard({
    super.key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.icon,
    required this.tech,
  });

  @override
  State<SolutionCard> createState() =>
      _SolutionCardState();
}

class _SolutionCardState
    extends State<SolutionCard> {

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {

    final width =
        MediaQuery.of(context).size.width;

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

        duration:
        const Duration(milliseconds: 350),

        curve: Curves.easeInOut,

        transform: Matrix4.identity()
          ..translate(
            0.0,
            isHovered ? -10 : 0,
          ),

        padding: EdgeInsets.all(
          width < 600 ? 22 : 38,
        ),

        decoration: BoxDecoration(

          color: isHovered
              ? Colors.black
              : Colors.white,

          borderRadius:
          BorderRadius.circular(32),

          border: Border.all(
            color: isHovered
                ? Colors.black
                : Colors.black12,
          ),

          boxShadow: [

            BoxShadow(
              color: Colors.black
                  .withOpacity(
                isHovered ? .16 : .05,
              ),

              blurRadius:
              isHovered ? 35 : 20,

              offset: Offset(
                0,
                isHovered ? 20 : 10,
              ),
            )
          ],
        ),

        child: SingleChildScrollView(

          physics:
          const NeverScrollableScrollPhysics(),

          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              // TOP
              Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
                children: [

                  Flexible(
                    child: Container(
                      padding:
                      const EdgeInsets
                          .symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),

                      decoration:
                      BoxDecoration(
                        color: isHovered
                            ? Colors.white
                            .withOpacity(.1)
                            : const Color(
                          0xFFF3F3F3,
                        ),

                        borderRadius:
                        BorderRadius
                            .circular(
                          30,
                        ),
                      ),

                      child: Text(
                        widget.category,

                        overflow:
                        TextOverflow
                            .ellipsis,

                        style:
                        GoogleFonts
                            .poppins(
                          fontSize:
                          width < 600
                              ? 11
                              : 13,

                          fontWeight:
                          FontWeight
                              .w500,

                          color: isHovered
                              ? Colors
                              .white70
                              : Colors
                              .black87,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  AnimatedContainer(

                    duration:
                    const Duration(
                      milliseconds:
                      300,
                    ),

                    height:
                    width < 600
                        ? 56
                        : 70,

                    width:
                    width < 600
                        ? 56
                        : 70,

                    decoration:
                    BoxDecoration(
                      color: isHovered
                          ? Colors.white
                          .withOpacity(.1)
                          : Colors.black,

                      borderRadius:
                      BorderRadius
                          .circular(
                        22,
                      ),
                    ),

                    child: Icon(
                      widget.icon,
                      color:
                      Colors.white,
                      size:
                      width < 600
                          ? 26
                          : 34,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height:
                width < 600
                    ? 30
                    : 40,
              ),

              // TITLE
              Text(
                widget.title,

                style:
                GoogleFonts.poppins(

                  fontSize:
                  width < 600
                      ? 28
                      : width < 1100
                      ? 34
                      : 42,

                  fontWeight:
                  FontWeight.bold,

                  height: 1.15,

                  color: isHovered
                      ? Colors.white
                      : Colors.black,
                ),
              ),

              const SizedBox(height: 20),

              // SUBTITLE
              Text(
                widget.subtitle,

                style:
                GoogleFonts.poppins(

                  fontSize:
                  width < 600
                      ? 14
                      : 17,

                  height: 1.9,

                  color: isHovered
                      ? Colors.white70
                      : Colors.black87,
                ),
              ),

              SizedBox(
                height:
                width < 600
                    ? 25
                    : 35,
              ),

              // TECH STACK
              Wrap(
                spacing: 10,
                runSpacing: 10,

                children:
                widget.tech.map((tech) {

                  return AnimatedContainer(

                    duration:
                    const Duration(
                      milliseconds:
                      300,
                    ),

                    padding:
                    EdgeInsets.symmetric(
                      horizontal:
                      width < 600
                          ? 10
                          : 14,

                      vertical:
                      width < 600
                          ? 8
                          : 10,
                    ),

                    decoration:
                    BoxDecoration(

                      color: isHovered
                          ? Colors.white
                          .withOpacity(
                        .08,
                      )
                          : const Color(
                        0xFFF4F4F4,
                      ),

                      borderRadius:
                      BorderRadius
                          .circular(
                        20,
                      ),
                    ),

                    child: Text(
                      tech,

                      style:
                      GoogleFonts
                          .poppins(

                        fontSize:
                        width < 600
                            ? 10
                            : 13,

                        color: isHovered
                            ? Colors.white
                            : Colors
                            .black87,
                      ),
                    ),
                  );
                }).toList(),
              ),

              SizedBox(
                height:
                width < 600
                    ? 30
                    : 40,
              ),

            ],
          ),
        ),
      ),
    )
        .animate()
        .fade(
      delay: Duration(
        milliseconds:
        150 * widget.index,
      ),
    )
        .slideY(
      begin: .15,
      delay: Duration(
        milliseconds:
        150 * widget.index,
      ),
    );
  }
}