// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_fcm_token_refresh_use_case_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fcmTokenRefreshStream)
final fcmTokenRefreshStreamProvider = FcmTokenRefreshStreamProvider._();

final class FcmTokenRefreshStreamProvider
    extends
        $FunctionalProvider<
          Raw<Stream<String>>,
          Raw<Stream<String>>,
          Raw<Stream<String>>
        >
    with $Provider<Raw<Stream<String>>> {
  FcmTokenRefreshStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fcmTokenRefreshStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fcmTokenRefreshStreamHash();

  @$internal
  @override
  $ProviderElement<Raw<Stream<String>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Raw<Stream<String>> create(Ref ref) {
    return fcmTokenRefreshStream(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<Stream<String>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<Stream<String>>>(value),
    );
  }
}

String _$fcmTokenRefreshStreamHash() =>
    r'c5219e2a1bd42a2836502dc0a7b1236ce3a9fef6';

@ProviderFor(watchFcmTokenRefreshUseCase)
final watchFcmTokenRefreshUseCaseProvider =
    WatchFcmTokenRefreshUseCaseProvider._();

final class WatchFcmTokenRefreshUseCaseProvider
    extends
        $FunctionalProvider<
          WatchFcmTokenRefreshUseCase,
          WatchFcmTokenRefreshUseCase,
          WatchFcmTokenRefreshUseCase
        >
    with $Provider<WatchFcmTokenRefreshUseCase> {
  WatchFcmTokenRefreshUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchFcmTokenRefreshUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchFcmTokenRefreshUseCaseHash();

  @$internal
  @override
  $ProviderElement<WatchFcmTokenRefreshUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WatchFcmTokenRefreshUseCase create(Ref ref) {
    return watchFcmTokenRefreshUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WatchFcmTokenRefreshUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WatchFcmTokenRefreshUseCase>(value),
    );
  }
}

String _$watchFcmTokenRefreshUseCaseHash() =>
    r'0dbc2e6a1d29af3fec78a09fcacd53c23afe3815';

@ProviderFor(fcmTokenRefreshListener)
final fcmTokenRefreshListenerProvider = FcmTokenRefreshListenerProvider._();

final class FcmTokenRefreshListenerProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  FcmTokenRefreshListenerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fcmTokenRefreshListenerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fcmTokenRefreshListenerHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return fcmTokenRefreshListener(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$fcmTokenRefreshListenerHash() =>
    r'f6a68c1e6065ef2d564b94d150ba559cf966669c';
