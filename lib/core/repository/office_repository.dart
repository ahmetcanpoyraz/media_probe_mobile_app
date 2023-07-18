import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../constants/endpoints.dart';
import '../models/get_office_model.dart';
import '../network/exceptions.dart';
import '../network/network_data_manager.dart';


class OfficeRepository {
  OfficeRepository._privateConstructor(this.networkDataManager);
  static final OfficeRepository instance =
  OfficeRepository._privateConstructor(NetworkDataManager(Dio()));
  final NetworkDataManager networkDataManager;


  Future<Either<ServerException, GetOfficeModel>> getOffices() async {
    try{
      var response = await Dio().get(
        Endpoints.getOffices,
        options: Options(),
      );
      final result = GetOfficeModel.fromJson(response.data);
      return Right(result);

    }on ServerException catch (err) {
      return Left(err);
    }
  }
}