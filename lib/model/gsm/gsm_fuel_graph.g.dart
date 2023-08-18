// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gsm_fuel_graph.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GSMFuelGraph _$GSMFuelGraphFromJson(Map<String, dynamic> json) => GSMFuelGraph(
      drivers: (json['Водители'] as List<dynamic>)
          .map((e) => GSMDrivers.fromJson(e as Map<String, dynamic>))
          .toList(),
      vehicles: (json['Машины'] as List<dynamic>)
          .map((e) => GSMVehicles.fromJson(e as Map<String, dynamic>))
          .toList(),
      sostoyanie: json['Состояние'] as String,
      table: (json['Таблица'] as List<dynamic>)
          .map((e) => GSMGraphConsumption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GSMFuelGraphToJson(GSMFuelGraph instance) =>
    <String, dynamic>{
      'Таблица': instance.table,
      'Состояние': instance.sostoyanie,
      'Машины': instance.vehicles,
      'Водители': instance.drivers,
    };
