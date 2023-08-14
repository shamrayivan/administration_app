import 'package:json_annotation/json_annotation.dart';

part 'drivers.g.dart';

@JsonSerializable()
class Drivers {

  @JsonKey(name: 'Наименование')
  final String drivername;

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool selected;

  Drivers({
    required this.drivername,
    this.selected = false,
  });

  factory Drivers.fromJson(Map<String, dynamic> json) => _$DriversFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DriversToJson(this);

}
