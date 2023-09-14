import 'package:consulta_fipe/src/features/home/interactor/entities/model_vehicle_entity.dart';
import 'package:consulta_fipe/src/features/home/interactor/entities/vehicle_entity.dart';
import 'package:consulta_fipe/src/features/home/interactor/enums/vehicle.dart';
import 'package:consulta_fipe/src/features/home/interactor/services/fipe_service.dart';

class FipeService implements IFipeService {
  @override
  Future<List<ModelVehicleEntity>> fetchBrandVehicle({required String vehicleBrand}) {
    // TODO: implement fetchBrandVehicle
    throw UnimplementedError();
  }

  @override
  Future<List<ModelVehicleEntity>> fetchModelVehicle({required String vehicleModel}) {
    // TODO: implement fetchModelVehicle
    throw UnimplementedError();
  }

  @override
  Future<List<ModelVehicleEntity>> fetchTypeVehicle({required IVehicle vehicle}) {
    // TODO: implement fetchTypeVehicle
    throw UnimplementedError();
  }

  @override
  Future<VehicleEntity> fetchVehicle({required String vehicleYear}) {
    // TODO: implement fetchVehicle
    throw UnimplementedError();
  }

  @override
  Future<List<ModelVehicleEntity>> fetchYearVehicle({required String vehicleYear}) {
    // TODO: implement fetchYearVehicle
    throw UnimplementedError();
  }
}
