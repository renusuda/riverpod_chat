import 'package:riverpod_chat/src/features/chat/data/remote/conversation_remote_data_source.dart';
import 'package:riverpod_chat/src/features/chat/domain/conversation.dart';

class FakeConversationRemoteDataSource implements ConversationRemoteDataSource {
  @override
  Future<List<Conversation>> fetchConversations() async {
    return [
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
  }
}
