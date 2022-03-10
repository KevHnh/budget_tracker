import 'package:flutter/material.dart';
import './card_panel.dart';

// class CardObj extends StatelessWidget {
//   String? type, category1, category2, amount, date, name;
//   CardObj(
//       {Key? key,
//       this.type,
//       this.category1,
//       this.category2,
//       this.amount,
//       this.date,
//       this.name})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//             child: Center(
//                 child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Type: $type'),
//         Text('Category1: $category1'),
//         Text('Category2: $category2'),
//         Text('Amount: $amount'),
//         Text('Date: $date'),
//         Text('Name: $name'),
//       ],
//     ))));
//   }
// }

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String? _type = "Income"; //dropdown
  String? _category1 = "Salary"; //dropdown
  String? _category2 = "Bills"; //dropdown
  String? _amount = "";
  String? _date = "";
  String? _name = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildType() {
    return SizedBox(
        width: 300,
        child: DropdownButton<String>(
          isExpanded: true,
          value: _type,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.black,
          ),
          onChanged: (String? newValue) {
            setState(() {
              _type = newValue!;
            });
          },
          items: <String>['Income', 'Expense']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }

  Widget _buildCategory1() {
    return SizedBox(
        width: 300,
        child: DropdownButton<String>(
          isExpanded: true,
          value: _category1,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.black,
          ),
          onChanged: (String? newValue) {
            setState(() {
              _category1 = newValue!;
            });
          },
          items: <String>[
            'Salary',
            'Business',
            'Investments',
            'Deposits',
            'Savings',
            'Gifts',
            'Other'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }

  @override
  Widget _buildCategory2() {
    return SizedBox(
        width: 300,
        child: DropdownButton<String>(
          isExpanded: true,
          value: _category2,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.black,
          ),
          onChanged: (String? newValue) {
            setState(() {
              _category2 = newValue!;
            });
          },
          items: <String>[
            'Bills',
            'Clothes',
            'Travel',
            'Food',
            'Entertainment',
            'Health',
            'Other'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }

  Widget _buildAmount() {
    return SizedBox(
        width: 300,
        child: TextFormField(
          decoration: const InputDecoration(labelText: 'Amount'),
          keyboardType: TextInputType.number,
          validator: (String? value) {
            if (value!.isEmpty) {
              return 'Amount is Required';
            } else if (!RegExp(r"^[0-9]*$").hasMatch(value)) {
              return 'Enter a Valid Number';
            }

            return null;
          },
          onSaved: (String? value) {
            _amount = value;
          },
        ));
  }

  Widget _buildDate() {
    return SizedBox(
        width: 300,
        child: TextFormField(
          decoration: const InputDecoration(labelText: 'Date mm/dd/yyyy'),
          keyboardType: TextInputType.datetime,
          validator: (String? value) {
            if (value!.isEmpty) {
              return 'Date is Required';
            } else if (!RegExp(
                    r"^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$")
                .hasMatch(value)) {
              return 'Enter Date Correctly';
            }

            return null;
          },
          onSaved: (String? value) {
            _date = value;
          },
        ));
  }

  Widget _buildName() {
    return SizedBox(
        width: 300,
        child: TextFormField(
          decoration: const InputDecoration(labelText: 'Name'),
          keyboardType: TextInputType.name,
          validator: (String? value) {
            if (value!.isEmpty) {
              return 'Name is Required';
            }

            return null;
          },
          onSaved: (String? value) {
            _name = value;
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(width: 5, color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              height: 500,
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: _type == "Income"
                  ? Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              child: const Text("Track Your Money",
                                  style: TextStyle(fontSize: 30))),
                          _buildType(),
                          _buildCategory1(),
                          _buildAmount(),
                          _buildDate(),
                          _buildName(),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ElevatedButton(
                                      child: const Text(
                                        'ADD',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      onPressed: () {
                                        if (!_formKey.currentState!
                                            .validate()) {
                                          return;
                                        }

                                        _formKey.currentState!.save();

                                        print(_type);
                                        print(_category1);
                                        print(_amount);
                                        print(_date);
                                        print(_name);

                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) => CardObj(
                                                      type: _type,
                                                      category1: _category1,
                                                      category2: null,
                                                      amount: _amount,
                                                      date: _date,
                                                      name: _name,
                                                    )));
                                      },
                                    ),
                                    const SizedBox(width: 20),
                                    ElevatedButton(
                                        onPressed: () {
                                          _formKey.currentState?.reset();
                                        },
                                        child: const Text(
                                          'CLEAR',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ))
                                  ]))
                        ],
                      ),
                    )
                  : Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              child: const Text("Track Your Money",
                                  style: TextStyle(fontSize: 30))),
                          _buildType(),
                          _buildCategory2(),
                          _buildAmount(),
                          _buildDate(),
                          _buildName(),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ElevatedButton(
                                      child: const Text(
                                        'ADD',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      onPressed: () {
                                        if (!_formKey.currentState!
                                            .validate()) {
                                          return;
                                        }

                                        _formKey.currentState!.save();

                                        print(_type);
                                        print(_category1);
                                        print(_amount);
                                        print(_date);
                                        print(_name);

                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) => CardObj(
                                                      type: _type,
                                                      category1: null,
                                                      category2: _category2,
                                                      amount: _amount,
                                                      date: _date,
                                                      name: _name,
                                                    )));
                                      },
                                    ),
                                    const SizedBox(width: 20),
                                    ElevatedButton(
                                        onPressed: () {
                                          _formKey.currentState?.reset();
                                        },
                                        child: const Text(
                                          'CLEAR',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ))
                                  ]))
                        ],
                      ),
                    ),
            ),
          ),
        ));
  }
}
