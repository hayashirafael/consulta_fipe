import 'package:consulta_fipe/src/features/home/data/models/code_vehicle_model.dart';
import 'package:consulta_fipe/src/features/home/data/services/fipe_service.dart';
import 'package:consulta_fipe/src/features/home/interactor/enums/vehicle_type.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final service = FipeService(Dio());
  test('getBrandVehicle', () async {
    final List<CodeVehicleModel> list = await service.getBrandVehicle(
      vehicle: VehicleType.car,
    );
    expect(list, isNotEmpty);
  });
}
