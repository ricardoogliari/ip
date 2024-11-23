import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:myapp/model/geo_data.dart' as Model;
import 'package:get/get.dart';
import 'package:myapp/source/local/database.dart';
import 'package:myapp/repositories/db_repository.dart';

class DbController extends GetxController with StateMixin<List<GeoDataData>> {
  DbController({required this.repository}) {
    change(null, status: RxStatus.empty());
  }

  final DbRepository repository;

  Future<void> getSavedData() async {
    change(null, status: RxStatus.loading());

    await repository.getSavedData().then((value) {
      change(value, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  Future<int> insertData({Model.GeoData? geo}) {
    return repository.insertData(geo: geo);
  }
}
