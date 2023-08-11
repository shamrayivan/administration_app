import 'package:json_annotation/json_annotation.dart';

part 'type_of_vehicle.g.dart';

@JsonSerializable()
class TypeOfVehicle {

  @JsonKey(name: 'ЭтоГруппа')
  final bool itsGroup;

  @JsonKey(name: 'ЭлементНаименование')
  final String type;

  @JsonKey(name: 'РодительНаименование')
  final String parentType;

  @JsonKey(includeToJson: false, includeFromJson: false)
  bool selected;

  TypeOfVehicle({
    required this.itsGroup,
    required this.type,
    required this.parentType,
    this.selected = true
  });

  factory TypeOfVehicle.fromJson(Map<String, dynamic> json) => _$TypeOfVehicleFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TypeOfVehicleToJson(this);

}
