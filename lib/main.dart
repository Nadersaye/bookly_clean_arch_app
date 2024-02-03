import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/constants.dart';
import 'package:bookly_clean_arch_app/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Features/home/presentation/manager/fetch featured books cubit/fetch_featured_books_cubit.dart';
import 'Features/home/presentation/manager/fetch newest books cubit/fetch_newest_books_cubit.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  Bloc.observer = SimpleBlocObserver();
  ServiceLocator.init();
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FetchFeaturedBooksCubit>(
          create: (context) => FetchFeaturedBooksCubit(ServiceLocator.sl())
            ..fetchFeaturedBooks(),
        ),
        BlocProvider<FetchNewestBooksCubit>(
          create: (context) =>
              FetchNewestBooksCubit(ServiceLocator.sl())..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
