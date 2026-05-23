import 'package:riverpod_chat/src/features/auth/data/auth_repository.dart';
import 'package:riverpod_chat/src/features/chat/data/conversation_repository.dart';

class SendMessageUseCase {
  const SendMessageUseCase({
    required ConversationRepository conversationRepository,
    required AuthRepository authRepository,
  }) : _conversationRepository = conversationRepository,
       _authRepository = authRepository;

  final ConversationRepository _conversationRepository;
  final AuthRepository _authRepository;

  Future<void> execute({
    required String conversationId,
    required String text,
  }) {
    final currentUser = _authRepository.currentUser!;
    return _conversationRepository.sendMessage(
      conversationId: conversationId,
      senderId: currentUser.uid,
      text: text,
    );
  }
}
