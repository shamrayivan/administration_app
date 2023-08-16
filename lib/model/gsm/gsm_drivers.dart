import 'package:json_annotation/json_annotation.dart';

part 'gsm_drivers.g.dart';

@JsonSerializable()
class GSMDrivers {

  @JsonKey(name: 'ФИО')
  final String fioDriver;

  @JsonKey(name: 'Выбрать')
  bool selected;

  GSMDrivers({
    required this.selected,
    required this.fioDriver,
  });

  factory GSMDrivers.fromJson(Map<String, dynamic> json) => _$GSMDriversFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GSMDriversToJson(this);

}
