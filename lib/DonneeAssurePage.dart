import 'package:casnos/DonneeAdministrativePage.dart';
import 'package:flutter/material.dart';

class DonneeAssurePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Donnee Assuré',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropdown(
              label: 'Ayant droit',
              items: ['00: Conjoint', '01: Enfant 1', '02: Enfant 2'],
            ),
            SizedBox(height: 16),
            CustomTextField(label: 'Nom'),
            SizedBox(height: 16),
            CustomTextField(label: 'Prenom'),
            SizedBox(height: 16),
            CustomTextField(
              label: 'Date de naissance',
              suffixIcon: Icon(Icons.calendar_today, color: Colors.blue),
            ),
            SizedBox(height: 16),
            CustomTextField(label: 'Adresse'),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child:
                      CustomDropdown(label: 'Sexe', items: ['Homme', 'Femme']),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: CustomDropdown(
                    label: 'Situation familiale',
                    items: ['Célibataire', 'Marié', 'Divorcé', 'Veuf'],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            CustomDropdown(
              label: 'Groupe sanguin',
              items: ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'],
            ),
            SizedBox(height: 16),
            CustomTextField(label: 'Email', hintText: '.....@.....com'),
            SizedBox(height: 16),
            CustomTextField(
              label: 'Numéro de téléphone',
              hintText: '+213',
            ),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DonneeAdministrativePage()));
                },
                child: Text(
                  'Suivant',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final Widget? suffixIcon;

  const CustomTextField({
    required this.label,
    this.hintText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hintText ?? '......................',
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final String label;
  final List<String> items;

  const CustomDropdown({
    required this.label,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: (value) {
            // Handle dropdown selection
          },
        ),
      ],
    );
  }
}
