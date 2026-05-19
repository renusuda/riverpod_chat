// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_conversations_use_case_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchConversationsUseCase)
final fetchConversationsUseCaseProvider = FetchConversationsUseCaseProvider._();

final class FetchConversationsUseCaseProvider
    extends
        $FunctionalProvider<
          FetchConversationsUseCase,
          FetchConversationsUseCase,
          FetchConversationsUseCase
        >
    with $Provider<FetchConversationsUseCase> {
  FetchConversationsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchConversationsUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchConversationsUseCaseHash();

  @$internal
  @override
  $ProviderElement<FetchConversationsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FetchConversationsUseCase create(Ref ref) {
    return fetchConversationsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FetchConversationsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FetchConversationsUseCase>(value),
    );
  }
}

String _$fetchConversationsUseCaseHash() =>
    r'c96c2a2020e18c1cac629e3f52a49c23864155da';
