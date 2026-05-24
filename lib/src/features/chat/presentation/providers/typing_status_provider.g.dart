// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typing_status_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TypingStatus)
final typingStatusProvider = TypingStatusFamily._();

final class TypingStatusProvider extends $NotifierProvider<TypingStatus, void> {
  TypingStatusProvider._({
    required TypingStatusFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'typingStatusProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$typingStatusHash();

  @override
  String toString() {
    return r'typingStatusProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TypingStatus create() => TypingStatus();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TypingStatusProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$typingStatusHash() => r'b7498f5f874061b2730fcb0865eb4f20e9e7e23f';

final class TypingStatusFamily extends $Family
    with $ClassFamilyOverride<TypingStatus, void, void, void, String> {
  TypingStatusFamily._()
    : super(
        retry: null,
        name: r'typingStatusProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TypingStatusProvider call({required String conversationId}) =>
      TypingStatusProvider._(argument: conversationId, from: this);

  @override
  String toString() => r'typingStatusProvider';
}

abstract class _$TypingStatus extends $Notifier<void> {
  late final _$args = ref.$arg as String;
  String get conversationId => _$args;

  void build({required String conversationId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(conversationId: _$args));
  }
}
