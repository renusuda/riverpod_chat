import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
    final textTheme = context.textTheme;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: spacing.p16,
        vertical: spacing.p4,
      ),
      leading: _ConversationAvatar(avatarUrl: conversation.partnerAvatarUrl),
      title: Text(
        conversation.partnerName,
        style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: _LastMessagePreview(lastMessage: conversation.lastMessage),
      trailing: Text(
        timeago.format(conversation.updatedAt, locale: 'ja'),
        style: textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
      ),
      titleAlignment: ListTileTitleAlignment.top,
    );
  }
}

class _ConversationAvatar extends StatelessWidget {
  const _ConversationAvatar({required this.avatarUrl});

  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: avatarUrl != null
          ? CachedNetworkImage(
              imageUrl: avatarUrl!,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Image.asset(
                'assets/default_profile.png',
                fit: BoxFit.cover,
              ),
            )
          : Image.asset(
              'assets/default_profile.png',
              fit: BoxFit.cover,
            ),
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
