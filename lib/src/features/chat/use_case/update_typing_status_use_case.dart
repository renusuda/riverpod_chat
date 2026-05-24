import 'package:riverpod_chat/src/features/auth/data/auth_repository.dart';
import 'package:riverpod_chat/src/features/chat/data/typing_repository.dart';

class UpdateTypingStatusUseCase {
  const UpdateTypingStatusUseCase({
    required TypingRepository typingRepository,
    required AuthRepository authRepository,
  }) : _typingRepository = typingRepository,
       _authRepository = authRepository;

  final TypingRepository _typingRepository;
  final AuthRepository _authRepository;

  Future<void> execute({
    required String conversationId,
    required bool isTyping,
  }) {
    final currentUser = _authRepository.currentUser!;
    return _typingRepository.updateTypingStatus(
      conversationId: conversationId,
      userId: currentUser.uid,
      isTyping: isTyping,
    );
  }
}
