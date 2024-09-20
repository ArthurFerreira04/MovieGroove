import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  get GoogleFonts => null; //TESTANDO PRA VER SE O ERRO SOME!

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'), // Adicione sua imagem aqui
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Conteúdo sobreposto à imagem
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Padding para mover a logo para baixo
                Padding(
                  padding: const EdgeInsets.only(top: 150), // Mova a logo 50 pixels para baixo
                  child: Image.asset(
                    'assets/logo.png', // Adicione sua logo aqui
                    width: 350,
                    height: 450,
                  ),
                ),
                const SizedBox(height: 50), // Espaço entre logo e botões
                // Mell pegadora de agroboy 
                ElevatedButton(
                  onPressed: () {
                    // Ação do botão de login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00FF00), // Cor de fundo #00FF00
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.black, // enzo gosta de mãe solteira
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}