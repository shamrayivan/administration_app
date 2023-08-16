import 'package:json_annotation/json_annotation.dart';

part 'gsm_vehicles.g.dart';

@JsonSerializable()
class GSMVehicles {

  @JsonKey(name: 'Наименование')
  final String nameVehicle;

  @JsonKey(name: 'Выбрать')
  bool selected;

  GSMVehicles({
    required this.selected,
    required this.nameVehicle,
  });

  factory GSMVehicles.fromJson(Map<String, dynamic> json) => _$GSMVehiclesFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GSMVehiclesToJson(this);

}
