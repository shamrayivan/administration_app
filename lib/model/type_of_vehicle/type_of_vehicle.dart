import 'package:json_annotation/json_annotation.dart';

part 'type_of_vehicle.g.dart';

@JsonSerializable(constructor: '_')
class TypeOfVehicle {

  @JsonKey(name: 'ЭтоГруппа')
  final bool itsGroup;

  @JsonKey(name: 'ЭлементНаименование')
  final String type;

  @JsonKey(name: 'РодительНаименование')
  final String parentType;

  TypeOfVehicle._({
    required this.itsGroup,
    required this.type,
    required this.parentType,
  });

  factory TypeOfVehicle.fromJson(Map<String, dynamic> json) => _$TypeOfVehicleFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TypeOfVehicleToJson(this);

}
