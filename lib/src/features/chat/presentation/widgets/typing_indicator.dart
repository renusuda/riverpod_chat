import 'dart:async' show unawaited;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpod_chat/src/core_widgets/avatar.dart';
import 'package:riverpod_chat/src/theme/app_theme.dart';

class TypingIndicator extends HookWidget {
  const TypingIndicator({
    required this.partnerAvatarUrl,
    super.key,
  });

  final String? partnerAvatarUrl;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    final controller = useAnimationController(
      duration: const Duration(milliseconds: 1250),
    );

    useEffect(() {
      unawaited(controller.repeat());
      return null;
    }, [controller]);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Avatar(avatarUrl: partnerAvatarUrl),
        SizedBox(width: spacing.p12),
        Padding(
          padding: EdgeInsets.only(top: spacing.p4),
          child: _AnimatedDots(controller: controller),
        ),
      ],
    );
  }
}

class _AnimatedDots extends StatelessWidget {
  const _AnimatedDots({required this.controller});

  final AnimationController controller;

  static const _windows = [
    (0.00, 0.45),
    (0.20, 0.65),
    (0.40, 0.85),
  ];

  static double _waveOffset(double t) => 1.5 * sin(t * 2 * pi);

  double _offset(int i) {
    final (start, end) = _windows[i];
    final localT = ((controller.value - start) / (end - start)).clamp(0.0, 1.0);
    return _waveOffset(localT);
  }

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: spacing.p16,
        vertical: spacing.p12,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFF1F2F5),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(22),
          bottomLeft: Radius.circular(22),
          bottomRight: Radius.circular(22),
        ),
      ),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) => Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (i) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Transform.translate(
                offset: Offset(0, _offset(i)),
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
