import 'package:bookly_app/Features/Home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/Home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/Home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/Features/Home/presentation/view_models/similer_books_cubit/cubit/similer_books_cubit.dart';
import 'package:bookly_app/core/functions/cach_helper.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/app_routing.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import 'constants.dart';

void main() async {
  // setupServiceLocatorByGetIt();
  await CachHelper.init();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(AssetsData.kNewestBookEntityBox);
  await Hive.openBox<BookEntity>(AssetsData.kFeturedBookEntityBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => NewestBooksCubit(
        //     getIt.get<HomeRepoImplementation>(),
        //   )..fetchNewstBooks(),
        // ),
        // BlocProvider(
        //   create: (context) => FeaturedBooksCubit(
        //     getIt.get<HomeRepoImplementation>(),
        //   )..feachFeaturedBooks(),
        // ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.ralewayTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
