import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/moviedetails.dart';
import 'package:flutter_application_1/repositers/movie_repositery.dart';

class MovieGetDetailProvider with ChangeNotifier {
  final MovieRepository _movieRepository;

  MovieGetDetailProvider(this._movieRepository);

  MovieDetailModel? _movie;
  MovieDetailModel? get movie => _movie;

  void getDetail(BuildContext context, {required int id}) async {
    _movie = null;
    notifyListeners();
    final result = await _movieRepository.getDetail(id: id);
    result.fold(
      (messageError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(messageError)),
        );
        _movie = null;
        notifyListeners();
        return;
      },
      (response) {
        _movie = response;
        notifyListeners();
        return;
      },
    );
  }
}