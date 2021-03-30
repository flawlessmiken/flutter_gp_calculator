import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  int _formCount = 5;

  @override
  Widget build(BuildContext context) {
    String _gradeDropDownValue = 'Grade';
    Map<String, int> _gradeDropDownItems = {
      'Grade': 0,
      'A': 5,
      'B': 4,
      'C': 3,
      'D': 2,
      'E': 1,
      'Missing Scripts': 0
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('GP Calculator'),
        actions: [
          IconButton(
              icon: Icon(Icons.add_box),
              onPressed: () {
                setState(() {
                  _formCount++;
                });
              }),
          IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () {
                setState(() {
                  if (_formCount > 1) {
                    _formCount--;
                  }
                });
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(children: [
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _formCount,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Expanded(
                      flex:2,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: 'Course Code',
                            hintText: 'Enter Your Course Code'),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    DropdownButton<String>(
                      value: _gradeDropDownValue,
                      icon: Icon(Icons.arrow_drop_down),
                      onChanged: (String grade) {
                        setState(() {
                          _gradeDropDownValue = grade;
                        });
                      },
                      items: _gradeDropDownItems.keys
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        maxLength: 2,
                        decoration: InputDecoration(
                            labelText: 'Unit Load',
                            hintText: 'Enter Your Unit Load'),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                  ],
                );
              }),
          ElevatedButton(onPressed: () {}, child: Text('Continue'))
        ]),
      ),
    );
  }
}
