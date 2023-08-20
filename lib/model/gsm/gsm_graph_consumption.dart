import 'package:json_annotation/json_annotation.dart';

part 'gsm_graph_consumption.g.dart';

@JsonSerializable()
class GSMGraphConsumption {

  @JsonKey(name: 'Дата')
  final DateTime date;

  @JsonKey(name: 'ТС')
  final String ts;

  @JsonKey(name: 'Объём')
  final num capacity;

  @JsonKey(name: 'Пробег')
  final num mileage;

  @JsonKey(name: 'Норма')
  final num norm;

  @JsonKey(name: 'Водители')
  final String drivers;

  @JsonKey(name: 'Машины')
  final String vehicles;

  @JsonKey(name: 'Путевые')
  final String waybills;

  @JsonKey(name: 'Заправщики')
  final String refueler;

  @JsonKey(name: 'Показывать')
  final bool show;

  GSMGraphConsumption({
    required this.drivers,
    required this.vehicles,
    required this.capacity,
    required this.date,
    required this.refueler,
    required this.norm,
    required this.mileage,
    required this.show,
    required this.ts,
    required this.waybills,
  });

  factory GSMGraphConsumption.fromJson(Map<String, dynamic> json) => _$GSMGraphConsumptionFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GSMGraphConsumptionToJson(this);

}
