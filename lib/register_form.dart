import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyRegisterForm extends StatefulWidget {
  const MyRegisterForm({Key? key}) : super(key: key);

  @override
  State<MyRegisterForm> createState() => _MyRegisterFormState();
}

class _MyRegisterFormState extends State<MyRegisterForm> {
  late int _groupValueJK = 0;
  final List<String> _agama = [
    'Islam',
    'Kristen',
    'Budha',
    'Hindu',
    'Koghuchu'
  ];
  String _nAgama = 'Islam';

  TextEditingController namaCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController motoCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: namaCtrl,
                decoration: InputDecoration(
                  hintText: 'Nama Lengkap',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: motoCtrl,
                minLines: 3,
                maxLines: 10,
                decoration: InputDecoration(
                    hintText: 'Moto Hidup',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Radio(
                    value: 0,
                    groupValue: _groupValueJK,
                    onChanged: (int? i) {
                      setState(
                        () {
                          _groupValueJK = i!;
                        },
                      );
                    },
                  ),
                  const Text(
                    'Laki-laki',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  Radio(
                    value: 1,
                    groupValue: _groupValueJK,
                    onChanged: (int? i) {
                      setState(
                        () {
                          _groupValueJK = i!;
                        },
                      );
                    },
                  ),
                  const Text(
                    'Perempuan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Agama :',
                style: TextStyle(color: Colors.blue),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                child: DropdownButtonFormField(
                  onChanged: (String? value) {
                    setState(() {
                      _nAgama = value!;
                    });
                  },
                  value: _nAgama,
                  items: _agama
                      .map(
                        (String value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: MaterialButton(
                  height: 50,
                  color: Colors.black,
                  textColor: Colors.white,
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg:
                            "Nama Lengkap : ${namaCtrl.text}\nPassword : ${passCtrl.text}\nMoto hidup : ${motoCtrl.text}\nJenis Kelamin :${(_groupValueJK == 0) ? "Laki" : "Wanita"}\nAgama : $_nAgama",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 20.0);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
