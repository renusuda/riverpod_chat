import 'package:riverpod_chat/src/features/auth/data/auth_repository.dart';
import 'package:riverpod_chat/src/features/chat/data/conversation_repository.dart';
import 'package:riverpod_chat/src/features/chat/domain/chat_message.dart';
import 'package:riverpod_chat/src/features/profile/data/profile_repository.dart';

class WatchMessagesUseCase {
  const WatchMessagesUseCase({
    required ConversationRepository conversationRepository,
    required AuthRepository authRepository,
    required ProfileRepository profileRepository,
  }) : _conversationRepository = conversationRepository,
       _authRepository = authRepository,
       _profileRepository = profileRepository;

  final ConversationRepository _conversationRepository;
  final AuthRepository _authRepository;
  final ProfileRepository _profileRepository;

  Stream<ChatMessage> execute({required String conversationId}) async* {
    final currentUser = _authRepository.currentUser!;

    final conversation = await _conversationRepository.fetchConversation(
      id: conversationId,
      currentUserId: currentUser.uid,
    );
    final partnerProfile = await _profileRepository.fetchProfile(
      uid: conversation.partnerId,
    );

    yield* _conversationRepository
        .watchMessages(
          conversationId: conversationId,
          currentUserId: currentUser.uid,
        )
        .map(
          (messages) => ChatMessage(
            conversationId: conversation.id,
            partnerId: conversation.partnerId,
            partnerName: partnerProfile.displayName,
            partnerAvatarUrl: partnerProfile.avatarUrl,
            messages: messages,
          ),
        );
  }
}
