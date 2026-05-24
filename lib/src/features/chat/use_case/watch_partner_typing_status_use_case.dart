import 'package:riverpod_chat/src/features/chat/data/typing_repository.dart';

class WatchPartnerTypingStatusUseCase {
  const WatchPartnerTypingStatusUseCase({
    required TypingRepository typingRepository,
  }) : _typingRepository = typingRepository;

  final TypingRepository _typingRepository;

  Stream<bool> execute({
    required String conversationId,
    required String partnerId,
  }) {
    return _typingRepository.watchPartnerTypingStatus(
      conversationId: conversationId,
      partnerId: partnerId,
    );
  }
}
