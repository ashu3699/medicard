import 'package:flutter/material.dart';
import 'package:medicard/user_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.person});
  final Person person;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    Person person = widget.person;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Details'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          // alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.lightBlue.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: ${person.name}',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'DOB: ${person.dob}',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Gender: ${person.gender}',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Blood Group: ${person.bloodGroup}',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Height: ${person.height} cm',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Weight: ${person.weight} kg',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Phone: ${person.phone}',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Next of Kin: ${person.nextOfKin}',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Diseases: ${person.migrane ? 'Migrane, ' : ''}${person.asthma ? 'Asthma, ' : ''}${person.diabetes ? 'Diabetes, ' : ''}${person.heartDisease ? 'Heart Disease, ' : ''}${(person.highBloodPressure ? 'High Blood Pressure, ' : '')}',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
