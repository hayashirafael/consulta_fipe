import 'package:consulta_fipe/src/features/home/interactor/enums/vehicle_type.dart';
import 'package:consulta_fipe/src/features/home/data/models/code_vehicle_model.dart';

abstract class IFipeService {
  Future<List<CodeVehicleModel>> getBrandVehicle({
    required VehicleType vehicle,
  });

  Future<List<CodeVehicleModel>> getModelVehicle({
    required VehicleType vehicle,
    required String vehicleBrand,
  });

  Future<List<CodeVehicleModel>> getYearVehicle({
    required VehicleType vehicle,
    required String vehicleBrand,
    required String vehicleModel,
  });

  Future<List<CodeVehicleModel>> getVehicle({
    required VehicleType vehicle,
    required String vehicleBrand,
    required String vehicleModel,
    required String vehicleYear,
  });
}
