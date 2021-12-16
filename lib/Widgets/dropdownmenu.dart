import 'package:flutter/material.dart';


class DropDownMenu extends StatefulWidget {
  const DropDownMenu({Key? key}) : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String dropdownValue = 'Lagas, Nigeria';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down_rounded ),
      elevation: 8,
      underline: SizedBox(),
      style: const TextStyle(color: Colors.black26, fontWeight: FontWeight.bold),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Lagas, Nigeria', 'Cairo, Egypt']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
          
        );
      }).toList(),
    );
  }
}

