part of './global_widgets.dart';

class InputWithValidation extends StatefulWidget {
  const InputWithValidation({
    Key? key,
    this.icon,
    this.maxLines = 1,
    this.hintText,
    this.label,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.suffixText = '',
    this.readOnly = false,
    this.controller,
  }) : super(key: key);
  final IconData? icon;
  final int? maxLines;
  final String? hintText;
  final String? label;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? suffixText;
  final bool? readOnly;
  final TextEditingController? controller;

  @override
  InputWithValidationState createState() => InputWithValidationState();
}

class InputWithValidationState extends State<InputWithValidation> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 7, top: 14),
          width: double.infinity,
          child: Text(
            widget.label!,
            style: theme.textTheme.bodyText1,
          ),
        ),
        TextFormField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          readOnly: widget.readOnly!,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: (widget.icon != null)
                ? Icon(widget.icon, size: 25, color: Colors.grey)
                : null,
            contentPadding: const EdgeInsets.all(10),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                widget.suffixText!,
                style: theme.textTheme.bodyText1!.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: widget.validator,
          maxLines: widget.maxLines,
          keyboardType: widget.keyboardType,
        ),
      ],
    );
  }
}
