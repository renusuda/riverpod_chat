import 'package:riverpod_chat/src/features/auth/data/auth_repository.dart';
import 'package:riverpod_chat/src/features/chat/data/conversation_repository.dart';
import 'package:riverpod_chat/src/features/chat/domain/conversation.dart';
import 'package:riverpod_chat/src/features/profile/data/profile_repository.dart';

class WatchConversationsUseCase {
  const WatchConversationsUseCase({
    required ConversationRepository conversationRepository,
    required AuthRepository authRepository,
    required ProfileRepository profileRepository,
  }) : _conversationRepository = conversationRepository,
       _authRepository = authRepository,
       _profileRepository = profileRepository;

  final ConversationRepository _conversationRepository;
  final AuthRepository _authRepository;
  final ProfileRepository _profileRepository;

  Stream<List<Conversation>> execute() async* {
    final currentUser = _authRepository.currentUser!;
    yield* _conversationRepository
        .watchConversations(currentUserId: currentUser.uid)
        .asyncMap(
          (metadatas) => Future.wait(
            metadatas.map((metadata) async {
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
          ),
        );
  }
}
