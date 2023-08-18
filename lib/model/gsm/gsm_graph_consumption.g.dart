// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gsm_graph_consumption.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GSMGraphConsumption _$GSMGraphConsumptionFromJson(Map<String, dynamic> json) =>
    GSMGraphConsumption(
      drivers: json['Водители'] as String,
      vehicles: json['Машины'] as String,
      capacity: json['Объём'] as num,
      date: DateTime.parse(json['Дата'] as String),
      refueler: json['Заправщики'] as String,
      norm: json['Норма'] as num,
      mileage: json['Пробег'] as num,
      show: json['Показывать'] as bool,
      ts: json['ТС'] as String,
      waybills: json['Путевые'] as String,
    );

Map<String, dynamic> _$GSMGraphConsumptionToJson(
        GSMGraphConsumption instance) =>
    <String, dynamic>{
      'Дата': instance.date.toIso8601String(),
      'ТС': instance.ts,
      'Объём': instance.capacity,
      'Пробег': instance.mileage,
      'Норма': instance.norm,
      'Водители': instance.drivers,
      'Машины': instance.vehicles,
      'Путевые': instance.waybills,
      'Заправщики': instance.refueler,
      'Показывать': instance.show,
    };
