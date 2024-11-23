import 'package:get/get.dart';
import 'package:myapp/model/geo_data.dart';
import 'package:myapp/source/remote/rest_client.dart';

class RestRepositoryImpl implements RestRepository {

  @override
  Future<GeoData> getDataByIp({required String ip}) {
    return Get.find<RestClient>().getGeoData(ip);
  }

}

abstract class RestRepository{
  Future<GeoData> getDataByIp({required String ip});
}