// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConversationMetadata {

 String get partnerId; String get lastMessage; DateTime get updatedAt;
/// Create a copy of ConversationMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationMetadataCopyWith<ConversationMetadata> get copyWith => _$ConversationMetadataCopyWithImpl<ConversationMetadata>(this as ConversationMetadata, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationMetadata&&(identical(other.partnerId, partnerId) || other.partnerId == partnerId)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,partnerId,lastMessage,updatedAt);

@override
String toString() {
  return 'ConversationMetadata(partnerId: $partnerId, lastMessage: $lastMessage, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ConversationMetadataCopyWith<$Res>  {
  factory $ConversationMetadataCopyWith(ConversationMetadata value, $Res Function(ConversationMetadata) _then) = _$ConversationMetadataCopyWithImpl;
@useResult
$Res call({
 String partnerId, String lastMessage, DateTime updatedAt
});




}
/// @nodoc
class _$ConversationMetadataCopyWithImpl<$Res>
    implements $ConversationMetadataCopyWith<$Res> {
  _$ConversationMetadataCopyWithImpl(this._self, this._then);

  final ConversationMetadata _self;
  final $Res Function(ConversationMetadata) _then;

/// Create a copy of ConversationMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? partnerId = null,Object? lastMessage = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
partnerId: null == partnerId ? _self.partnerId : partnerId // ignore: cast_nullable_to_non_nullable
as String,lastMessage: null == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationMetadata].
extension ConversationMetadataPatterns on ConversationMetadata {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationMetadata() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationMetadata value)  $default,){
final _that = this;
switch (_that) {
case _ConversationMetadata():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationMetadata() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String partnerId,  String lastMessage,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationMetadata() when $default != null:
return $default(_that.partnerId,_that.lastMessage,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String partnerId,  String lastMessage,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ConversationMetadata():
return $default(_that.partnerId,_that.lastMessage,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String partnerId,  String lastMessage,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ConversationMetadata() when $default != null:
return $default(_that.partnerId,_that.lastMessage,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ConversationMetadata implements ConversationMetadata {
  const _ConversationMetadata({required this.partnerId, required this.lastMessage, required this.updatedAt});
  

@override final  String partnerId;
@override final  String lastMessage;
@override final  DateTime updatedAt;

/// Create a copy of ConversationMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationMetadataCopyWith<_ConversationMetadata> get copyWith => __$ConversationMetadataCopyWithImpl<_ConversationMetadata>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationMetadata&&(identical(other.partnerId, partnerId) || other.partnerId == partnerId)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,partnerId,lastMessage,updatedAt);

@override
String toString() {
  return 'ConversationMetadata(partnerId: $partnerId, lastMessage: $lastMessage, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ConversationMetadataCopyWith<$Res> implements $ConversationMetadataCopyWith<$Res> {
  factory _$ConversationMetadataCopyWith(_ConversationMetadata value, $Res Function(_ConversationMetadata) _then) = __$ConversationMetadataCopyWithImpl;
@override @useResult
$Res call({
 String partnerId, String lastMessage, DateTime updatedAt
});




}
/// @nodoc
class __$ConversationMetadataCopyWithImpl<$Res>
    implements _$ConversationMetadataCopyWith<$Res> {
  __$ConversationMetadataCopyWithImpl(this._self, this._then);

  final _ConversationMetadata _self;
  final $Res Function(_ConversationMetadata) _then;

/// Create a copy of ConversationMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? partnerId = null,Object? lastMessage = null,Object? updatedAt = null,}) {
  return _then(_ConversationMetadata(
partnerId: null == partnerId ? _self.partnerId : partnerId // ignore: cast_nullable_to_non_nullable
as String,lastMessage: null == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
