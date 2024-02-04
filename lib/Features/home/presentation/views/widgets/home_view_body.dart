import 'package:bookly_clean_arch_app/Features/home/presentation/views/widgets/best_seller_list_view_bloc_consumer.dart';
import 'package:bookly_clean_arch_app/Features/home/presentation/views/widgets/featured_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/utils/styles.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: CustomAppBar()),
              FeaturedListViewBloConsumer(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Best Seller',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: BestSellerListViewBlocConsumer()),
        ),
      ],
    );
  }
}
