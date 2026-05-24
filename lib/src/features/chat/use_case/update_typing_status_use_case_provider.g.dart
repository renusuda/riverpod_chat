// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_typing_status_use_case_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(updateTypingStatusUseCase)
final updateTypingStatusUseCaseProvider = UpdateTypingStatusUseCaseProvider._();

final class UpdateTypingStatusUseCaseProvider
    extends
        $FunctionalProvider<
          UpdateTypingStatusUseCase,
          UpdateTypingStatusUseCase,
          UpdateTypingStatusUseCase
        >
    with $Provider<UpdateTypingStatusUseCase> {
  UpdateTypingStatusUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateTypingStatusUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateTypingStatusUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateTypingStatusUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateTypingStatusUseCase create(Ref ref) {
    return updateTypingStatusUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateTypingStatusUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateTypingStatusUseCase>(value),
    );
  }
}

String _$updateTypingStatusUseCaseHash() =>
    r'50914fed676a738d486dc5c65496afe7eaff69c8';
