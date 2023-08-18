import 'package:administration_app/model/gsm/gsm_drivers.dart';
import 'package:administration_app/model/gsm/gsm_graph_consumption.dart';
import 'package:administration_app/model/gsm/gsm_vehicles.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gsm_fuel_graph.g.dart';

@JsonSerializable()
class GSMFuelGraph {

  @JsonKey(name: 'Таблица')
  final List<GSMGraphConsumption> table;

  @JsonKey(name: 'Состояние')
  final String sostoyanie;

  @JsonKey(name: 'Машины')
  final List<GSMVehicles> vehicles;

  @JsonKey(name: 'Водители')
  final List<GSMDrivers> drivers;

  GSMFuelGraph({
    required this.drivers,
    required this.vehicles,
    required this.sostoyanie,
    required this.table,
  });

  factory GSMFuelGraph.fromJson(Map<String, dynamic> json) => _$GSMFuelGraphFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GSMFuelGraphToJson(this);

}
