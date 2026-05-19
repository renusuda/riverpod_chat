import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_chat/src/features/chat/presentation/providers/conversations_provider.dart';
import 'package:riverpod_chat/src/features/chat/presentation/widgets/conversation_list_tile.dart';
import 'package:riverpod_chat/src/routing/app_route.dart';

class ConversationsPage extends ConsumerWidget {
  const ConversationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversationsAsync = ref.watch(conversationsProvider);
    return SafeArea(
      child: conversationsAsync.when(
        data: (conversations) => ListView.builder(
          itemCount: conversations.length,
          itemBuilder: (context, index) => ConversationListTile(
            conversation: conversations[index],
            onTap: () => context.pushNamed(AppRoute.messages.name),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}
