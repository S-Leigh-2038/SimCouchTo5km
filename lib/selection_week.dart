import 'package:flutter/material.dart';
import 'constants.dart';

class WeekDropDownMenu extends StatefulWidget {
  const WeekDropDownMenu({Key? key, required this.onWeekSelectionPressed})
      : super(key: key);

  final Function(int) onWeekSelectionPressed;

  @override
  State<WeekDropDownMenu> createState() => _WeekDropDownMenuState();
}

class _WeekDropDownMenuState extends State<WeekDropDownMenu> {
  String? dropDownChoice;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      key: const Key('SelectionWeek'),
      value: dropDownChoice,
      icon: const Icon(Icons.arrow_drop_down_outlined),
      elevation: 16,
      style: const TextStyle(color: Colors.blue),
      hint: const Text('Select Week'),
      underline: Container(
        height: 2,
        color: Colors.blueAccent,
      ),
      onChanged: (String? value) {
        // Send to parent widget the week number select as index + 1
        if (value != null) {
          widget.onWeekSelectionPressed(weeks.indexOf(value));
        }
        setState(() {
          dropDownChoice = value!;
        });
      },
      items: weeks.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          key: Key(value),
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
