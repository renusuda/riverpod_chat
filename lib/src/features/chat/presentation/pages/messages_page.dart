import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_chat/src/core_widgets/avatar.dart';
import 'package:riverpod_chat/src/features/chat/domain/chat_message.dart';
import 'package:riverpod_chat/src/features/chat/presentation/providers/messages_provider.dart';
import 'package:riverpod_chat/src/features/chat/presentation/widgets/partner_message_bubble.dart';
import 'package:riverpod_chat/src/theme/app_theme.dart';

class MessagesPage extends ConsumerWidget {
  const MessagesPage({
    required this.conversationId,
    super.key,
  });

  final String conversationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spacing = context.spacing;

    final messagesAsync = ref.watch(
      messagesProvider(conversationId: conversationId),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: messagesAsync.maybeWhen(
          data: (chatMessages) => Row(
            children: [
              Avatar(
                avatarUrl: chatMessages.partnerAvatarUrl,
              ),
              SizedBox(width: spacing.p12),
              Expanded(
                child: Text(
                  chatMessages.partnerName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          orElse: () => const SizedBox.shrink(),
        ),
      ),
      body: messagesAsync.when(
        data: (chatMessages) => _MessageList(
          chatMessages: chatMessages,
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}

class _MessageList extends StatelessWidget {
  const _MessageList({
    required this.chatMessages,
  });

  final ChatMessage chatMessages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(context.spacing.p16),
      itemCount: chatMessages.messages.length,
      itemBuilder: (context, index) => PartnerMessageBubble(
        message: chatMessages.messages[index],
        avatarUrl: chatMessages.partnerAvatarUrl,
      ),
    );
  }
}
