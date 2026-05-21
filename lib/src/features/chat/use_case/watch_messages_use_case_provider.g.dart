// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_messages_use_case_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(watchMessagesUseCase)
final watchMessagesUseCaseProvider = WatchMessagesUseCaseProvider._();

final class WatchMessagesUseCaseProvider
    extends
        $FunctionalProvider<
          WatchMessagesUseCase,
          WatchMessagesUseCase,
          WatchMessagesUseCase
        >
    with $Provider<WatchMessagesUseCase> {
  WatchMessagesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchMessagesUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchMessagesUseCaseHash();

  @$internal
  @override
  $ProviderElement<WatchMessagesUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WatchMessagesUseCase create(Ref ref) {
    return watchMessagesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WatchMessagesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WatchMessagesUseCase>(value),
    );
  }
}

String _$watchMessagesUseCaseHash() =>
    r'408b54b74c74f69c2f94f5b940c58210131e5808';
