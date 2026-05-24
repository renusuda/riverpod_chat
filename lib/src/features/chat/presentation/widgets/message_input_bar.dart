import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_chat/src/features/chat/presentation/providers/messages_provider.dart';
import 'package:riverpod_chat/src/features/chat/presentation/providers/typing_status_provider.dart';
import 'package:riverpod_chat/src/theme/app_theme.dart';

class MessageInputBar extends HookConsumerWidget {
  const MessageInputBar({
    required this.conversationId,
    required this.partnerId,
    super.key,
  });

  final String conversationId;
  final String partnerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spacing = context.spacing;
    final textTheme = context.textTheme;

    final controller = useTextEditingController();
    final textValue = useListenable(controller).text;
    final canSend = textValue.trim().isNotEmpty;

    useEffect(() {
      unawaited(
        ref
            .read(
              typingStatusProvider(
                conversationId: conversationId,
                partnerId: partnerId,
              ).notifier,
            )
            .updateIsTyping(isTyping: textValue.trim().isNotEmpty),
      );
      return null;
    }, [textValue]);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: spacing.p16,
        vertical: spacing.p12,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.10),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: controller,
                minLines: 1,
                maxLines: 4,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(
                  hintText: 'メッセージを入力',
                  hintStyle: textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: spacing.p16,
                    vertical: spacing.p12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: spacing.p8),
          IconButton.filled(
            onPressed: canSend
                ? () async {
                    final text = controller.text.trim();
                    controller.clear();
                    await ref
                        .read(
                          messagesProvider(
                            conversationId: conversationId,
                          ).notifier,
                        )
                        .send(text);
                  }
                : null,
            style: IconButton.styleFrom(
              backgroundColor: const Color(0xFFFF2D67),
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
