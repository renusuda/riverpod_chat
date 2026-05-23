// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Messages)
final messagesProvider = MessagesFamily._();

final class MessagesProvider
    extends $StreamNotifierProvider<Messages, ChatMessage> {
  MessagesProvider._({
    required MessagesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'messagesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$messagesHash();

  @override
  String toString() {
    return r'messagesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Messages create() => Messages();

  @override
  bool operator ==(Object other) {
    return other is MessagesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$messagesHash() => r'e628916c2e8eba00c5e25d144e0adfb7b6310c0e';

final class MessagesFamily extends $Family
    with
        $ClassFamilyOverride<
          Messages,
          AsyncValue<ChatMessage>,
          ChatMessage,
          Stream<ChatMessage>,
          String
        > {
  MessagesFamily._()
    : super(
        retry: null,
        name: r'messagesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MessagesProvider call({required String conversationId}) =>
      MessagesProvider._(argument: conversationId, from: this);

  @override
  String toString() => r'messagesProvider';
}

abstract class _$Messages extends $StreamNotifier<ChatMessage> {
  late final _$args = ref.$arg as String;
  String get conversationId => _$args;

  Stream<ChatMessage> build({required String conversationId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ChatMessage>, ChatMessage>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ChatMessage>, ChatMessage>,
              AsyncValue<ChatMessage>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(conversationId: _$args));
  }
}
