// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typing_status_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TypingStatus)
final typingStatusProvider = TypingStatusFamily._();

final class TypingStatusProvider
    extends $StreamNotifierProvider<TypingStatus, bool> {
  TypingStatusProvider._({
    required TypingStatusFamily super.from,
    required ({String conversationId, String partnerId}) super.argument,
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
        '$argument';
  }

  @$internal
  @override
  TypingStatus create() => TypingStatus();

  @override
  bool operator ==(Object other) {
    return other is TypingStatusProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$typingStatusHash() => r'9d747d35965e7fa83074fb2070bef4c87ca8ed5f';

final class TypingStatusFamily extends $Family
    with
        $ClassFamilyOverride<
          TypingStatus,
          AsyncValue<bool>,
          bool,
          Stream<bool>,
          ({String conversationId, String partnerId})
        > {
  TypingStatusFamily._()
    : super(
        retry: null,
        name: r'typingStatusProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TypingStatusProvider call({
    required String conversationId,
    required String partnerId,
  }) => TypingStatusProvider._(
    argument: (conversationId: conversationId, partnerId: partnerId),
    from: this,
  );

  @override
  String toString() => r'typingStatusProvider';
}

abstract class _$TypingStatus extends $StreamNotifier<bool> {
  late final _$args = ref.$arg as ({String conversationId, String partnerId});
  String get conversationId => _$args.conversationId;
  String get partnerId => _$args.partnerId;

  Stream<bool> build({
    required String conversationId,
    required String partnerId,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(
        conversationId: _$args.conversationId,
        partnerId: _$args.partnerId,
      ),
    );
  }
}
