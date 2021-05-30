import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:julius/components/adaptative_button.dart';
import 'package:julius/components/adaptative_date_picker.dart';
import 'package:julius/components/adaptative_text_field.dart';

class TransactionForm extends StatefulWidget {
  final Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
            left: 10,
          ),
          child: Column(
            children: [
              AdaptativeTextField(
                label: 'Título',
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptativeTextField(
                label: 'Valor(R\$)',
                controller: _valueController,
                onSubmitted: (_) => _submitForm(),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChange: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              AdaptativeButton(
                label: 'Nova Transação',
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
