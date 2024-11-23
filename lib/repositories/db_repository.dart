import 'package:get/get.dart';
import 'package:myapp/model/geo_data.dart' as Model;
import 'package:myapp/source/local/database.dart';

class DbRepositoryImpl implements DbRepository {

  @override
  Future<List<GeoDataData>> getSavedData() {
    AppDatabase appDatabase = Get.find<AppDatabase>();
    return appDatabase.select(appDatabase.geoData).get();
  }

  @override
  Future<int> insertData({Model.GeoData? geo}) {
    AppDatabase appDatabase = Get.find<AppDatabase>();
    return appDatabase
        .into(appDatabase.geoData)
        .insert(GeoDataCompanion.insert(
        ip: geo?.query ?? "",
        city: geo?.city ?? "",
        regionName: geo?.regionName ?? "",
        country: geo?.country ?? "",
        lat: "${geo?.lat}",
        lon: "${geo?.lon}",
      )
    );
  }

}

abstract class DbRepository{
  Future<List<GeoDataData>> getSavedData();
  Future<int> insertData({Model.GeoData? geo});
}