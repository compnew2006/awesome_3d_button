import 'package:flutter/material.dart';

import 'package:awesome_3d_button/src/state_notifier.dart';

class Awesome3DButton extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  final double thickness;

  final Color buttonColor;
  final Widget buttonChild;

  final GestureTapCallback onPressed;

  const Awesome3DButton({
    this.buttonHeight = 40,
    this.buttonWidth = 160,
    this.thickness = 5,
    this.buttonColor = const Color(0xffa7337a),
    required this.buttonChild,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var buttonStateNotifier = ButtonStateNotifier(thickness);
    return GestureDetector(
      onTap: onPressed,
      onTapDown: (_) => buttonStateNotifier.triggerButtonDown(),
      onTapUp: (_) => buttonStateNotifier.triggerButtonUp(),
      child: MouseRegion(
        onHover: (_) => buttonStateNotifier.triggerOnMouseHover(),
        onExit: (_) => buttonStateNotifier.triggerOnMouseExit(),
        child: Container(
          width: buttonWidth,
          height: buttonHeight + thickness,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  width: buttonWidth,
                  height: buttonHeight,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: buttonStateNotifier,
                builder: (ctx, value) {
                  return AnimatedPositioned(
                    top: buttonStateNotifier.topPosition,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.bounceOut,
                    child: AnimatedContainer(
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.bounceOut,
                      width: buttonWidth,
                      height: buttonHeight,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, buttonStateNotifier.xElevation),
                          )
                        ],
                      ),
                      child: buttonChild,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
