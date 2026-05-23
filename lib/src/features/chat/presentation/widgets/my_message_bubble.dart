import 'package:flutter/material.dart';
import 'package:riverpod_chat/src/extensions/date_time_extension.dart';
import 'package:riverpod_chat/src/features/chat/domain/message.dart';
import 'package:riverpod_chat/src/theme/app_theme.dart';

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({
    required this.message,
    super.key,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.only(bottom: spacing.p12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: spacing.p16,
                    vertical: spacing.p12,
                  ),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 0.6,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF2D67),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(4),
                      bottomLeft: Radius.circular(22),
                      bottomRight: Radius.circular(22),
                    ),
                  ),
                  child: Text(
                    message.text,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: spacing.p4),
                Text(
                  message.createdAt.messageTime,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.55),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
