import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final form = GlobalKey<FormState>();
  final TextEditingController rmController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Image.asset('assets/images/logo.png'),
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 20, bottom: 10, left: 10, right: 10),
                    child: Text(
                      'Juntos fortalecendo nossa comunidade.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Form(
                    key: form,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: rmController,
                          decoration: InputDecoration(
                            labelText: 'Informe seu RM',
                            labelStyle: const TextStyle(
                              color: Colors.black87,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.white70,
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            focusColor: Colors.red,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                          style: const TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              labelStyle: const TextStyle(
                                color: Colors.black87,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.white70,
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              focusColor: Colors.red,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                            style: const TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (form.currentState!.validate()) {
                          print('RM: ${rmController.text}');
                        }
                      },
                      child: const Text(
                        'Entrar',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Não possui uma conta?',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Crie uma!',
                        style: TextStyle(
                          color: Colors.blue[200],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
