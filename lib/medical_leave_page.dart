import 'package:flutter/material.dart';

class MedicalLeavePage extends StatefulWidget {
  @override
  final _formKey = GlobalKey<FormState>();
  _MedicalLeaveFormState createState() => _MedicalLeaveFormState();
}

class _MedicalLeaveFormState extends State<MedicalLeavePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _yearController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _reasonController = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Leave Request Form'),
      ),
      body: Padding(
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
                    return 'Please enter  your name.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _yearController,
                decoration: InputDecoration(labelText: 'Please Enter academy year'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the year.';
                  }
                  return null;
                },
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
              TextFormField(
                controller: _startDateController,
                decoration: InputDecoration(labelText: 'Start Date'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the start date.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _endDateController,
                decoration: InputDecoration(labelText: 'End Date'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the end date.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey?.currentState?.validate() ?? false) {
                    // Validation passed, handle the form submission
                  } {
                    // Process the leave request with the form data
                    // For example, send data to a server or store it locally
                    // You can access the form values with _reasonController.text,
                    // _startDateController.text, and _endDateController.text.
                  }
                },
                child: Text('Submit Request'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
