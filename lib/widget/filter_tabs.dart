import 'package:flutter/material.dart';
import 'package:flutter_day2_ex/res/filter_modes.dart';
import 'package:flutter_day2_ex/res/global_configurations.dart';

class FilterTabs extends StatelessWidget {
  final FilterMode currFilterMode;
  final List<FilterMode> listFilters;
  final ValueChanged<FilterMode> onSelectFilterMode;

  const FilterTabs(
      {Key key, this.currFilterMode, this.listFilters, this.onSelectFilterMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = GlobalConfigurations.isDarkMode;

    final textActiveColor =
        isDarkMode ? Colors.deepOrangeAccent : Colors.lightBlue;
    final activeBackgroundColor = isDarkMode ? Colors.black : Colors.white;

    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.withOpacity(0.3),
      ),
      padding: EdgeInsets.all(2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: listFilters
            .map(
              (filterMode) => _buildTabItem(
                color:
                    filterMode == currFilterMode ? activeBackgroundColor : null,
                textColor:
                    filterMode == currFilterMode ? textActiveColor : null,
                title: filterMode.title,
                onPressed: () {
                  onSelectFilterMode(filterMode);
                },
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildTabItem(
      {Color color, String title, Function onPressed, textColor}) {
    return FlatButton(
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        // side: BorderSide(color: Colors.red),
      ),
      color: color,
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(fontSize: 13, color: textColor),
      ),
    );
  }
}
