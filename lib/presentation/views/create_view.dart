import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/theme/app_theme.dart';

class CreateView extends StatefulWidget {
  const CreateView({super.key});

  @override
  State<CreateView> createState() => _CreateViewState();
}

class _CreateViewState extends State<CreateView> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double sizedBoxHeight = screenHeight * 0.9;

    return Scaffold(
      backgroundColor: AppTheme.colors.blue1,
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                const Text(
                  'Crear Publicacion',
                  style: TextStyle(
                    color: Color.fromARGB(255, 29, 29,
                        29), // Cambia este color según tus necesidades
                    fontSize: 18, // Tamaño de fuente opcional
                    fontWeight: FontWeight.bold, // Peso de fuente opcional
                  ),
                ),
                Icon(
                  Icons.post_add,
                  color: Color.fromARGB(255, 29, 29, 29),
                  size: 27,
                ),
              ]),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled:
                      true, // Permite que el contenido desborde la pantalla
                  builder: (BuildContext context) {
                    return Container(
                      // Use a Container here
                      color: AppTheme.colors.red2,
                      child: FractionallySizedBox(
                        heightFactor: 0.8, // 80% de la pantalla
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                  size: 35,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Jacob Hanks ',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 160, 160, 160),
                                        fontSize:
                                            15, // Tamaño de fuente opcional
                                      ),
                                    ),
                                    Text(
                                      'Creador de Eventos ',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 160, 160, 160),
                                        fontSize:
                                            13, // Tamaño de fuente opcional
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                              SizedBox(height: 10),
                              TextField(
                                maxLines: 1,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 107, 107, 107),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                    hintText: 'Titulo',
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 107, 107, 107),
                                        fontSize: 24)),
                              ),
                              TextFormField(
                                maxLines: 5,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 107, 107, 107),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                                decoration: InputDecoration(
                                  hintText: 'Escribe tu texto aquí...',
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 107, 107, 107),
                                      fontSize: 18),
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(children: [
                                SizedBox(width: 20),
                                GestureDetector(
                                  child: Icon(
                                    Icons.image,
                                    color: Colors.grey,
                                    size: 35,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      // COLOCAR FUNCION AQUI
                                    });
                                  },
                                ),
                                SizedBox(width: 210),
                                ElevatedButton(
                                  onPressed: () {
                                    // Lógica para guardar el comentario
                                    Navigator.pop(context);
                                  },
                                  child: Text('Crear'),
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppTheme.colors.red1),
              ),
            ),
            ElevatedButton(
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                const Text(
                  'Crear Evento',
                  style: TextStyle(
                    color: Color.fromARGB(255, 29, 29,
                        29), // Cambia este color según tus necesidades
                    fontSize: 18, // Tamaño de fuente opcional
                    fontWeight: FontWeight.bold, // Peso de fuente opcional
                  ),
                ),
                Icon(
                  Icons.event_available,
                  color: Color.fromARGB(255, 29, 29, 29),
                  size: 27,
                ),
              ]),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled:
                      true, // Permite que el contenido desborde la pantalla
                  builder: (BuildContext context) {
                    return Container(
                      // Use a Container here
                      color: AppTheme.colors.red2,
                      child: FractionallySizedBox(
                        heightFactor: 0.8, // 80% de la pantalla
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                  size: 35,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Jacob Hanks ',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 160, 160, 160),
                                        fontSize:
                                            15, // Tamaño de fuente opcional
                                      ),
                                    ),
                                    Text(
                                      'Creador de Eventos ',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 160, 160, 160),
                                        fontSize:
                                            13, // Tamaño de fuente opcional
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                              SizedBox(height: 10),
                              TextField(
                                maxLines: 1,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 107, 107, 107),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                    hintText: 'Titulo',
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 107, 107, 107),
                                        fontSize: 24)),
                              ),
                              TextFormField(
                                maxLines: 5,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 107, 107, 107),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                                decoration: InputDecoration(
                                  hintText: 'Escribe tu texto aquí...',
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 107, 107, 107),
                                      fontSize: 18),
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(children: [
                                SizedBox(width: 20),
                                GestureDetector(
                                  child: Icon(
                                    Icons.image,
                                    color: Colors.grey,
                                    size: 35,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      // COLOCAR FUNCION AQUI
                                    });
                                  },
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  child: Icon(
                                    Icons.event,
                                    color: Colors.grey,
                                    size: 35,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      // COLOCAR FUNCION AQUI
                                    });
                                  },
                                ),
                                SizedBox(width: 170),
                                ElevatedButton(
                                  onPressed: () {
                                    // Lógica para guardar el comentario
                                    Navigator.pop(context);
                                  },
                                  child: Text('Crear'),
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppTheme.colors.red1),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
