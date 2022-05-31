part of './global_widgets.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);
  final String text;
  final bool isSelected;
  final Function(bool) onSelect;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(text),
      selected: isSelected,
      backgroundColor: Colors.transparent,
      selectedColor: Colors.grey.withOpacity(0.2),
      onSelected: onSelect,
    );
  }
}
