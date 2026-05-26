// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_fcm_token_use_case_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(saveFcmTokenUseCase)
final saveFcmTokenUseCaseProvider = SaveFcmTokenUseCaseProvider._();

final class SaveFcmTokenUseCaseProvider
    extends
        $FunctionalProvider<
          SaveFcmTokenUseCase,
          SaveFcmTokenUseCase,
          SaveFcmTokenUseCase
        >
    with $Provider<SaveFcmTokenUseCase> {
  SaveFcmTokenUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'saveFcmTokenUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$saveFcmTokenUseCaseHash();

  @$internal
  @override
  $ProviderElement<SaveFcmTokenUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SaveFcmTokenUseCase create(Ref ref) {
    return saveFcmTokenUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaveFcmTokenUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaveFcmTokenUseCase>(value),
    );
  }
}

String _$saveFcmTokenUseCaseHash() =>
    r'c8f9759b6d38fa6f0010290a3b0e4cb9da9b09f0';
