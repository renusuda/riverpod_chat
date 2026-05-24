import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/chat/data/typing_repository_provider.dart';
import 'package:riverpod_chat/src/features/chat/use_case/watch_partner_typing_status_use_case.dart';

part 'watch_partner_typing_status_use_case_provider.g.dart';

@Riverpod(keepAlive: true)
WatchPartnerTypingStatusUseCase watchPartnerTypingStatusUseCase(Ref ref) {
  return WatchPartnerTypingStatusUseCase(
    typingRepository: ref.watch(typingRepositoryProvider),
  );
}
