import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> gender = [
    "ชาย",
    "หญิง",
    "อื่นๆ",
  ];

  List<ListItem> prefix = [
    ListItem("boy", "เด็กชาย"),
    ListItem("girl", "เด็กหญิง"),
    ListItem("Mr.", "นาย"),
    ListItem("Miss.", "นาง"),
    ListItem("Mrs.", "นางสาว"),
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItem = [];
  ListItem? _selectedPrefix;

  String _selectedItem = "ชาย";

  List<DropdownMenuItem<ListItem>> builDropdownMenuItem(List<ListItem> prefix) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (ListItem pf in prefix) {
      items.add(DropdownMenuItem(
        child: Text(pf.name),
        value: pf,
      ));
    }
    return items;
  }

  @override
  void initState() {
    super.initState();
    _dropdownMenuItem = builDropdownMenuItem(prefix);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lab07 Dropdown"),
      ),
      body: Column(
        children: [
          Text("เลือกเพศ"),
          DropdownButton(
            value: _selectedItem,
            items: gender.map((item) {
              return DropdownMenuItem(
                child: Text(item),
                value: item,
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedItem = value!;
              });
            },
          ),
          Divider(),
          Text("คำนำหน้า"),
          DropdownButton(
              value: _selectedPrefix,
              items: _dropdownMenuItem,
              onChanged: (value) {
                setState(() {
                  _selectedPrefix = value;
                });
              })
        ],
      ),
    );
  }
}

class ListItem {
  String value;
  String name;
  ListItem(this.value, this.name);
}
