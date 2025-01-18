import 'package:casnos/ConsultationForm.dart';
import 'package:flutter/material.dart';

class MedicalForm extends StatefulWidget {
  @override
  _MedicalFormState createState() => _MedicalFormState();
}

class _MedicalFormState extends State<MedicalForm> {
  String? consultationType = 'A domicile'; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Formulaire Médical',
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
            SectionTitle(title: 'Infos Générales'),
            CustomTextField(label: 'Poids (kg)'),
            SizedBox(height: 16),
            CustomTextField(label: 'Taille (cm)'),
            SizedBox(height: 16),
            CustomTextField(label: 'IMC', hintText: 'Calculé automatiquement'),
            SizedBox(height: 16),
            DropdownField(
              label: 'Tour de Taille',
              items: ['Petit', 'Moyen', 'Grand'],
            ),
            SizedBox(height: 32),
            SectionTitle(title: 'Tension Artérielle'),
            CustomTextField(label: 'TA SYS'),
            SizedBox(height: 16),
            CustomTextField(label: 'TA DYS'),
            SizedBox(height: 16),
            CustomTextField(label: 'TA PULS'),
            SizedBox(height: 32),
            SectionTitle(title: 'Mode de Vie'),
            CheckboxField(label: 'Tabagisme'),
            CheckboxField(label: 'Consommation d\'Alcool'),
            CheckboxField(label: 'Alimentation Malsaine'),
            CheckboxField(label: 'Sédentarité'),
            SizedBox(height: 32),
            SectionTitle(title: 'Niveau de Stress'),
            DropdownField(
              label: 'Stress',
              items: ['Bas', 'Moyen', 'Élevé'],
            ),
            SizedBox(height: 32),
            SectionTitle(title: 'Consultation'),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: Text('À domicile'),
                    value: 'A domicile',
                    groupValue: consultationType,
                    onChanged: (value) {
                      setState(() {
                        consultationType = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text('Agence'),
                    value: 'Agence',
                    groupValue: consultationType,
                    onChanged: (value) {
                      setState(() {
                        consultationType = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle form submission or navigation
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConsultationForm()));
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

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hintText;

  const CustomTextField({
    required this.label,
    this.hintText,
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

class CheckboxField extends StatefulWidget {
  final String label;

  const CheckboxField({required this.label});

  @override
  _CheckboxFieldState createState() => _CheckboxFieldState();
}

class _CheckboxFieldState extends State<CheckboxField> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
        ),
        Text(
          widget.label,
          style: TextStyle(color: Colors.blue),
        ),
      ],
    );
  }
}
