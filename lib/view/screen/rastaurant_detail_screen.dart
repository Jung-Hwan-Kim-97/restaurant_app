import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/view/features/common/spinner.dart';
import 'package:restaurant_app/view/features/restaurant/restaurant_detail_screen/detail_screen_container.dart';
import 'package:restaurant_app/view/layout/index.dart';
import 'package:restaurant_app/viewModel/restaurant/restaurant_detail_provider.dart';

class RastaurantDetailScreen extends ConsumerStatefulWidget {
  const RastaurantDetailScreen({super.key});
  @override
  ConsumerState<RastaurantDetailScreen> createState() =>
      _RastaurantDetailScreenState();
}

class _RastaurantDetailScreenState
    extends ConsumerState<RastaurantDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final id = GoRouterState.of(context).pathParameters['id'] as String;
    final title = GoRouterState.of(context).extra as String;

    final provider = ref.watch(restaurantDetailProvider(id));

    return DefaultLayout(
        showAppBar: true,
        appBarTitle: title,
        isBackIcon: true,
        body: provider.when(
          loading: () => const Spinner(),
          data: (restaurantDetailData) =>
              DetailScreenContainer(restaurantDetailData: restaurantDetailData),
          error: (err, stack) => Text('$err'),
        ));
  }
}
