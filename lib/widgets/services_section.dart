import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/responsive.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      color: const Color(0xFFF5F5F5),
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // TOP AREA
          width > 1100
              ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              // LEFT TITLE
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        "MY SERVICES ?",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Text(
                    "WHAT I’M\nOFFERING",
                    style: GoogleFonts.poppins(
                      fontSize: Responsive.responsiveFont(
                        context,
                        desktop: 72,
                        tablet: 56,
                        mobile: 38,
                      ),
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              // DESCRIPTION
              SizedBox(
                width: 450,
                child: Text(
                  "Building scalable Flutter applications with modern UI/UX, clean architecture, API integrations, and production-ready mobile experiences.",
                  style: GoogleFonts.poppins(
                    fontSize: Responsive.responsiveFont(
                      context,
                      desktop: 18,
                      tablet: 16,
                      mobile: 14,
                    ),
                    height: 1.8,
                    color: Colors.black87,
                  ),
                ),
              ),

              // BUTTON
              blackButton(context),
            ],
          )
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    "MY SERVICES ?",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Text(
                "WHAT I’M\nOFFERING",
                style: GoogleFonts.poppins(
                  fontSize: width < 600 ? 42 : 60,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: 600,
                child: Text(
                  "Building scalable Flutter applications with modern UI/UX, clean architecture, API integrations, and production-ready mobile experiences.",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    height: 1.8,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              blackButton(context),
            ],
          ),

          const SizedBox(height: 80),

          // SERVICE CARDS
          LayoutBuilder(
            builder: (context, constraints) {

              int crossAxisCount = 3;

              if (constraints.maxWidth < 700) {
                crossAxisCount = 1;
              } else if (constraints.maxWidth < 1100) {
                crossAxisCount = 2;
              }

              return GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                childAspectRatio: 1,
                children: const [

                  ServiceCard(
                    icon: Icons.phone_android_rounded,
                    title: "FLUTTER\nAPP DEVELOPMENT",
                    subtitle:
                    "Building scalable, production-ready cross-platform mobile applications with Flutter and clean architecture.",
                  ),

                  ServiceCard(
                    icon: Icons.design_services_outlined,
                    title: "MODERN\nUI/UX DESIGN",
                    subtitle:
                    "Designing elegant, responsive, and user-focused mobile experiences with modern UI principles.",
                  ),

                  ServiceCard(
                    icon: Icons.api_rounded,
                    title: "API &\nBACKEND INTEGRATION",
                    subtitle:
                    "Integrating REST APIs, Firebase, real-time features, and backend systems for seamless app experiences.",
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget blackButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(50),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 26,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          "ALL SERVICES",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: Responsive.responsiveFont(
              context,
              desktop: 16,
              tablet: 15,
              mobile: 13,
            ),
          ),
        ),
      ),
    );
  }
}

class ServiceCard extends StatefulWidget {

  final IconData icon;
  final String title;
  final String subtitle;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {

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
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.all(
          16,
        ),
        decoration: BoxDecoration(
          color: isHovered ? Colors.black : Colors.transparent,
          border: Border.all(
            color: Colors.black26,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Icon(
              widget.icon,
              size: 52,
              color: isHovered
                  ? Colors.white
                  : Colors.black,
            ),

            const SizedBox(height: 40),

            Text(
              widget.title,
              style: GoogleFonts.poppins(
                fontSize: Responsive.responsiveFont(
                  context,
                  desktop: 34,
                  tablet: 28,
                  mobile: 22,
                ),
                fontWeight: FontWeight.w600,
                color: isHovered
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            const SizedBox(height: 24),

            // SUBTITLE
            Text(
              widget.subtitle,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: GoogleFonts.poppins(
                fontSize: Responsive.responsiveFont(
                  context,
                  desktop: 16,
                  tablet: 15,
                  mobile: 13,
                ),
                color: isHovered
                    ? Colors.white70
                    : Colors.black87,
              ),
            ),

          ],
        ),
      ),
    );
  }
}