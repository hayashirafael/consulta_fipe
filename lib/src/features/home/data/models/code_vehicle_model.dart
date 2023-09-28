import 'dart:convert';

class CodeVehicleModel {
  final String code;
  final String name;

  CodeVehicleModel({required this.code, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
    };
  }

  static CodeVehicleModel fromMap(Map<String, dynamic> map) {
    return CodeVehicleModel(
      code: map['code'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  static CodeVehicleModel fromJson(String source) => fromMap(json.decode(source));
}
