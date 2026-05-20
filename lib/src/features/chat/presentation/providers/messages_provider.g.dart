// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(messages)
final messagesProvider = MessagesFamily._();

final class MessagesProvider
    extends
        $FunctionalProvider<
          AsyncValue<ChatMessage>,
          ChatMessage,
          FutureOr<ChatMessage>
        >
    with $FutureModifier<ChatMessage>, $FutureProvider<ChatMessage> {
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
  $FutureProviderElement<ChatMessage> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ChatMessage> create(Ref ref) {
    final argument = this.argument as String;
    return messages(ref, conversationId: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MessagesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$messagesHash() => r'98cdb3e1c92fb7a0912828b814c6e6bd7d8a109a';

final class MessagesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ChatMessage>, String> {
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
