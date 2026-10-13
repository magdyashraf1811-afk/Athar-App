import 'dart:ui';

import 'package:athaar_app/l10n/app_localizations.dart';
import 'package:athaar_app/utils/app_image.dart';
import 'package:athaar_app/utils/app_style.dart';
import 'package:flutter/material.dart';

class SlideToStartButton extends StatefulWidget {
  final VoidCallback onSlideComplete;

  const SlideToStartButton({super.key, required this.onSlideComplete});

  @override
  State<SlideToStartButton> createState() => _SlideToStartButtonState();
}

class _SlideToStartButtonState extends State<SlideToStartButton> {
  double dragPosition = 0;
  bool isCompleted = false;
  final double buttonSize = 50;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 280),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),

        child: LayoutBuilder(
          builder: (context, constraints) {
            final double maxDrag = (constraints.maxWidth - buttonSize - 8)
                .clamp(0.0, double.infinity);
            dragPosition = dragPosition.clamp(0.0, maxDrag);

            return ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: 70,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.30),
                      width: 1,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Center(
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 150),
                          opacity: dragPosition > maxDrag * 0.5 ? 0 : 1,
                          child: Text(
                            AppLocalizations.of(context)!.getStarted,
                            style: isDark
                                ? AppStyle.bold16White
                                : AppStyle.bold16Black,
                          ),
                        ),
                      ),

                      Positioned(
                        left: dragPosition,
                        child: GestureDetector(
                          onHorizontalDragUpdate: isCompleted
                              ? null
                              : (details) {
                                  setState(() {
                                    dragPosition =
                                        (dragPosition + details.delta.dx).clamp(
                                          0.0,
                                          maxDrag,
                                        );
                                  });
                                },
                          onHorizontalDragEnd: isCompleted
                              ? null
                              : (_) {
                                  if (dragPosition >= maxDrag * 0.85) {
                                    setState(() {
                                      dragPosition = maxDrag;
                                      isCompleted = true;
                                    });

                                    widget.onSlideComplete();
                                  } else {
                                    setState(() {
                                      dragPosition = 0;
                                    });
                                  }
                                },
                          child: Container(
                            width: buttonSize,
                            height: buttonSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [],
                            ),
                            child: Center(
                              child: Image.asset(
                                AppImage.getStartIcon,
                                width: 60,
                                height: 60,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
