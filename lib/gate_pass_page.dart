import 'package:flutter/material.dart';

class GatePassPage extends StatefulWidget {
  @override
  _GatePassPageState createState() => _GatePassPageState();
}

class _GatePassPageState extends State<GatePassPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _yearController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _reasonController = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gate Pass Request Form'),
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
                    return 'Please enter your name.';
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
              _buildDateInput(
                labelText: 'Start Date',
                controller: _startDateController,
                errorText: _formKey.currentState?.validate() ?? false
                    ? _startDateController.text.isEmpty
                    ? 'Please enter the start date.'
                    : null
                    : null,
              ),
              _buildDateInput(
                labelText: 'End Date',
                controller: _endDateController,
                errorText: _formKey.currentState?.validate() ?? false
                    ? _endDateController.text.isEmpty
                    ? 'Please enter the end date.'
                    : null
                    : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Validation passed, handle the form submission
                  } else {
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
