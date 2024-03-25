import 'package:bookly_app/Features/Home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:bookly_app/Features/Home/domain/entities/book_entity.dart';
import 'package:bookly_app/core/functions/saveDataListLocal.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/assets.dart';

import '../../../../../core/functions/cach_helper.dart';
import '../../models/book_model/book_model.dart';

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImp({required this.apiService});

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(endPoint: 'volumes?q=computer');
    List<BookEntity> bookEntities = getBookList(data);
    CachHelper.saveListData(
      values: bookEntities,
      boxName: AssetsData.kBookEntityBox,
    );
    return bookEntities;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=computer&sort=newest');
    List<BookEntity> bookEntities = getBookList(data);
    CachHelper.saveListData(
      values: bookEntities,
      boxName: AssetsData.kBookEntityBox,
    );
    return bookEntities;
  }

  List<BookEntity> getBookList(Map<String, dynamic> data) {
    List<BookEntity> bookEntities = [];
    for (var item in data['items']) {
      bookEntities.add(
        BookModel.fromJson(item),
      );
    }
    return bookEntities;
  }
}
