import 'package:etec_tcc/constants/constants.dart';
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
      body: Stack(
        children: [
          Positioned(
            top: -300,
            left: (MediaQuery.of(context).size.width * 1.4 - MediaQuery.of(context).size.width) / -2, //calculo para centralizar
            child: Container(
              width: MediaQuery.of(context).size.width * 1.4,
              height: MediaQuery.of(context).size.width * 1.4,
              decoration: const BoxDecoration(
                color: ConstantsColors.primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/images/logo.png', width: 300,),
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 20, bottom: 10, left: 10, right: 10),
                        child: Text(
                          'Juntos fortalecendo nossa comunidade.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
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
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
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
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ConstantsColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            if (form.currentState!.validate()) {
                              Navigator.of(context).pushNamed('/');
                              print('RM: ${rmController.text}');
                            }
                          },
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                                color: ConstantsColors
                                    .textColorOnPrimaryBackground),
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
                            color: Colors.black87,
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
        ],
      ),
    );
  }
}
