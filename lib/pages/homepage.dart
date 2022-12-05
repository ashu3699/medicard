import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../user_model.dart';
import 'search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// checkbox for migrane,asthma,diabetes,heart disease,high blood pressure,

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _bloodGroupController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _nextOfKinController = TextEditingController();

  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  List<String> genderList = ['Male', 'Female', 'Others'];
  List<String> bloodGroupList = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];

  bool _migrane = false;
  bool _asthma = false;
  bool _diabetes = false;
  bool _heartDisease = false;
  bool _highBloodPressure = false;

  final box = Hive.box<Person>('personList');

  //getKEy
  String getKey() {
    var key = '';
    var chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    for (var i = 0; i < 10; i++) {
      key += chars[Random().nextInt(chars.length)];
    }
    return key;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const FindUser();
          }));
        },
        child: const Icon(Icons.search),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            alignment: Alignment.center,
            width: double.infinity,
            child: const Text('Register New Patient',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    DropdownButtonFormField(
                      items: genderList.map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _genderController.text = value!;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Gender',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select gender';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    DropdownButtonFormField(
                      items: bloodGroupList.map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _bloodGroupController.text = value!;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Blood Group',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select blood group';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    //weight,height
                    TextFormField(
                      controller: _weightController,
                      decoration: const InputDecoration(
                        labelText: 'Weight',
                        suffixText: 'kg',
                        border: OutlineInputBorder(),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                      ],
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter weight';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _heightController,
                      decoration: const InputDecoration(
                        labelText: 'Height',
                        suffixText: 'cm',
                        border: OutlineInputBorder(),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                      ],
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter height';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _phoneNumberController,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _dobController,
                      decoration: const InputDecoration(
                        labelText: 'Date of Birth',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      onTap: () async {
                        var pickedDate = await showDatePicker(
                          context: context,
                          initialDatePickerMode: DatePickerMode.year,
                          initialDate: DateTime(2000),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _dobController.text =
                                DateFormat('dd-MM-yyyy').format(pickedDate);
                          });
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter date of birth';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _nextOfKinController,
                      decoration: const InputDecoration(
                        labelText: 'Next of Kin',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter next of kin';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Checkbox(
                          value: _migrane,
                          onChanged: (value) {
                            setState(() {
                              _migrane = value!;
                            });
                          },
                        ),
                        const Text('Migrane'),
                        Checkbox(
                          value: _asthma,
                          onChanged: (value) {
                            setState(() {
                              _asthma = value!;
                            });
                          },
                        ),
                        const Text('Asthma'),
                        Checkbox(
                          value: _diabetes,
                          onChanged: (value) {
                            setState(() {
                              _diabetes = value!;
                            });
                          },
                        ),
                        const Text('Diabetes'),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: _heartDisease,
                          onChanged: (value) {
                            setState(() {
                              _heartDisease = value!;
                            });
                          },
                        ),
                        const Text('Heart Disease'),
                        Checkbox(
                          value: _highBloodPressure,
                          onChanged: (value) {
                            setState(() {
                              _highBloodPressure = value!;
                            });
                          },
                        ),
                        const Text('High Blood Pressure'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final person = Person(
                            uid: getKey(),
                            name: _nameController.text,
                            gender: _genderController.text,
                            bloodGroup: _bloodGroupController.text,
                            phone: _phoneNumberController.text,
                            dob: _dobController.text,
                            nextOfKin: _nextOfKinController.text,
                            migrane: _migrane,
                            asthma: _asthma,
                            diabetes: _diabetes,
                            heartDisease: _heartDisease,
                            highBloodPressure: _highBloodPressure,
                            weight: _weightController.text,
                            height: _heightController.text,
                          );
                          box.add(person);

                          //show dialog
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Registration successful'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(height: 10),
                                    Text('UID: ${person.uid}'),
                                    const SizedBox(height: 10),
                                    Text('Name: ${person.name}'),
                                    const SizedBox(height: 10),
                                    Text('Name: ${person.dob}'),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                      ),
                      child: const Text('Register'),
                    ),
                    const SizedBox(height: 10),
                  ],
                )),
          )
        ],
      )),
    );
  }
}
