import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

class classSelector extends StatelessWidget {
  const classSelector({Key? key, this.items, required this.classOnChange})
      : super(key: key);
  final items;
  final Function(String) classOnChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SelectFormField(
        type: SelectFormFieldType.dropdown, // or can be dialog
        initialValue: 'circle',
        icon: Icon(Icons.person),
        labelText: 'Select class',
        items: items,
        onChanged: classOnChange,
      ),
    );
  }
}
