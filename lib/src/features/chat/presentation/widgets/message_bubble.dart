import 'package:flutter/material.dart';
import 'package:riverpod_chat/src/core_widgets/avatar.dart';
import 'package:riverpod_chat/src/extensions/date_time_extension.dart';
import 'package:riverpod_chat/src/features/chat/domain/message.dart';
import 'package:riverpod_chat/src/theme/app_theme.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    required this.message,
    required this.partnerAvatarUrl,
    super.key,
  });

  final Message message;
  final String? partnerAvatarUrl;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Padding(
      padding: EdgeInsets.only(bottom: spacing.p12),
      child: Row(
        mainAxisAlignment: message.isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isMe) ...[
            Avatar(avatarUrl: partnerAvatarUrl),
            SizedBox(width: spacing.p12),
          ],
          Flexible(
            child: _BubbleContent(message: message),
          ),
        ],
      ),
    );
  }
}

class _BubbleContent extends StatelessWidget {
  const _BubbleContent({
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Column(
      crossAxisAlignment: message.isMe
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        if (!message.isMe) SizedBox(height: spacing.p4),
        _BubbleBody(message: message),
        SizedBox(height: spacing.p4),
        _MessageTime(message: message),
      ],
    );
  }
}

class _BubbleBody extends StatelessWidget {
  const _BubbleBody({
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: spacing.p16,
        vertical: spacing.p12,
      ),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width * 0.6,
      ),
      decoration: BoxDecoration(
        color: message.isMe ? const Color(0xFFFF2D67) : const Color(0xFFF1F2F5),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(message.isMe ? 22 : 4),
          topRight: Radius.circular(message.isMe ? 4 : 22),
          bottomLeft: const Radius.circular(22),
          bottomRight: const Radius.circular(22),
        ),
      ),
      child: Text(
        message.text,
        style: context.textTheme.bodyMedium?.copyWith(
          color: message.isMe ? Colors.white : colorScheme.onSurface,
        ),
      ),
    );
  }
}

class _MessageTime extends StatelessWidget {
  const _MessageTime({
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Text(
      message.createdAt.messageTime,
      style: context.textTheme.bodySmall?.copyWith(
        color: colorScheme.onSurface.withValues(alpha: 0.55),
      ),
    );
  }
}
