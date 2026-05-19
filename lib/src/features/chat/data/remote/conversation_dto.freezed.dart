// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConversationDto {

 List<String> get memberIds;@_TimestampConverter() DateTime get updatedAt; String? get lastMessage;
/// Create a copy of ConversationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationDtoCopyWith<ConversationDto> get copyWith => _$ConversationDtoCopyWithImpl<ConversationDto>(this as ConversationDto, _$identity);

  /// Serializes this ConversationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationDto&&const DeepCollectionEquality().equals(other.memberIds, memberIds)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(memberIds),updatedAt,lastMessage);

@override
String toString() {
  return 'ConversationDto(memberIds: $memberIds, updatedAt: $updatedAt, lastMessage: $lastMessage)';
}


}

/// @nodoc
abstract mixin class $ConversationDtoCopyWith<$Res>  {
  factory $ConversationDtoCopyWith(ConversationDto value, $Res Function(ConversationDto) _then) = _$ConversationDtoCopyWithImpl;
@useResult
$Res call({
 List<String> memberIds,@_TimestampConverter() DateTime updatedAt, String? lastMessage
});




}
/// @nodoc
class _$ConversationDtoCopyWithImpl<$Res>
    implements $ConversationDtoCopyWith<$Res> {
  _$ConversationDtoCopyWithImpl(this._self, this._then);

  final ConversationDto _self;
  final $Res Function(ConversationDto) _then;

/// Create a copy of ConversationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? memberIds = null,Object? updatedAt = null,Object? lastMessage = freezed,}) {
  return _then(_self.copyWith(
memberIds: null == memberIds ? _self.memberIds : memberIds // ignore: cast_nullable_to_non_nullable
as List<String>,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationDto].
extension ConversationDtoPatterns on ConversationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationDto value)  $default,){
final _that = this;
switch (_that) {
case _ConversationDto():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationDto value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> memberIds, @_TimestampConverter()  DateTime updatedAt,  String? lastMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationDto() when $default != null:
return $default(_that.memberIds,_that.updatedAt,_that.lastMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> memberIds, @_TimestampConverter()  DateTime updatedAt,  String? lastMessage)  $default,) {final _that = this;
switch (_that) {
case _ConversationDto():
return $default(_that.memberIds,_that.updatedAt,_that.lastMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> memberIds, @_TimestampConverter()  DateTime updatedAt,  String? lastMessage)?  $default,) {final _that = this;
switch (_that) {
case _ConversationDto() when $default != null:
return $default(_that.memberIds,_that.updatedAt,_that.lastMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConversationDto extends ConversationDto {
  const _ConversationDto({required final  List<String> memberIds, @_TimestampConverter() required this.updatedAt, this.lastMessage}): _memberIds = memberIds,super._();
  factory _ConversationDto.fromJson(Map<String, dynamic> json) => _$ConversationDtoFromJson(json);

 final  List<String> _memberIds;
@override List<String> get memberIds {
  if (_memberIds is EqualUnmodifiableListView) return _memberIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_memberIds);
}

@override@_TimestampConverter() final  DateTime updatedAt;
@override final  String? lastMessage;

/// Create a copy of ConversationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationDtoCopyWith<_ConversationDto> get copyWith => __$ConversationDtoCopyWithImpl<_ConversationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationDto&&const DeepCollectionEquality().equals(other._memberIds, _memberIds)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_memberIds),updatedAt,lastMessage);

@override
String toString() {
  return 'ConversationDto(memberIds: $memberIds, updatedAt: $updatedAt, lastMessage: $lastMessage)';
}


}

/// @nodoc
abstract mixin class _$ConversationDtoCopyWith<$Res> implements $ConversationDtoCopyWith<$Res> {
  factory _$ConversationDtoCopyWith(_ConversationDto value, $Res Function(_ConversationDto) _then) = __$ConversationDtoCopyWithImpl;
@override @useResult
$Res call({
 List<String> memberIds,@_TimestampConverter() DateTime updatedAt, String? lastMessage
});




}
/// @nodoc
class __$ConversationDtoCopyWithImpl<$Res>
    implements _$ConversationDtoCopyWith<$Res> {
  __$ConversationDtoCopyWithImpl(this._self, this._then);

  final _ConversationDto _self;
  final $Res Function(_ConversationDto) _then;

/// Create a copy of ConversationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? memberIds = null,Object? updatedAt = null,Object? lastMessage = freezed,}) {
  return _then(_ConversationDto(
memberIds: null == memberIds ? _self._memberIds : memberIds // ignore: cast_nullable_to_non_nullable
as List<String>,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
