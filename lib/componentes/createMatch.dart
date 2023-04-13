import 'dart:ffi';

import 'package:flutter/material.dart';

class CreateMatch extends StatefulWidget {
  @override
  State<CreateMatch> createState() => _CreateMatchState();
}

class _CreateMatchState extends State<CreateMatch> {
  int _indexSteps = 0;
  int? _selectedEsporte = 0;
  int? _selectedArena = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stepper(
        type: StepperType.horizontal,
        onStepTapped: (value) => print(value),
        currentStep: _indexSteps,
        onStepContinue: () => setState(() {
          _indexSteps < 3 ? _indexSteps++ : _indexSteps;
        }),
        onStepCancel: () => setState(() {
          _indexSteps > 0 ? _indexSteps-- : _indexSteps;
        }),
        steps: <Step>[
          Step(
              title: Text("1"),
              content: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Nome do jogo'),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButton(
                      value: _selectedEsporte,
                      items: [
                        DropdownMenuItem(value: 0, child: Text('Basquete')),
                        DropdownMenuItem(value: 1, child: Text('Futebol')),
                        DropdownMenuItem(value: 2, child: Text('Volêi'))
                      ],
                      onChanged: (value) => setState(() {
                        _selectedEsporte = value;
                      }),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButton(
                      value: _selectedArena,
                      items: [
                        DropdownMenuItem(value: 0, child: Text('Arena 1')),
                        DropdownMenuItem(value: 1, child: Text('Arena 2')),
                        DropdownMenuItem(value: 2, child: Text('Arena 3'))
                      ],
                      onChanged: (value) => setState(() {
                        _selectedArena = value;
                      }),
                    ),
                  )
                ],
              )),
          Step(
              title: Text('2'),
              content: Column(
                children: [
                  CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.parse('20231212'),
                    onDateChanged: (value) => print('value'),
                  )
                ],
              )),
          Step(
              title: Text('3'),
              content: Column(
                children: [
                  TimePickerDialog(initialTime: TimeOfDay(hour: 00, minute: 00))
                ],
              )),
          Step(
              title: Text('Finalizar'),
              content: MaterialButton(
                color: Colors.blue,
                onPressed: () => print('Cadastrar'),
                child: Text('Marcar Jogo'),
              ))
        ],
      ),
    );
  }
}
