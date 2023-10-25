import 'package:flutter/material.dart';
import 'gate_pass_page.dart';
import 'medical_leave_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChoiceScreen(),
    );
  }
}

class ChoiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gate Pass Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _showMedicalLeaveOptions(context);
              },
              child: Text('Medical Leave'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showGatePassOptions(context);
              },
              child: Text('Gate Pass'),
            ),
          ],
        ),
      ),
    );
  }

  void _showMedicalLeaveOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Which Department...?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                 title: Text('1.Computer'),
                  onTap: () {
                    // Handle the choice for Gate Pass - Option 1 here
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MedicalLeavePage()), // Navigate to ComputerPage
                    );
                  },
                ),
                ListTile(
                  title: Text('2.E&TC'),
                  onTap: () {
                    // Handle the choice for Gate Pass - Option 2 here
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MedicalLeavePage()), // Navigate to ComputerPage
                    );
                  },
                ),
                ListTile(
                  title: Text('3.Electrical'),
                  onTap: () {
                    // Handle the choice for Gate Pass - Option 3 here
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MedicalLeavePage()), // Navigate to ComputerPage
                    );
                  },
                ),
                ListTile(
                  title: Text('4.Mechanical'),
                  onTap: () {
                    // Handle the choice for Gate Pass - Option 4 here
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MedicalLeavePage()), // Navigate to ComputerPage
                    );
                  },
                ),
                ListTile(
                  title: Text('5.Civil'),
                  onTap: () {
                    // Handle the choice for Gate Pass - Option 5 here
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MedicalLeavePage()), // Navigate to ComputerPage
                    );
                  },
                ),
              // You can add more options for Medical Leave here
            ],
          ),
        );
      },
    );
  }

  void _showGatePassOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Which Deapartment...?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('1.Computer'),
                onTap: () {
                  // Handle the choice for Gate Pass - Option 1 here
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GatePassPage()), // Navigate to ComputerPage
                  );
                },
              ),
              ListTile(
                title: Text('2.E&TC'),
                onTap: () {
                  // Handle the choice for Gate Pass - Option 2 here
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GatePassPage()), // Navigate to ComputerPage
                  );
                },
              ),
              ListTile(
                title: Text('3.Electrical'),
                onTap: () {
                  // Handle the choice for Gate Pass - Option 3 here
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GatePassPage()), // Navigate to ComputerPage
                  );
                },
              ),
              ListTile(
                title: Text('4.Mechanical'),
                onTap: () {
                  // Handle the choice for Gate Pass - Option 4 here
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GatePassPage()), // Navigate to ComputerPage
                  );
                },
              ),
              ListTile(
                title: Text('5.Civil'),
                onTap: () {
                  // Handle the choice for Gate Pass - Option 5 here
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GatePassPage()), // Navigate to ComputerPage
                  );
                },
              ),
              // You can add more options for Gate Pass here
            ],
          ),
        );
      },
    );
  }
}



