import 'package:flutter/material.dart';

class ConsultationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Consultation',
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
            SectionTitle(title: 'Consultation'),
            ReadOnlyField(
                label: 'ID Consultation',
                value: '21919006135_A00_0001_08022023_21901'),
            SizedBox(height: 16),
            DropdownField(
              label: 'Type Consultation',
              items: ['Frais Médicaments', 'Autre'],
            ),
            SizedBox(height: 16),
            DateField(label: 'Date de Soin'),
            SizedBox(height: 16),
            DateField(label: 'Date Consultation'),
            SizedBox(height: 16),
            DropdownField(
              label: 'Motif Consultation',
              items: ['Frais Médicaments', 'Autre'],
            ),
            SizedBox(height: 16),
            CustomTextField(label: 'Compte Rendu', isMultiline: true),
            SizedBox(height: 16),
            CustomTextField(label: 'N° Doc'),
            SizedBox(height: 16),
            CustomTextField(
                label: 'Résultat Médical/ParaClinique', isMultiline: true),
            SizedBox(height: 32),
            SectionTitle(title: 'Médecin Traitant'),
            CustomTextField(label: 'Nom', hintText: 'boukmadja haroun'),
            SizedBox(height: 16),
            DropdownField(
              label: 'Spécialité',
              items: ['Orthopédiste', 'Autre'],
            ),
            SizedBox(height: 16),
            CustomTextField(label: 'Adresse', hintText: 'ain azel setif'),
            SizedBox(height: 16),
            CustomTextField(label: 'N° Téléphone'),
            SizedBox(height: 16),
            CustomTextField(label: 'Mail', hintText: 'boukmadja haroun'),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle form submission
                },
                child: Text(
                  'Enregistrer',
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

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}

class ReadOnlyField extends StatelessWidget {
  final String label;
  final String value;

  const ReadOnlyField({required this.label, required this.value});

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
        Text(
          value,
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final bool isMultiline;

  const CustomTextField({
    required this.label,
    this.hintText,
    this.isMultiline = false,
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
          maxLines: isMultiline ? 4 : 1,
          decoration: InputDecoration(
            hintText: hintText ?? '......................',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdownField extends StatelessWidget {
  final String label;
  final List<String> items;

  const DropdownField({required this.label, required this.items});

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
            ),
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: (value) {
            // Handle value change
          },
        ),
      ],
    );
  }
}

class DateField extends StatelessWidget {
  final String label;

  const DateField({required this.label});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: label,
      hintText: 'dd/mm/yyyy',
    );
  }
}
