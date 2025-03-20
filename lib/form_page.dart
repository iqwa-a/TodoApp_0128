import 'package:flutter/material.dart';
 
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
   }
 
   @override
   Widget build(BuildContext context) {
     return const Placeholder();
   }
 }