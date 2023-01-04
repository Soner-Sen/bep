import 'package:bep_desktop/application/screens/home/widgets/available_assigned.dart';
import 'package:bep_desktop/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ZeroBudget extends StatefulWidget {
  const ZeroBudget({Key? key}) : super(key: key);

  @override
  State<ZeroBudget> createState() => _ZeroBudgetState();
}

class _ZeroBudgetState extends State<ZeroBudget> {
  TextEditingController? _AvailableController;
  TextEditingController? _AssignedController;

  final category1 = Category('Category 1', [
    SubCategory('SubCategory 1', 0),
    SubCategory('SubCategory 2', 0),
  ]);
  final category2 = Category('Category 2', [
    SubCategory('SubCategory 1', 0),
    SubCategory('SubCategory 2', 0),
  ]);
  final category3 = Category('Category 3', [
    SubCategory('SubCategory 1', 0),
    SubCategory('SubCategory 2', 0),
  ]);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            AvailableAssignedWidget(
                availableController: _AvailableController,
                assignedController: _AssignedController),
            const Divider(),
            const SizedBox(height: 20),
            ListView(
              shrinkWrap: true,
              children: [
                CategoryItem(category: category1),
                CategoryItem(category: category2),
                CategoryItem(category: category3),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Category {
  final String name;
  final List<SubCategory> subCategories;
  double _totalValue = 0;

  Category(this.name, this.subCategories) {
    for (SubCategory subCategory in subCategories) {
      _totalValue += subCategory.value;
    }
  }

  double get totalValue => _totalValue;

  void addSubCategory(SubCategory subCategory) {
    subCategories.add(subCategory);
    _totalValue += subCategory.value;
  }

  void removeSubCategory(SubCategory subCategory) {
    _totalValue -= subCategory.value;
  }

  void updateTotalValue() {
    _totalValue = 0;
    for (SubCategory subCategory in subCategories) {
      _totalValue += subCategory.value;
    }
  }
}

class SubCategory {
  final String name;
  double value;

  SubCategory(this.name, this.value);
}

class CategoryItem extends StatefulWidget {
  final Category category;

  CategoryItem({required this.category});

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            CategoryHeadlineWidget(widget: widget, widget2: widget),
            ...widget.category.subCategories.map((subCategory) {
              return TextField(
                decoration: InputDecoration(labelText: subCategory.name),
                onChanged: (value) {
                  double? newValue =
                      value.isEmpty ? null : double.tryParse(value);
                  setState(() {
                    subCategory.value = newValue ?? 0;
                    widget.category.updateTotalValue();
                  });
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class CategoryHeadlineWidget extends StatelessWidget {
  const CategoryHeadlineWidget({
    Key? key,
    required this.widget,
    required this.widget2,
  }) : super(key: key);

  final CategoryItem widget;
  final CategoryItem widget2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          widget.category.name,
          style: AppTheme.subtitleTextStyle,
        ),
        Text(
          'Total: ${widget.category.totalValue}€',
          style: AppTheme.subtitleTextStyle,
        ),
      ],
    );
  }
}
