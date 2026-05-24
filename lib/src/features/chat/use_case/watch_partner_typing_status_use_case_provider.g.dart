// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_partner_typing_status_use_case_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(watchPartnerTypingStatusUseCase)
final watchPartnerTypingStatusUseCaseProvider =
    WatchPartnerTypingStatusUseCaseProvider._();

final class WatchPartnerTypingStatusUseCaseProvider
    extends
        $FunctionalProvider<
          WatchPartnerTypingStatusUseCase,
          WatchPartnerTypingStatusUseCase,
          WatchPartnerTypingStatusUseCase
        >
    with $Provider<WatchPartnerTypingStatusUseCase> {
  WatchPartnerTypingStatusUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchPartnerTypingStatusUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchPartnerTypingStatusUseCaseHash();

  @$internal
  @override
  $ProviderElement<WatchPartnerTypingStatusUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WatchPartnerTypingStatusUseCase create(Ref ref) {
    return watchPartnerTypingStatusUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WatchPartnerTypingStatusUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WatchPartnerTypingStatusUseCase>(
        value,
      ),
    );
  }
}

String _$watchPartnerTypingStatusUseCaseHash() =>
    r'6271c7a6e740cf3afdac3f57272a1e4296ffbbd4';
