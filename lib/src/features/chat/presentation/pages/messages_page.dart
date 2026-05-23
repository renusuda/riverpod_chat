import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_chat/src/core_widgets/async_value_widget.dart';
import 'package:riverpod_chat/src/core_widgets/avatar.dart';
import 'package:riverpod_chat/src/features/chat/domain/chat_message.dart';
import 'package:riverpod_chat/src/features/chat/presentation/providers/messages_provider.dart';
import 'package:riverpod_chat/src/features/chat/presentation/widgets/message_bubble.dart';
import 'package:riverpod_chat/src/features/chat/presentation/widgets/message_input_bar.dart';
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

    final messagesAsyncValue = ref.watch(
      messagesProvider(conversationId: conversationId),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: switch (messagesAsyncValue) {
          AsyncValue(:final value?) => Row(
            children: [
              Avatar(
                avatarUrl: value.partnerAvatarUrl,
              ),
              SizedBox(width: spacing.p12),
              Expanded(
                child: Text(
                  value.partnerName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          _ => const SizedBox.shrink(),
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: AsyncValueWidget(
                asyncValue: messagesAsyncValue,
                data: (chatMessages) => _MessageList(
                  chatMessages: chatMessages,
                ),
              ),
            ),
            MessageInputBar(conversationId: conversationId),
          ],
        ),
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
      reverse: true,
      padding: EdgeInsets.all(context.spacing.p16),
      itemCount: chatMessages.messages.length,
      itemBuilder: (context, index) => MessageBubble(
        message: chatMessages.messages[index],
        partnerAvatarUrl: chatMessages.partnerAvatarUrl,
      ),
    );
  }
}
