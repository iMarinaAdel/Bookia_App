import 'dart:io';

import 'package:dio/dio.dart';

class UpdateProfileParams {
  String? name;
  String? address;
  String? phone;
  File? image;

  UpdateProfileParams({this.name, this.address, this.phone});

  factory UpdateProfileParams.fromJson(Map<String, dynamic> json) =>
      UpdateProfileParams(
        name: json['name'] as String?,
        address: json['address'] as String?,
        phone: json['phone'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'name': name,
    'address': address,
    'phone': phone,
  };

  FormData toFormData() {
    var formData = FormData.fromMap({
      'name': name,
      'address': address,
      'phone': phone,
      if (image?.path != null)
        'image': MultipartFile.fromFileSync(
          image!.path,
          filename: image?.path.split("/").last,
        ),
    });
    return formData;
  }
}
