import 'package:e_commerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class ColorPickerWidget extends StatefulWidget {
  const ColorPickerWidget({super.key, required this.colors, required this.onColorSelected});

  final List<String> colors;
  final Function(String) onColorSelected;

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  String? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: getColorItems(),
      ),
    );
  }

  List<Widget> getColorItems() {
    List<Widget> colorItemWidgetList = [];
    for (String color in widget.colors) {
     Widget item = _getColorItemWidget(
          name: color,
          onTap: () {
            _selectedColor = color;
            widget.onColorSelected(_selectedColor!);
            setState(() {});
          },
          isSelected: _selectedColor == color);
     colorItemWidgetList.add(item);
    }
    return colorItemWidgetList;
  }

  Widget _getColorItemWidget(
      {required String name,
      required VoidCallback onTap,
      required bool isSelected}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            border: Border.all(),
            color: isSelected ? AppColors.themeColor : Colors.transparent),
        child: Text(
          name,
          style: TextStyle(color: isSelected ? Colors.white : null),
        ),
      ),
    );
  }
}
