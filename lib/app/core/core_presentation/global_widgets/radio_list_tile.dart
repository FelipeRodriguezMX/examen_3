part of './global_widgets.dart';

class CustomRadioListTile extends StatefulWidget {
  CustomRadioListTile({
    Key? key,
    required this.groupValue,
    required this.label,
    required this.valueIndex,
    required this.onChange,
  }) : super(key: key);
  int? groupValue;
  final String label;
  final int valueIndex;
  final Function(int?) onChange;
  @override
  State<CustomRadioListTile> createState() => CustomRadioListTileState();
}

class CustomRadioListTileState extends State<CustomRadioListTile> {
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: widget.valueIndex,
      groupValue: widget.groupValue,
      onChanged: widget.onChange,
      title: Text(widget.label),
    );
  }
}
