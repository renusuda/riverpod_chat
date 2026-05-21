import 'package:flutter/material.dart';
import 'package:riverpod_chat/src/core_widgets/avatar.dart';
import 'package:riverpod_chat/src/extensions/date_time_extension.dart';
import 'package:riverpod_chat/src/features/chat/domain/message.dart';
import 'package:riverpod_chat/src/theme/app_theme.dart';

class PartnerMessageBubble extends StatelessWidget {
  const PartnerMessageBubble({
    required this.message,
    required this.avatarUrl,
    super.key,
  });

  final Message message;
  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.only(bottom: spacing.p12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Avatar(
            avatarUrl: avatarUrl,
          ),
          SizedBox(width: spacing.p12),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: spacing.p4),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: spacing.p16,
                    vertical: spacing.p12,
                  ),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 0.6,
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
                  child: Text(
                    message.text,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface,
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
