import 'package:flutter/material.dart';

class GatePassPage extends StatefulWidget {
  @override
  _GatePassPageState createState() => _GatePassPageState();
}

class _GatePassPageState extends State<GatePassPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _tgnameController = TextEditingController();
  TextEditingController _roomController = TextEditingController();
  TextEditingController _timeinController = TextEditingController();
  TextEditingController _timeoutController = TextEditingController();
  TextEditingController _reasonController = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  String? selectedAcademyYear;
  String? selectedTgteacher;
  String? selectedGender;

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        controller.text = picked.toLocal().toString().split(' ')[0];
      });
    }
  }

  Future<void> _selectTime(
      BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        controller.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gate Pass Request Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Please Enter full name'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your name.';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: selectedAcademyYear,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedAcademyYear = newValue;
                    });
                  },
                  items: <String>[
                    'First Year',
                    'Second Year',
                    'Third Year',
                    'Final Year'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select an academy year.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Academy Year',
                  ),
                ),
                TextFormField(
                  controller: _roomController,
                  decoration: InputDecoration(
                      labelText: 'Please Enter Room_Number'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter Room_no.';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: selectedTgteacher,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTgteacher = newValue;
                    });
                  },
                  items: <String>['More Maam', 'Ingole Sir', 'Sawant Sir']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a TG teacher.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Select TG teacher',
                  ),
                ),
                TextFormField(
                  controller: _reasonController,
                  decoration: InputDecoration(labelText: 'Reason for Leave'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter a reason.';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: _buildDateInput(
                        labelText: 'Start Date',
                        controller: _startDateController,
                        errorText: _formKey.currentState?.validate() ?? false
                            ? _startDateController.text.isEmpty
                            ? 'Please enter the start date.'
                            : null
                            : null,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _buildDateInput(
                        labelText: 'End Date',
                        controller: _endDateController,
                        errorText: _formKey.currentState?.validate() ?? false
                            ? _endDateController.text.isEmpty
                            ? 'Please enter the end date.'
                            : null
                            : null,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _timeinController,
                        decoration: InputDecoration(labelText: 'IN Time'),
                        readOnly: true,
                        onTap: () {
                          _selectTime(context, _timeinController);
                        },
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter IN time.';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _timeoutController,
                        decoration: InputDecoration(labelText: 'Out Time'),
                        readOnly: true,
                        onTap: () {
                          _selectTime(context, _timeoutController);
                        },
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter OUT time.';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Gender'),
                    SizedBox(width: 10),
                    Radio<String>(
                      value: 'Male',
                      groupValue: selectedGender,
                      onChanged: (String? value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                    Text('Male'),
                    Radio<String>(
                      value: 'Female',
                      groupValue: selectedGender,
                      onChanged: (String? value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                    Text('Female'),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform the form submission here
                      // You can access the form data using the controllers
                      // For example:
                      // _nameController.text, _tgnameController.text, selectedAcademyYear, selectedTgteacher, etc.
                    }
                  },
                  child: Text('Submit Request'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateInput({
    required String labelText,
    required TextEditingController controller,
    required String? errorText,
  }) {
    return InkWell(
      onTap: () {
        _selectDate(context, controller);
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: labelText,
          errorText: errorText,
        ),
        child: Text(
          controller.text,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
