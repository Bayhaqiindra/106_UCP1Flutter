import 'package:flutter/material.dart';

class DataPelangganPage extends StatefulWidget {
  const DataPelangganPage({Key? key}) : super(key: key);

  @override
  _DataPelangganPageState createState() => _DataPelangganPageState();
}

class _DataPelangganPageState extends State<DataPelangganPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController hpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kodePosController = TextEditingController();

  bool _autoValidate = false;

  void resetForm() {
    namaController.clear();
    emailController.clear();
    hpController.clear();
    alamatController.clear();
    provinsiController.clear();
    kodePosController.clear();
    _formKey.currentState?.reset();
    setState(() {
      _autoValidate = false; 
    });
  }

  InputDecoration buildInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color.fromARGB(255, 78, 78, 78)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color.fromARGB(255, 78, 78, 78)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
    );
  }

  Widget buildTextField({
    required String label,
    required TextEditingController controller,
    required String errorMsg,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: buildInputDecoration(label),
          autovalidateMode:
              _autoValidate
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return errorMsg;
            }
            return null;
          },
          onChanged: (value) {
            if (_autoValidate) {
              _formKey.currentState
                  ?.validate(); // kalau sudah autoValidate, realtime cek
            }
          },
        ),
      ],
    );
  }
