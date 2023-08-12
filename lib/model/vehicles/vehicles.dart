import 'package:json_annotation/json_annotation.dart';

part 'vehicles.g.dart';

@JsonSerializable()
class Vehicles {

  @JsonKey(name: 'ЭтоГруппа')
  final bool itsGroup;

  @JsonKey(name: 'ЭлементНаименование')
  final String vehicleName;

  @JsonKey(name: 'РодительНаименование')
  final String parentType;

  @JsonKey(name: 'ДатаВыбытия')
  final int dateRetired;

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool selected;

  Vehicles({
    required this.itsGroup,
    required this.dateRetired,
    required this.vehicleName,
    required this.parentType,
    this.selected = true,
  });

  factory Vehicles.fromJson(Map<String, dynamic> json) => _$VehiclesFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$VehiclesToJson(this);

}
