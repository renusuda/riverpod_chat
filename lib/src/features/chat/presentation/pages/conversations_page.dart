import 'package:flutter/material.dart';
import 'package:riverpod_chat/src/features/chat/domain/conversation.dart';
import 'package:riverpod_chat/src/features/chat/presentation/widgets/conversation_list_tile.dart';

final _mockConversations = <Conversation>[
  Conversation(
    partnerName: 'Tanaka Misaki',
    lastMessage: '週末が待ちきれない！',
    updatedAt: DateTime.now().subtract(const Duration(minutes: 5)),
  ),
  Conversation(
    partnerName: 'Suzuki Ren',
    lastMessage: '了解、またね',
    updatedAt: DateTime.now().subtract(const Duration(minutes: 20)),
  ),
  Conversation(
    partnerName: 'Sato Aoi',
    lastMessage: '写真を送りました',
    updatedAt: DateTime.now().subtract(const Duration(hours: 1)),
  ),
];

class ConversationsPage extends StatelessWidget {
  const ConversationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: _mockConversations.length,
        itemBuilder: (context, index) => ConversationListTile(
          conversation: _mockConversations[index],
        ),
      ),
    );
  }
}
