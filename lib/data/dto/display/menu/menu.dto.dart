import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu.dto.freezed.dart';
part 'menu.dto.g.dart';

@freezed
class MenuDto with _$MenuDto {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory MenuDto({
    @Default('') String title,
    @Default(-1) int tabId,
  }) = _MenuDto;

  factory MenuDto.fromJson(Map<String, dynamic> json) =>
      _$MenuDtoFromJson(json);
}


// @JsonSerializable()
// class User {
//   User(this.name, this.email);

//   String name;
//   String email;

//   /// A necessary factory constructor for creating a new User instance
//   /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
//   /// The constructor is named after the source class, in this case, User.
//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

//   /// `toJson` is the convention for a class to declare support for serialization
//   /// to JSON. The implementation simply calls the private, generated
//   /// helper method `_$UserToJson`.
//   Map<String, dynamic> toJson() => _$UserToJson(this);
// }
