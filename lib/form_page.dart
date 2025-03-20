import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
 
 class FormPage extends StatefulWidget {
   const FormPage({super.key});
 
   @override
   State<FormPage> createState() => _FormPageState();
 }
 
 class _FormPageState extends State<FormPage> {
  final _key = GlobalKey<FormState>();
   final TextEditingController _taskController = TextEditingController();
   DateTime? _selectedDate;
   String? _dateError;
   List<Map<String, dynamic>> listTugas = [];
   void addData() {
     setState(() {
       listTugas.add({
         'task': _taskController.text,
         'done': false,
         'deadline': _selectedDate,
       });
       _taskController.clear();
       _selectedDate = null;
       _dateError = null;
     });
      ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         content: Text('Data added successfully'),
         backgroundColor: Colors.green,
         duration: Duration(seconds: 2),
       ),
     );
   }
   Future<void> _showDateTimePicker(BuildContext context) async {
     DateTime tempSelectDate = _selectedDate ?? DateTime.now();
     await showModalBottomSheet(
       context: context,
       shape: const RoundedRectangleBorder(
         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
       ),
       builder: (BuildContext builder) {
         return StatefulBuilder(
           builder: (context, setStateModal) {
             return Container(
               padding: const EdgeInsets.all(16),
               height: 350,
               child: Column(
                 children: [
                   const Text(
                     'Set Task Date & Time',
                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                   ),
                   const SizedBox(height: 10),
                   Expanded(
                     child: CupertinoDatePicker(
                       mode: CupertinoDatePickerMode.dateAndTime,
                       initialDateTime: tempSelectDate,
                       minimumDate: DateTime(2000),
                       maximumDate: DateTime(2100),
                       use24hFormat: false,
                       onDateTimeChanged: (DateTime newDate) {
                         int hour =
                             newDate.hour % 12 == 0 ? 12 : newDate.hour % 12;
                         setStateModal(() {
                           tempSelectDate = DateTime(
                             newDate.year,
                             newDate.month,
                             newDate.day,
                             hour,
                             newDate.minute.clamp(0, 59),
                           );
                         });
                       },
                     ),
                   ),
                   ElevatedButton(
                     onPressed: () {
                       setState(() {
                         _selectedDate = tempSelectDate;
                         _dateError = null;
                       });
                       Navigator.pop(context);
                     },
                     child: Text('Select'),
                   ),
                 ],
               ),
             );
           },
         );
       },
     );
   }
 
   @override
   Widget build(BuildContext context) {
     return const Placeholder();
   }
 }