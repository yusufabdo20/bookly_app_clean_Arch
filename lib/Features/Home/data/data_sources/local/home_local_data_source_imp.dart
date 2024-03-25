import 'package:bookly_app/Features/Home/domain/entities/book_entity.dart';
import 'package:bookly_app/core/functions/cach_helper.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:hive_flutter/adapters.dart';

import 'home_local_data_source.dart';

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(AssetsData.kBookEntityBox);
    List<BookEntity> localBooks = box.values.toList();
    return localBooks;
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // var box = Hive.box<BookEntity>(AssetsData.kBookEntityBox);
    // List<BookEntity> localBooks = box.values.toList();

    return CachHelper.getData<BookEntity>(boxName: AssetsData.kBookEntityBox);
  }
}
