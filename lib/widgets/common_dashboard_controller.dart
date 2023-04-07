import 'package:get/get.dart';
import '../Services/api_services_by_abir.dart';
import '../common_dashboard_services/models/get_location_model.dart';
import 'logger.dart';


final log = logger(CommonDashboardController);
final commonController = Get.put(CommonDashboardController());

class CommonDashboardController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    getLocations();
  }

  var isLoading = false.obs;
  late List<GetLocationModel> locationList;
  getLocations() async {
    try {

      var result = await ApiServicesByAbir.fetchLocations();
      if (result.runtimeType == int) {
          log.e("Error $result");
      }
      else {
        locationList = result;
       log.i(result.toString());
      }
    } on Exception catch (e) {
        log.e('Fetch Error: ${e.toString()}');
    }
  }

}