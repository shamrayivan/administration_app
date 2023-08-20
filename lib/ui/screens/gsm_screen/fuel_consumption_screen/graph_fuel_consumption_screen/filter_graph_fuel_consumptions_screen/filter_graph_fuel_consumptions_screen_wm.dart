import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/gsm_treatment/gsm_manager.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/ui/router.dart';
import 'package:relation/relation.dart';

class FilterGraphFuelConsumptionScreenWM extends WidgetModelStandard {

  final int mode;
  final String data;
  final _gsmManager = getIt<GSMManager>();
  final fuelGraphState = getIt<GSMManager>().fuelGraphState;
  final _appRouter = getIt<AppRouter>();

  final loadingState = StreamedStateNS<bool>(false);


  final onUpdateDate = Action<void>();
  final changeSelected = Action<bool>();

  final listChoosenData = StreamedStateNS([]);

  FilterGraphFuelConsumptionScreenWM({ required this.mode, required this.data});

  @override
  void onInit() {
    if(mode == 1 || mode == 2){
      _gsmManager.fuelGraphState.data?.drivers.forEach((element) {
        listChoosenData.value.add(element);
      });
    }else if (mode ==3){
      _gsmManager.fuelGraphState.data?.vehicles.forEach((element) {
        listChoosenData.value.add(element);
      });
    }
    listChoosenData.accept(listChoosenData.value);
  }

  @override
  void onBind() {
    subscribe(onUpdateDate.stream, (value) {
      if(mode == 1 || mode == 2){
        final List<Map<String, dynamic>> list = [];
          listChoosenData.value.forEach((element) {
            final Map<String, dynamic> entitiMap = {};
            entitiMap['ФИО'] = element.fioDriver;
            entitiMap['Выбрать'] = element.selected;
            list.add(entitiMap);
          });
        final Map<String, dynamic> map = {'Водители' : list};
        loadingState.accept(true);
        doFutureHandleError(_gsmManager.getFuelGraphVehicle(data: map ,mode: mode, dateBegin: _gsmManager.dateBeginState.value.millisecondsSinceEpoch.toString(), dateEnd: _gsmManager.dateEndState.value.millisecondsSinceEpoch.toString(), vehicle: data), onValue: (e){
          loadingState.accept(false);
          _appRouter.pop();
        }, onError: (e,s){
          loadingState.accept(false);
        });
      }else if (mode ==3){
        final List<Map<String, dynamic>> list = [];
        listChoosenData.value.forEach((element) {
          final Map<String, dynamic> entitiMap = {};
          entitiMap['Наименование'] = element.nameVehicle;
          entitiMap['Выбрать'] = element.selected;
          list.add(entitiMap);
        });
        final Map<String, dynamic> map = {'Машины' : list};
        loadingState.accept(true);
        doFutureHandleError(_gsmManager.getFuelGraphDriver(data: map, dateBegin: _gsmManager.dateBeginState.value.millisecondsSinceEpoch.toString(), dateEnd: _gsmManager.dateEndState.value.millisecondsSinceEpoch.toString(), driver: data), onValue: (val){
          loadingState.accept(false);
          _appRouter.pop();
        }, onError: (e,s){
          loadingState.accept(false);
        });
      }
    });
  }
}
