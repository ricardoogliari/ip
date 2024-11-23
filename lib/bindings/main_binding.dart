import 'package:get/get.dart';
import 'package:myapp/controllers/db_controller.dart';
import 'package:myapp/controllers/rest_controller.dart';
import 'package:myapp/source/local/database.dart';
import 'package:myapp/source/remote/rest_client.dart';
import 'package:myapp/repositories/db_repository.dart';
import 'package:myapp/repositories/rest_repository.dart';
import 'package:dio/dio.dart';

class MainBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(AppDatabase());
    Get.put(RestClient(Dio()));
    Get.put(RestController(repository: RestRepositoryImpl()));
    Get.put(DbController(repository: DbRepositoryImpl()));
  }

}