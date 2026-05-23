// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_conversations_use_case_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(watchConversationsUseCase)
final watchConversationsUseCaseProvider = WatchConversationsUseCaseProvider._();

final class WatchConversationsUseCaseProvider
    extends
        $FunctionalProvider<
          WatchConversationsUseCase,
          WatchConversationsUseCase,
          WatchConversationsUseCase
        >
    with $Provider<WatchConversationsUseCase> {
  WatchConversationsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchConversationsUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchConversationsUseCaseHash();

  @$internal
  @override
  $ProviderElement<WatchConversationsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WatchConversationsUseCase create(Ref ref) {
    return watchConversationsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WatchConversationsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WatchConversationsUseCase>(value),
    );
  }
}

String _$watchConversationsUseCaseHash() =>
    r'4b1aebf13169f26acb7ac8af5ad10bbe96e1ea86';
