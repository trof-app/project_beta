import 'package:flutter/material.dart';
import 'package:flutter_starter/ui/components/components.dart';
import 'package:date_field/date_field.dart';

class UpsertActUI extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FormInputFieldWithIcon(
                    iconPrefix: Icons.description,
                    keyboardType: TextInputType.text,
                    labelText: 'Name',
                  ),
                  FormVerticalSpace(),
                  FormInputFieldWithIcon(
                    iconPrefix: Icons.description,
                    keyboardType: TextInputType.text,
                    labelText: 'Description',
                    minLines: 2,
                  ),
                  FormVerticalSpace(),
                  FormInputFieldWithIcon(
                    iconPrefix: Icons.description,
                    keyboardType: TextInputType.text,
                    labelText: 'Genre',
                  ),
                  FormVerticalSpace(),
                  FormInputFieldWithIcon(
                    iconPrefix: Icons.description,
                    keyboardType: TextInputType.text,
                    labelText: 'Genre',
                  ),
                  FormVerticalSpace(),
                  DateTimeFormField(
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.event_note),
                      labelText: 'Set Start Time',
                    ),
                    mode: DateTimeFieldPickerMode.dateAndTime,
                    initialValue: DateTime(2021, 06, 06),
                    lastDate: DateTime(2021, 06, 07),
                    firstDate: DateTime(2021, 06, 06),
                    autovalidateMode: AutovalidateMode.always,
                    validator: (e) =>
                        (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                    onDateSelected: (DateTime value) {
                      print(value);
                    },
                  ),
                  FormVerticalSpace(),
                  DateTimeFormField(
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.event_note),
                      labelText: 'Set End Time',
                    ),
                    mode: DateTimeFieldPickerMode.dateAndTime,
                    initialValue: DateTime(2021, 06, 06),
                    lastDate: DateTime(2021, 06, 07),
                    firstDate: DateTime(2021, 06, 06),
                    autovalidateMode: AutovalidateMode.always,
                    validator: (e) =>
                        (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                    onDateSelected: (DateTime value) {
                      print(value);
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
