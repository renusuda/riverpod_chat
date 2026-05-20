// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_messages_use_case_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchMessagesUseCase)
final fetchMessagesUseCaseProvider = FetchMessagesUseCaseProvider._();

final class FetchMessagesUseCaseProvider
    extends
        $FunctionalProvider<
          FetchMessagesUseCase,
          FetchMessagesUseCase,
          FetchMessagesUseCase
        >
    with $Provider<FetchMessagesUseCase> {
  FetchMessagesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchMessagesUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchMessagesUseCaseHash();

  @$internal
  @override
  $ProviderElement<FetchMessagesUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FetchMessagesUseCase create(Ref ref) {
    return fetchMessagesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FetchMessagesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FetchMessagesUseCase>(value),
    );
  }
}

String _$fetchMessagesUseCaseHash() =>
    r'2a73f65d86f9a1d7bb3723c878756f299a7bb6e1';
