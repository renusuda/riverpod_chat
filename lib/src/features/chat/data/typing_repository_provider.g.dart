// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typing_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(typingRemoteDataSource)
final typingRemoteDataSourceProvider = TypingRemoteDataSourceProvider._();

final class TypingRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          TypingRemoteDataSource,
          TypingRemoteDataSource,
          TypingRemoteDataSource
        >
    with $Provider<TypingRemoteDataSource> {
  TypingRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'typingRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$typingRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<TypingRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TypingRemoteDataSource create(Ref ref) {
    return typingRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TypingRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TypingRemoteDataSource>(value),
    );
  }
}

String _$typingRemoteDataSourceHash() =>
    r'c3fb535181ffeea6b9379b4fa692492cc7fa7ae8';

@ProviderFor(typingRepository)
final typingRepositoryProvider = TypingRepositoryProvider._();

final class TypingRepositoryProvider
    extends
        $FunctionalProvider<
          TypingRepository,
          TypingRepository,
          TypingRepository
        >
    with $Provider<TypingRepository> {
  TypingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'typingRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$typingRepositoryHash();

  @$internal
  @override
  $ProviderElement<TypingRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TypingRepository create(Ref ref) {
    return typingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TypingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TypingRepository>(value),
    );
  }
}

String _$typingRepositoryHash() => r'5ae80839a6cdb2c8a3bb45ae72badcc31a9c13ec';
