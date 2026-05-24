import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/chat/data/remote/firebase_typing_remote_data_source.dart';
import 'package:riverpod_chat/src/features/chat/data/remote/typing_remote_data_source.dart';
import 'package:riverpod_chat/src/features/chat/data/typing_repository.dart';
import 'package:riverpod_chat/src/firebase/providers/firebase_database_provider.dart';

part 'typing_repository_provider.g.dart';

@Riverpod(keepAlive: true)
TypingRemoteDataSource typingRemoteDataSource(Ref ref) {
  return FirebaseTypingRemoteDataSource(
    database: ref.watch(firebaseDatabaseProvider),
  );
}

@Riverpod(keepAlive: true)
TypingRepository typingRepository(Ref ref) {
  return TypingRepository(
    remoteDataSource: ref.watch(typingRemoteDataSourceProvider),
  );
}
