import 'package:bookly_clean_arch_app/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_clean_arch_app/Features/home/data/repos/home_repo.dart';
import 'package:bookly_clean_arch_app/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly_clean_arch_app/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../Features/home/data/data_sources/home_local_data_source.dart';
import '../../Features/home/domain/repos/base_home_repo.dart';
import '../../Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import '../../Features/home/presentation/manager/fetch featured books cubit/fetch_featured_books_cubit.dart';
import '../../Features/home/presentation/manager/fetch newest books cubit/fetch_newest_books_cubit.dart';

class ServiceLocator {
  static final sl = GetIt.instance;
  static void init() {
    // Features - Featured Books
    sl.registerFactory(() => FetchFeaturedBooksCubit(sl()));

    // Features - Newest Books
    sl.registerFactory(() => FetchNewestBooksCubit(sl()));
    sl.registerLazySingleton(() => ApiService(dio: Dio()));

    // Use cases
    sl.registerLazySingleton(
        () => FetchFeaturedBooksUseCase(baseHomeRepo: sl()));
    sl.registerLazySingleton(
        () => FetchNewestBooksUseCase(baseHomeRepo: sl<BaseHomeRepo>()));

    // Data sources
    sl.registerLazySingleton<BaseHomeRemoteDataSource>(
        () => HomeRemoteDataSource(apiService: sl()));
    sl.registerLazySingleton<BaseHomeLocalDataSource>(
        () => HomeLocalDataSource());

    // Repositories
    sl.registerLazySingleton<BaseHomeRepo>(() => HomeRepo(
        remoteDataSource: sl<BaseHomeRemoteDataSource>(),
        localDataSource: sl<BaseHomeLocalDataSource>()));
  }
}
