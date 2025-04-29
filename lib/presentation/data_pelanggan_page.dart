import 'package:flutter/material.dart';
import 'package:ucp/presentation/detail_data_pelanggan.dart';

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
                  ?.validate();
            }
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.red,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'Data Pelanggan',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField(
                label: 'Nama Cust',
                controller: namaController,
                errorMsg: 'Cust tidak boleh kosong',
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: buildTextField(
                      label: 'Email',
                      controller: emailController,
                      errorMsg: 'Email tidak boleh kosong',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: buildTextField(
                      label: 'No Hp',
                      controller: hpController,
                      errorMsg: 'No Hp tidak boleh kosong',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              buildTextField(
                label: 'Alamat',
                controller: alamatController,
                errorMsg: 'Alamat tidak boleh kosong',
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: buildTextField(
                      label: 'Provinsi',
                      controller: provinsiController,
                      errorMsg: 'Provinsi tidak boleh kosong',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: buildTextField(
                      label: 'Kode Pos',
                      controller: kodePosController,
                      errorMsg: 'Kode Pos tidak boleh kosong',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Tombol Simpan
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _autoValidate = true; // Mulai autovalidasi
                    });
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DetailPelangganPage(
                                nama: namaController.text,
                                email: emailController.text,
                                hp: hpController.text,
                                alamat: alamatController.text,
                                provinsi: provinsiController.text,
                                kodePos: kodePosController.text,
                              ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Simpan',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Tombol Reset
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: resetForm,
                  child: const Text(
                    'Reset',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
