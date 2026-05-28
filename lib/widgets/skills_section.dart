import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/responsive.dart';
import 'section_title.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  final List<String> skills = const [
    'Flutter',
    'Dart',
    'Kotlin',
    'Java',
    'BLoC',
    'Provider',
    'MVVM',
    'Firebase',
    'REST APIs',
    'WebSockets',
    'Bitrise',
    'Git',
    'Cursor',
    'Claude',
    'ChatGPT',
    'Gemini',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Column(
        children: [
          const SectionTitle(title: 'Tech Stack'),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: skills.map(
                  (skill) {
                return HoverSkillChip(
                  skill: skill,
                );
              },
            ).toList(),
          )
        ],
      ),
    );
  }
}
class HoverSkillChip extends StatefulWidget {

  final String skill;

  const HoverSkillChip({
    super.key,
    required this.skill,
  });

  @override
  State<HoverSkillChip> createState() =>
      _HoverSkillChipState();
}

class _HoverSkillChipState
    extends State<HoverSkillChip> {

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {

    return MouseRegion(
      cursor: SystemMouseCursors.click,

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
        duration: const Duration(milliseconds: 250),

        padding: EdgeInsets.symmetric(
          horizontal:
          Responsive.isMobile(context)
              ? 18
              : 24,
          vertical:
          Responsive.isMobile(context)
              ? 12
              : 14,
        ),

        decoration: BoxDecoration(

          color:AppColors.card,

          borderRadius: BorderRadius.circular(18),

          border: Border.all(
            color: isHovered
                ? Colors.cyanAccent
                .withOpacity(.35)
                :  Colors.cyanAccent.withOpacity(.3),
          ),

          boxShadow: isHovered
              ? [
            BoxShadow(
              color:Colors.cyanAccent
                  .withOpacity(.35),
              blurRadius: 18,
              spreadRadius: 1,
              offset: const Offset(0, 8),
            )
          ]
              : [],
        ),

        transform: Matrix4.identity()
          ..scale(isHovered ? 1.05 : 1),

        child: AnimatedDefaultTextStyle(
          duration:
          const Duration(milliseconds: 250),

          style: TextStyle(
            fontSize:
            Responsive.responsiveFont(
              context,
              desktop: 16,
              tablet: 15,
              mobile: 13,
            ),

            fontWeight: FontWeight.w600,

            color: isHovered
                ? Colors.white
                : AppColors.text,
          ),

          child: Text('#${widget.skill}'),
        ),
      ),
    );
  }
}