import 'package:consulta_fipe/src/features/home/interactor/entities/model_vehicle_entity.dart';
import 'package:consulta_fipe/src/features/home/interactor/entities/vehicle_entity.dart';
import 'package:consulta_fipe/src/features/home/interactor/enums/vehicle.dart';

abstract class IFipeService {
  Future<List<ModelVehicleEntity>> fetchTypeVehicle({
    required IVehicle vehicle,
  });

  Future<List<ModelVehicleEntity>> fetchBrandVehicle({
    required String vehicleBrand,
  });

  Future<List<ModelVehicleEntity>> fetchModelVehicle({
    required String vehicleModel,
  });

  Future<List<ModelVehicleEntity>> fetchYearVehicle({
    required String vehicleYear,
  });

  Future<VehicleEntity> fetchVehicle({
    required String vehicleYear,
  });
}
