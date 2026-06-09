import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle? style;
  final TextStyle? actionStyle;
  final TextOverflow overflow;

  const ExpandableText({
    super.key,
    required this.text,
    this.maxLines = 4,
    this.style,
    this.actionStyle,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;
  bool isOverflowing = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(
            text: widget.text,
            style: widget.style,
          ),
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        isOverflowing = textPainter.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              maxLines: isExpanded ? null : widget.maxLines,
              overflow:
              isExpanded ? TextOverflow.visible : widget.overflow,
              style: widget.style,
            ),
            if (isOverflowing) ...[
              const SizedBox(height: 4),
              InkWell(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? 'View Less' : 'View More',
                  style: widget.actionStyle ??
                      const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}