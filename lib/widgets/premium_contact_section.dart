import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/constants/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class PremiumContactSection extends StatelessWidget {
  const PremiumContactSection({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      color: const Color(0xFFF2EFE8),

      padding: EdgeInsets.symmetric(
        horizontal: width < 600 ? 24 : 80,
        vertical: width < 600 ? 60 : 100,
      ),

      child: Responsive.isDesktop(context)
          ? const DesktopContactUI()
          : const MobileContactUI(),
    );
  }
}

class DesktopContactUI extends StatelessWidget {
  const DesktopContactUI({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // LEFT
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              RichText(
                text: TextSpan(
                  children: [

                    TextSpan(
                      text: "Want to\n",
                      style:
                      GoogleFonts.cormorantGaramond(
                        fontSize: 120,
                        height: .9,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),

                    TextSpan(
                      text: "start\n",
                      style:
                      GoogleFonts.cormorantGaramond(
                        fontSize: 120,
                        height: .9,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),

                    TextSpan(
                      text: "a new\n",
                      style:
                      GoogleFonts.cormorantGaramond(
                        fontSize: 120,
                        height: .9,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),

                    TextSpan(
                      text: "project?",
                      style:
                      GoogleFonts.cormorantGaramond(
                        fontSize: 120,
                        height: .9,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          )
              .animate()
              .fade(duration: 700.ms)
              .slideX(begin: -.1),
        ),

        const SizedBox(width: 100),

        // RIGHT
        const Expanded(
          flex: 4,
          child: ContactRightSection(),
        ),
      ],
    );
  }
}

class MobileContactUI extends StatelessWidget {
  const MobileContactUI({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Text(
          "Want to\nstart\na new\nproject?",

          style:
          GoogleFonts.cormorantGaramond(
            fontSize: 64,
            height: .9,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 30),

        Text(
          "Or just say hello.",

          style:
          GoogleFonts.cormorantGaramond(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 60),

        const ContactRightSection(),
      ],
    )
        .animate()
        .fade(duration: 700.ms)
        .slideY(begin: .1);
  }
}

class ContactRightSection extends StatelessWidget {
  const ContactRightSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        // EMAIL
        InkWell(
          onTap: () async {

            final uri = Uri.parse(
              "mailto:ritunambath@gmail.com",
            );

            await launchUrl(uri);
          },

          child: Text(
            "ritunambath@gmail.com",

            style:
            GoogleFonts.cormorantGaramond(
              fontSize:
              Responsive.isMobile(context) ? 36 : 56,

              decoration:
              TextDecoration.underline,

              color: Colors.black,

              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        const SizedBox(height: 50),
        // SOCIALS
        Wrap(
          spacing: 40,
          runSpacing: 24,

          children: [

            socialItem(
              icon: FontAwesomeIcons.linkedinIn,
              title: "LinkedIn",
              url: "https://www.linkedin.com/in/ritu-nambath-67123856/"
            ),

            socialItem(
              icon: FontAwesomeIcons.instagram,
              title: "Instagram",
                url: "https://www.instagram.com/startwithandroid/"
            ),

            socialItem(
              icon: Icons.code,
              title: "GitHub",
                url: "https://www.linkedin.com/in/ritu-nambath-67123856/"
            ),
          ],
        ),

        // INPUT
      ],
    )
        .animate()
        .fade(delay: 300.ms)
        .slideX(begin: .1);
  }

  Widget socialItem({
    required IconData icon,
    required String title,
    required String url,
  }) {

    return InkWell(
      onTap: () async {

        final Uri uri = Uri.parse(url);

        if (await canLaunchUrl(uri)) {
          await launchUrl(
            uri,
            mode: LaunchMode.externalApplication,
          );
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
      
          FaIcon(
            icon,
            size: 22,
            color: Colors.black,
          ),
      
          const SizedBox(width: 12),
      
          Text(
            title,
      
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}