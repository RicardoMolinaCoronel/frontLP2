import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/theme/app_theme.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/presentation/models/Post.dart';
import 'package:flutter_application_1/presentation/models/Event.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/presentation/models/connection.dart';

class CreateView extends StatefulWidget {
  const CreateView({super.key});

  @override
  State<CreateView> createState() => _CreateViewState();
}

File? images;

class _CreateViewState extends State<CreateView> {
  var _currentSelectedDate;
  int count = 0;
  TextEditingController titulo = TextEditingController();
  TextEditingController texto = TextEditingController();

  TextEditingController tituloPost = TextEditingController();
  TextEditingController textoPost = TextEditingController();
  DateTime dateEvent = DateTime.now();
  void callDatePicker() async {
    var selectedDate = await getDatePickerWidget();
    setState(() {
      dateEvent = selectedDate!;
    });
  }

  Future<DateTime?> getDatePickerWidget() {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2024),
        builder: (context, child) {
          return Theme(data: ThemeData.dark(), child: child!);
        });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double sizedBoxHeight = screenHeight * 0.9;
    String tituloVentana = "Titulo";
    String descripcionVentana = "Escribe tu texto aquí...";
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
                                            color: Color.fromARGB(
                                                255, 160, 160, 160),
                                            fontSize:
                                                15, // Tamaño de fuente opcional
                                          ),
                                        ),
                                        Text(
                                          'Creador de Publicaciones ',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 160, 160, 160),
                                            fontSize:
                                                13, // Tamaño de fuente opcional
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  SizedBox(height: 10),
                                  TextField(
                                    controller: tituloPost,
                                    maxLines: 1,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 107, 107, 107),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                    decoration: InputDecoration(
                                        hintText: tituloVentana,
                                        hintStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 107, 107, 107),
                                            fontSize: 24)),
                                  ),
                                  TextFormField(
                                    controller: textoPost,
                                    maxLines: 5,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 107, 107, 107),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                    decoration: InputDecoration(
                                      hintText: descripcionVentana,
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 107, 107, 107),
                                          fontSize: 18),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(children: [
                                    SizedBox(width: 20),
                                    GestureDetector(
                                      child: Icon(
                                        Icons.image_search,
                                        color: Colors.grey,
                                        size: 35,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          // COLOCAR FUNCION AQUI
                                          selectImg();
                                        });
                                      },
                                    ),
                                    SizedBox(width: 210),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppTheme.colors.red4),
                                      onPressed: () async {
                                        final nuevoPost = Post(
                                          title: tituloPost.text,
                                          description: textoPost.text,
                                          urlImg: 'URL de la imagen',
                                          likes: 0,
                                          comments: 0,
                                          shares: 0,
                                          dateCreated:
                                              DateTime.now().toString(),
                                          isLiked: false,
                                        );
                                        await crearPost(nuevoPost);
                                        setState(() {
                                          tituloPost.text = "";
                                          textoPost.text = "";
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Text('Crear',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15)),
                                    ),
                                  ]),
                                  Center(
                                      child: images != null
                                          ? Image.file(
                                              images!,
                                              fit: BoxFit.cover,
                                            )
                                          : const Icon(Icons.image,
                                              size: 160, color: Colors.grey))
                                ]),
                          ),
                        ),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(240, 40),
                  backgroundColor: AppTheme.colors.red1,
                )),
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
                                controller: titulo,
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
                                controller: texto,
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
                                SizedBox(width: 10),
                                GestureDetector(
                                  child: Icon(
                                    Icons.image_search,
                                    color: Colors.grey,
                                    size: 35,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      // COLOCAR FUNCION
                                      selectImg();
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
                                    callDatePicker();
                                  },
                                ),
                                SizedBox(width: 170),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppTheme.colors.red4),
                                  onPressed: () async {
                                    // Lógica para guardar el comentario
                                    final nuevoEvento = Event(
                                      title: titulo.text,
                                      description: texto.text,
                                      nameEvent: "a",
                                      place: "Cuenca",
                                      urlImg: 'URL de la imagen',
                                      likes: 0,
                                      comments: 0,
                                      shares: 0,
                                      dateCreated: DateTime.now().toString(),
                                      date: dateEvent.toString(),
                                      isLiked: false,
                                    );
                                    await crearEvent(nuevoEvento);
                                    setState(() {
                                      titulo.text = "";
                                      texto.text = "";
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Crear',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              ]),
                              Center(
                                  child: images != null
                                      ? Image.file(
                                          images!,
                                          fit: BoxFit.cover,
                                        )
                                      : const Icon(
                                          Icons.image,
                                          size: 160,
                                          color: Colors.grey,
                                        ))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(240, 40),
                backgroundColor: AppTheme.colors.red1,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Future selectImg() async {
    XFile? picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picture == null) {
      return;
    }
    setState(() {
      images = File(picture.path);
    });
  }
}

Future<void> crearPost(Post post) async {
  String ipPuerto = Connection.direccionIp + ":" + Connection.puerto;
  final url = Uri.parse('http://' +
      ipPuerto +
      '/rest/publicacion/save'); // Reemplaza con la URL de tu API
  final headers = {'Content-Type': 'application/json'};
  final jsonPost = jsonEncode(post.toJson()); // Convierte el objeto Post a JSON

  final response = await http.post(
    url,
    headers: headers,
    body: jsonPost,
  );

  if (response.statusCode == 201) {
    // La solicitud fue exitosa (código 201 indica creación exitosa)
    print('El objeto Post se creó con éxito');

    final responseData = jsonDecode(response.body);
    print('Respuesta de la API: $responseData');
  } else {
    // Hubo un error en la solicitud
    print('Error al crear el objeto Post');
    print(response
        .body); // Puedes imprimir la respuesta para obtener más detalles
  }
}

Future<void> crearEvent(Event event) async {
  String ipPuerto = Connection.direccionIp + ":" + Connection.puerto;
  final url = Uri.parse('http://' +
      ipPuerto +
      '/rest/evento/save'); // Reemplaza con la URL de tu API
  final headers = {'Content-Type': 'application/json'};
  final jsonPost =
      jsonEncode(event.toJson()); // Convierte el objeto Event a JSON

  final response = await http.post(
    url,
    headers: headers,
    body: jsonPost,
  );

  if (response.statusCode == 201) {
    // La solicitud fue exitosa (código 201 indica creación exitosa)
    print('El objeto Post se creó con éxito');

    final responseData = jsonDecode(response.body);
    print('Respuesta de la API: $responseData');
  } else {
    // Hubo un error en la solicitud
    print('Error al crear el objeto Post');
    print(response
        .body); // Puedes imprimir la respuesta para obtener más detalles
  }
}

Future<void> crearPost2(Post post) async {
  final url = Uri.parse(
      "http://192.168.1.36:3000/rest/publicacion/save"); // Reemplaza con la URL de tu API
  var request = http.MultipartRequest("POST", url);

  request.fields["titulo"] = post.title;
  request.fields["descripcion"] = post.description;
  request.fields["fechacreacion"] = post.dateCreated;
  request.fields["urlimg"] = post.urlImg;

  final response = await request.send();

  response.stream.transform(utf8.decoder).listen((event) {
    print(event);
  });
}
