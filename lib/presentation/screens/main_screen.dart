//import 'dart:html';

import 'package:flutter_application_1/presentation/views/posts_view.dart';
import 'package:flutter_application_1/presentation/views/events_view.dart';
import 'package:flutter_application_1/presentation/views/create_view.dart';
import 'package:flutter_application_1/presentation/models/post.dart';
import 'package:flutter_application_1/presentation/models/event.dart';

import 'package:flutter_application_1/presentation/theme/app_theme.dart';

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    //final colors = Theme.of(context).colorScheme;
    const colors = AppTheme.colors;
    List<Post> posts = [
      Post(
          title: "Exoprimial",
          description:
              "Sin duda, Capcom vive una segunda era de oro desde hace un puñado de años. Aunque tuvo deslices como el controversial Resident Evil 3 Remake, en general entregó experiencias de muy buena calidad que conquistaron los corazones de los fanáticos y vendieron millones de copias. Por desgracia, su racha positiva terminó con su más reciente lanzamiento",
          comments: 5,
          likes: 2,
          shares: 1,
          dateCreated: "noviembre",
          urlImg: "https://i.ibb.co/pzy6CDg/exo.jpg",
          isLiked: false),
      Post(
          title: "Blasphemous 2",
          description:
              "Blasphemous 2 es todo lo que deseábamos y más; es una secuela hecha como dictan los cánones, porque respeta todo lo que el original logró y lo expande enormemente. ¿Es necesario haber jugado el primero? No. ",
          comments: 5,
          likes: 2,
          shares: 1,
          dateCreated: "noviembre",
          urlImg: "https://i.ibb.co/qnxLs0g/blasphemous2.jpg",
          isLiked: true),
      Post(
          title: "Resident evil goty",
          description:
              "Resident Evil 4 conserva la esencia del juego original, a la vez que introduce mecánicas de juego actualizadas.",
          comments: 5,
          likes: 2,
          shares: 1,
          dateCreated: "noviembre",
          urlImg: "https://i.ibb.co/Bt5P84F/residentevil4.jpg",
          isLiked: true),
      Post(
          title: "Resident evil sobrevalo?",
          description:
              "Los shooters en primera persona son uno de los géneros más explotados en la industria de los videojuegos. La mayoría de estas propuestas optan por una ambi",
          comments: 5,
          likes: 2,
          shares: 1,
          dateCreated: "noviembre",
          urlImg:
              "https://i.pinimg.com/originals/1c/aa/03/1caa032c47f63d50902b9d34492e1303.jpg",
          isLiked: true),
      Post(
          title: "Blasphomius 2?",
          description:
              "Blasphemous 2 es todo lo que deseábamos y más; es una secuela hecha como dictan los cánones, porque respeta todo lo que el original logró y lo expande enormemente. ¿Es necesario haber jugado el primero? No. ",
          comments: 5,
          likes: 2,
          shares: 1,
          dateCreated: "noviembre",
          urlImg:
              "https://i.pinimg.com/originals/1c/aa/03/1caa032c47f63d50902b9d34492e1303.jpg",
          isLiked: true)
    ];

    //Lista de Eventos

    List<Event> events = [
      Event(
          title: "Están invitados a este torneo de SF.",
          description: "Street Figther",
          nameEvent: "Torneo de Street Figther",
          place: "Guayaquil",
          comments: 8,
          likes: 5,
          shares: 3,
          dateCreated: "Jueves, 19 de mayo",
          date: "2023-09-18 20:30:45",
          urlImg: "https://i.ibb.co/6WwcvYF/Street-Figther.jpg",
          isLiked: false),
      Event(
          title: "Esto va a ser asombroso",
          description: "Smash Bros",
          nameEvent: "Torneo de Smash Bros",
          place: "Quito", 
          comments: 4,
          likes: 6,
          shares: 2,
          dateCreated: "Viernes, 20 de mayo",
          date: "2023-09-09 02:00:00",
          urlImg: "https://i.ibb.co/G3TLGmT/Ultimate.jpg",
          isLiked: true),
    ];

    //Lista de Eventos

    final screens = [PostsView(posts), const EventsView(), const CreateView()];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.red1,
        elevation: 0,
        centerTitle: true,
        title: const Text("G A M M U N I T Y",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 27, 27, 27))),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: Color.fromRGBO(37, 37, 37, 1)),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.person, color: Color.fromRGBO(37, 37, 37, 1)))
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.book_outlined,
              color: Color.fromRGBO(37, 37, 37, 1),
            ),
            activeIcon:
                const Icon(Icons.book, color: Color.fromRGBO(37, 37, 37, 1)),
            label: 'Posts',
            backgroundColor: colors.red1,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.star_border,
                color: Color.fromRGBO(37, 37, 37, 1)),
            activeIcon:
                const Icon(Icons.star, color: Color.fromRGBO(37, 37, 37, 1)),
            label: 'Events',
            backgroundColor: colors.red1,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.create_outlined,
                color: Color.fromRGBO(37, 37, 37, 1)),
            activeIcon:
                const Icon(Icons.create, color: Color.fromRGBO(37, 37, 37, 1)),
            label: 'Create',
            backgroundColor: colors.red1,
          ),
        ],
        selectedItemColor: Color.fromRGBO(37, 37, 37, 1),
      ),
    );
  }
}
