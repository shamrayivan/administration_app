// String mainUrl = 'http://10.243.57.138/UAT20220420/hs/RMR/';
String mainUrl = '';
String subDomen = '/hs/RMR/';

const List<String> listUrl = ['1c.infiniti48.ru', 'test.infiniti48.ru'];

abstract class Urls {
  static const typesOfVehicle = 'GetReference?ReferenceName=TypesOfVehicle';
  static String analysisLogisticWhithID ({required int modeID}) => 'GetResult?FunctionName=AnalysisOfLogisticsWork&Company=Инфинити%20групп%20ООО&View=$modeID';
  static const vehicles = 'GetReference?ReferenceName=Vehicles';
  static const drivers = 'GetReference?ReferenceName=Drivers';
  static String efficencyTransport({required int dateBegin, required int dateEnd}) => 'GetResult?FunctionName=TransportWorkEfficiency&Company=Инфинити%20групп%20ООО&View=2&DateBegin=$dateBegin&DateEnd=$dateEnd&VAT=20&GeoTek=false';

  static String gsmVehicles ({required int mode, required String dateBegin, required String dateEnd, required String vehicle}) => 'GetResult?FunctionName=TransportFuelGraph&Mode=$mode&Vehicle=$vehicle&DateBegin=$dateBegin&DateEnd=$dateEnd&OnlyCalculated=true&OnlyPosted=true';
  static String gsmDriver ({required String dateBegin, required String dateEnd, required String driver}) => 'GetResult?FunctionName=TransportFuelGraph&Mode=3&Driver=$driver&DateBegin=$dateBegin&DateEnd=$dateEnd&OnlyCalculated=true&OnlyPosted=true';
  static String gsmFuelTable ({String? dateBegin, String? dateEnd, required String period, required int mode, required bool hideRetired, String? year}) => 'GetResult?FunctionName=TransportFuelTable&Mode=$mode&${mode ==1 ? 'DateBegin=$dateBegin&DateEnd=$dateEnd' : 'Year=$year'}&OnlyCalculated=true&OnlyPosted=true&HideOutTS=$hideRetired&Period=$period';
  // static  analysisLogisticFirstMode = 'GetResult?FunctionName=AnalysisOfLogisticsWork&Company=Инфинити%20групп%20ООО&View=1';
  // static const analysisLogisticSecondMode = 'GetResult?FunctionName=AnalysisOfLogisticsWork&Company=Инфинити%20групп%20ООО&View=2';
  // static const analysisLogisticThirdMode = 'GetResult?FunctionName=AnalysisOfLogisticsWork&Company=Инфинити%20групп%20ООО&View=3';

}