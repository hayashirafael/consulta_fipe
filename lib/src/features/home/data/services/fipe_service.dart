import 'package:consulta_fipe/src/features/home/interactor/enums/vehicle_type.dart';
import 'package:consulta_fipe/src/features/home/interactor/services/fipe_service.dart';
import 'package:consulta_fipe/src/features/home/data/models/code_vehicle_model.dart';
import 'package:dio/dio.dart';

class FipeService implements IFipeService {
  final Dio dio;
  final String url = 'https://parallelum.com.br/fipe/api/v1/';

  FipeService(this.dio);

  @override
  Future<List<CodeVehicleModel>> getBrandVehicle({required VehicleType vehicle}) async {
    final result = await dio.get('$url${vehicle.value}/marcas');
    var jsonToList = result.data as List;
    var list = jsonToList
        .map((e) => CodeVehicleModel(
              code: e['codigo'],
              name: e['nome'],
            ))
        .toList();
    return list;
  }

  @override
  Future<List<CodeVehicleModel>> getModelVehicle({
    required VehicleType vehicle,
    required String vehicleBrand,
  }) {
    // TODO: implement getModelVehicle
    throw UnimplementedError();
  }

  @override
  Future<List<CodeVehicleModel>> getVehicle({
    required VehicleType vehicle,
    required String vehicleBrand,
    required String vehicleModel,
    required String vehicleYear,
  }) {
    // TODO: implement getVehicle
    throw UnimplementedError();
  }

  @override
  Future<List<CodeVehicleModel>> getYearVehicle({
    required VehicleType vehicle,
    required String vehicleBrand,
    required String vehicleModel,
  }) {
    // TODO: implement getYearVehicle
    throw UnimplementedError();
  }
}
