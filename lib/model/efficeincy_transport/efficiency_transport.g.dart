// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'efficiency_transport.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EfficiencyTransport _$EfficiencyTransportFromJson(Map<String, dynamic> json) =>
    EfficiencyTransport(
      vehicleName: json['ТС'] as String,
      balance: json['Остаток'],
      capacity: json['Объем'],
      costRepair: json['СтоимостьРемонта'],
      sumOilWithNDS: json['СуммаТопливаСНДС'],
      salary: json['Зарплата'],
      refueling: json['Заправка'],
      km: json['КМ'],
      hoursNight: json['ЧасыНочь'],
      hoursDay: json['ЧасыДень'],
      customer: json['Заказчик'] as String,
      costSparePart: json['СтоимостьЗапчастей'],
      tonnaj: json['Тоннаж'],
      tnkm: json['ТНКМ'],
      sumWithoutNDS: json['СуммаБезНДС'],
      sumOilWithoutNDS: json['СуммаТопливаБезНДС'],
    );

Map<String, dynamic> _$EfficiencyTransportToJson(
        EfficiencyTransport instance) =>
    <String, dynamic>{
      'ТС': instance.vehicleName,
      'Заказчик': instance.customer,
      'ЧасыДень': instance.hoursDay,
      'ЧасыНочь': instance.hoursNight,
      'Тоннаж': instance.tonnaj,
      'Объем': instance.capacity,
      'КМ': instance.km,
      'ТНКМ': instance.tnkm,
      'Зарплата': instance.salary,
      'Заправка': instance.refueling,
      'СуммаТопливаСНДС': instance.sumOilWithNDS,
      'СуммаТопливаБезНДС': instance.sumOilWithoutNDS,
      'СтоимостьЗапчастей': instance.costSparePart,
      'СуммаБезНДС': instance.sumWithoutNDS,
      'СтоимостьРемонта': instance.costRepair,
      'Остаток': instance.balance,
    };
