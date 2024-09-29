import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/model/movie_video_model.dart';
import 'package:flutter_application_1/model/moviedetails.dart';
import 'package:flutter_application_1/model/moviemodel.dart';

abstract class MovieRepository {
  Future<Either<String, MovieResponseModel>> getDiscover({int page = 1});
  Future<Either<String, MovieResponseModel>> getTopRated({int page = 1});
  Future<Either<String, MovieResponseModel>> getNowPlaying({int page = 1});
  Future<Either<String, MovieResponseModel>> search({required String query});
  Future<Either<String, MovieDetailModel>> getDetail({required int id});
  Future<Either<String, MovieVideosModel>> getVideos({required int id});
}