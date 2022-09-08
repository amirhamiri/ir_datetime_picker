import 'package:flutter/material.dart';
import 'package:ir_datetime_picker/ir_datetime_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Example',
      theme: ThemeData(fontFamily: "IranSans"),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _date = "Null";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("SelectedDate: $_date", style: const TextStyle(fontSize: 18.0)),
            const SizedBox(height: 10.0),
            ElevatedButton(
              child: const Text("pick date with dialog"),
              onPressed: () async {
                Jalali? selectedDate = await showIRDatePickerDialog(context);
                if (selectedDate != null) {
                  setState(() {
                    _date = "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}";
                  });
                }
              },
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              child: const Text("pick date with route"),
              onPressed: () async {
                Jalali? selectedDate = await showIRDatePickerRoute(context);
                if (selectedDate != null) {
                  setState(() {
                    _date = "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}";
                  });
                }
              },
            ),
            const SizedBox(height: 30.0),
            const Text("or u can use custom:", style: TextStyle(fontSize: 18.0)),
            IRDatePicker(
              onSelected: (Jalali selectedDate) {
                setState(() {
                  _date = "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}";
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
