// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_fcm_token_use_case_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(deleteFcmTokenUseCase)
final deleteFcmTokenUseCaseProvider = DeleteFcmTokenUseCaseProvider._();

final class DeleteFcmTokenUseCaseProvider
    extends
        $FunctionalProvider<
          DeleteFcmTokenUseCase,
          DeleteFcmTokenUseCase,
          DeleteFcmTokenUseCase
        >
    with $Provider<DeleteFcmTokenUseCase> {
  DeleteFcmTokenUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteFcmTokenUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteFcmTokenUseCaseHash();

  @$internal
  @override
  $ProviderElement<DeleteFcmTokenUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteFcmTokenUseCase create(Ref ref) {
    return deleteFcmTokenUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteFcmTokenUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteFcmTokenUseCase>(value),
    );
  }
}

String _$deleteFcmTokenUseCaseHash() =>
    r'00b27d8811205bb6dbbba516767bfcfd059f8baf';
