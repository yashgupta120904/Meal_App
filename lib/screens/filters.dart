import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:meal_app/Provider/filter_provider.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() {
    return FilterScreenState();
  }
}

class FilterScreenState extends ConsumerState<FilterScreen> {
  var sugarfreeset = false;
  var lactosefreeset = false;
  var vegetarian = false;
  var vegan = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    sugarfreeset = activeFilters[Filter.sugarfree]!;
    lactosefreeset = activeFilters[Filter.lactosefree]!;
    vegetarian = activeFilters[Filter.vegetarian]!;
    vegan = activeFilters[Filter.vegan]!;
    // sugarfreeset = widget.currentFilters[Filter.sugarfree]!;
    // lactosefreeset = widget.currentFilters[Filter.lactosefree]!;
    // vegetarian = widget.currentFilters[Filter.vegetarian]!;
    // vegan = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Filters"),
        ),
        //  drawer: MainDrawer(onSelectScreen: (identifier) {
        //   Navigator.of(context).pop();
        //    if (identifier == 'Meals') {
        //   Navigator.pushReplacement(
        //       context, MaterialPageRoute(builder: (ctx) =>const  TabsScreen()));
        //   }
        //  }),
        body: PopScope(
          canPop: true,
          onPopInvoked: (bool didPop) {
            if (didPop) {
              ref.read(filtersProvider.notifier).setFilters({
                Filter.sugarfree: sugarfreeset,
                Filter.lactosefree: lactosefreeset,
                Filter.vegetarian: vegetarian,
                Filter.vegan: vegan,
              });
              return;
            }
          },
          child: Column(
            children: [
              SwitchListTile(
                
              
                onChanged: (ischecked) {
                  setState(() {
                    sugarfreeset = ischecked;
                  });
                },
                value: sugarfreeset,
                title: Text(
                  'Sugar-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  'Only includes Sugar-free meals',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 10, right: 34),
              ),
              SwitchListTile(
                onChanged: (ischecked) {
                  setState(() {
                    lactosefreeset = ischecked;
                  });
                },
                value: lactosefreeset,
                title: Text(
                  'Lactose-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  'Only includes Lactose-free meals',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 10, right: 34),
              ),
              SwitchListTile(
                onChanged: (ischecked) {
                  setState(() {
                    vegetarian = ischecked;
                  });
                },
                value: vegetarian,
                title: Text(
                  'Vegetarian',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  'Only includes Vegetarian meals',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 10, right: 34),
              ),
              SwitchListTile(
                onChanged: (ischecked) {
                  setState(() {
                    vegan = ischecked;
                  });
                },
                value: vegan,
                title: Text(
                  'Vegan',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  'Only includes Vegan meals',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 10, right: 34),
              ),
            ],
          ),
        ));
  }
}
