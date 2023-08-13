import 'package:json_annotation/json_annotation.dart';

part 'efficiency_transport.g.dart';

@JsonSerializable()
class EfficiencyTransport {

  @JsonKey(name: 'ТС')
  final String vehicleName;

  @JsonKey(name: 'Заказчик')
  final String customer;

  @JsonKey(name: 'ЧасыДень')
  final dynamic hoursDay;

  @JsonKey(name: 'ЧасыНочь')
  final dynamic hoursNight;

  @JsonKey(name: 'Тоннаж')
  final dynamic tonnaj;

  @JsonKey(name: 'Объем')
  final dynamic capacity;

  @JsonKey(name: 'КМ')
  final dynamic km;

  @JsonKey(name: 'ТНКМ')
  final dynamic tnkm;

  @JsonKey(name: 'Зарплата')
  final dynamic salary;

  @JsonKey(name: 'Заправка')
  final dynamic refueling;

  @JsonKey(name: 'СуммаТопливаСНДС')
  final dynamic sumOilWithNDS;

  @JsonKey(name: 'СуммаТопливаБезНДС')
  final dynamic sumOilWithoutNDS;

  @JsonKey(name: 'СтоимостьЗапчастей')
  final dynamic costSparePart;

  @JsonKey(name: 'СуммаБезНДС')
  final dynamic sumWithoutNDS;

  @JsonKey(name: 'СтоимостьРемонта')
  final dynamic costRepair;

  @JsonKey(name: 'Остаток')
  final dynamic balance;


  EfficiencyTransport({
    required this.vehicleName,
    required this.balance,
    required this.capacity,
    required this.costRepair,
    required this.sumOilWithNDS,
    required this.salary,
    required this.refueling,
    required this.km,
    required this.hoursNight,
    required this.hoursDay,
    required this.customer,
    required this.costSparePart,
    required this.tonnaj,
    required this.tnkm,
    required this.sumWithoutNDS,
    required this.sumOilWithoutNDS,
  });

  factory EfficiencyTransport.fromJson(Map<String, dynamic> json) => _$EfficiencyTransportFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$EfficiencyTransportToJson(this);

}
