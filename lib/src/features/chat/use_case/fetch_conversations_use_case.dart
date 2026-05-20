import 'package:riverpod_chat/src/features/auth/data/auth_repository.dart';
import 'package:riverpod_chat/src/features/chat/data/conversation_repository.dart';
import 'package:riverpod_chat/src/features/chat/domain/conversation.dart';
import 'package:riverpod_chat/src/features/profile/data/profile_repository.dart';

class FetchConversationsUseCase {
  const FetchConversationsUseCase({
    required ConversationRepository conversationRepository,
    required AuthRepository authRepository,
    required ProfileRepository profileRepository,
  }) : _conversationRepository = conversationRepository,
       _authRepository = authRepository,
       _profileRepository = profileRepository;

  final ConversationRepository _conversationRepository;
  final AuthRepository _authRepository;
  final ProfileRepository _profileRepository;

  Future<List<Conversation>> execute() async {
    final currentUser = _authRepository.currentUser!;

    final conversationMetadatas = await _conversationRepository
        .fetchConversations(
          currentUserId: currentUser.uid,
        );

    return Future.wait(
      conversationMetadatas.map((metadata) async {
        final partnerProfile = await _profileRepository.fetchProfile(
          uid: metadata.partnerId,
        );

        return Conversation(
          id: metadata.id,
          partnerName: partnerProfile.displayName,
          lastMessage: metadata.lastMessage,
          updatedAt: metadata.updatedAt,
          partnerAvatarUrl: partnerProfile.avatarUrl,
        );
      }),
    );
  }
}
