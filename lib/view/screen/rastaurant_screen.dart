import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_app/view/features/common/spinner.dart';
import 'package:restaurant_app/view/features/restaurant/restaurant_screen/restaurant_card_list.dart';
//LAYOUT
import 'package:restaurant_app/view/layout/index.dart';
import 'package:restaurant_app/viewModel/restaurant/restaurant_list_provider.dart';

class RastaurantScreen extends ConsumerStatefulWidget {
  const RastaurantScreen({super.key});

  @override
  ConsumerState<RastaurantScreen> createState() => _RastaurantScreenState();
}

class _RastaurantScreenState extends ConsumerState<RastaurantScreen> {
  @override
  Widget build(
    BuildContext context,
  ) {
    final provider = ref.watch(restaurantListProvider);

    return DefaultLayout(
      showAppBar: true,
      showBottomNavigationBar: true,
      appBarTitle: 'HOME SCREEN',
      body: provider.when(
        loading: () => const Spinner(),
        data: (restaurantCardList) =>
            RestaurantCardList(restaurantCardList: restaurantCardList),
        error: (err, stack) => Text('$err}'),
      ),
    );
  }
}
