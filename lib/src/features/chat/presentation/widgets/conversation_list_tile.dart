import 'package:flutter/material.dart';
import 'package:riverpod_chat/src/core_widgets/avatar.dart';
import 'package:riverpod_chat/src/features/chat/domain/conversation.dart';
import 'package:riverpod_chat/src/theme/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class ConversationListTile extends StatelessWidget {
  const ConversationListTile({
    required this.conversation,
    super.key,
  });

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: spacing.p16,
        vertical: spacing.p4,
      ),
      leading: Avatar(avatarUrl: conversation.partnerAvatarUrl),
      title: _TitleRow(
        partnerName: conversation.partnerName,
        updatedAt: conversation.updatedAt,
      ),
      subtitle: _LastMessagePreview(lastMessage: conversation.lastMessage),
    );
  }
}

class _TitleRow extends StatelessWidget {
  const _TitleRow({
    required this.partnerName,
    required this.updatedAt,
  });

  final String partnerName;
  final DateTime updatedAt;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Row(
      children: [
        Expanded(
          child: Text(
            partnerName,
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          timeago.format(updatedAt, locale: 'ja'),
          style: textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
        ),
      ],
    );
  }
}

class _LastMessagePreview extends StatelessWidget {
  const _LastMessagePreview({required this.lastMessage});

  final String lastMessage;

  @override
  Widget build(BuildContext context) {
    return Text(
      lastMessage,
      style: context.textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
