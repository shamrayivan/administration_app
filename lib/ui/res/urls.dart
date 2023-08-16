String mainUrl = 'http://10.243.57.138/UAT20220420/hs/RMR/';
String subDomen = '/hs/RMR/';

abstract class Urls {
  static const typesOfVehicle = 'GetReference?ReferenceName=TypesOfVehicle';
  static String analysisLogisticWhithID ({required int modeID}) => 'GetResult?FunctionName=AnalysisOfLogisticsWork&Company=Инфинити%20групп%20ООО&View=$modeID';
  static const vehicles = 'GetReference?ReferenceName=Vehicles';
  static const drivers = 'GetReference?ReferenceName=Drivers';
  static String efficencyTransport({required int dateBegin, required int dateEnd}) => 'GetResult?FunctionName=TransportWorkEfficiency&Company=Инфинити%20групп%20ООО&View=2&DateBegin=$dateBegin&DateEnd=$dateEnd&VAT=20&GeoTek=false';

  static String gsmVehicles ({required int mode, required String dateBegin, required String dateEnd, required String vehicle}) => 'GetResult?FunctionName=TransportFuelGraph&Mode=$mode&Vehicle=$vehicle&DateBegin=$dateBegin&DateEnd=$dateEnd&OnlyCalculated=true&OnlyPosted=true';
  // static  analysisLogisticFirstMode = 'GetResult?FunctionName=AnalysisOfLogisticsWork&Company=Инфинити%20групп%20ООО&View=1';
  // static const analysisLogisticSecondMode = 'GetResult?FunctionName=AnalysisOfLogisticsWork&Company=Инфинити%20групп%20ООО&View=2';
  // static const analysisLogisticThirdMode = 'GetResult?FunctionName=AnalysisOfLogisticsWork&Company=Инфинити%20групп%20ООО&View=3';

}