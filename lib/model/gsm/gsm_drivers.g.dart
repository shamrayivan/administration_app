// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gsm_drivers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GSMDrivers _$GSMDriversFromJson(Map<String, dynamic> json) => GSMDrivers(
      selected: json['Выбрать'] as bool,
      fioDriver: json['ФИО'] as String,
    );

Map<String, dynamic> _$GSMDriversToJson(GSMDrivers instance) =>
    <String, dynamic>{
      'ФИО': instance.fioDriver,
      'Выбрать': instance.selected,
    };
