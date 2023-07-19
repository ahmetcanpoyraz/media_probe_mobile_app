import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:media_probe_mobile_app/core/constants/application_constants.dart';
import 'package:media_probe_mobile_app/core/models/most_popular_response_model.dart';
import '../constants/endpoints.dart';
import '../network/exceptions.dart';
import '../network/network_data_manager.dart';

class MostPopularRepository {
  MostPopularRepository._privateConstructor(this.networkDataManager);
  static final MostPopularRepository instance =
      MostPopularRepository._privateConstructor(NetworkDataManager(Dio()));
  final NetworkDataManager networkDataManager;

  Future<Either<ServerException, MostPopularResponseModel>> getMostPopular() async {
    try {
      var response = await Dio().get(
        Endpoints.getMostPopular + ApplicationConstants.API_KEY,
      );
      final result = MostPopularResponseModel.fromJson(response.data);
      return Right(result);
    } on ServerException catch (err) {
      return Left(err);
    }
  }
}
