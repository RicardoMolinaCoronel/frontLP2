import 'package:flutter_application_1/presentation/views/posts_view.dart';
import 'package:flutter_application_1/presentation/views/events_view.dart';
import 'package:flutter_application_1/presentation/views/create_view.dart';
import 'package:flutter_application_1/presentation/models/post.dart';
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
    final colors = AppTheme.colors;
    List<Post> posts = [
      Post(
          title: "Resident evil el mejor game",
          description:
              "Blasphemous 2 es todo lo que deseábamos y más; es una secuela hecha como dictan los cánones, porque respeta todo lo que el original logró y lo expande enormemente. ¿Es necesario haber jugado el primero? No. ",
          comments: 5,
          likes: 2,
          shares: 1,
          dateCreated: "noviembre",
          urlImg:
              "https://i.pinimg.com/originals/1c/aa/03/1caa032c47f63d50902b9d34492e1303.jpg",
          isLiked: false),
      Post(
          title: "Resident evil goty",
          description:
              "Blasphemous 2 brilla gracias a su combate estilo souls lleno de ejecuciones, mucha precisión y violencia que está lejos de ser innecesaria y hasta roza lo estético.",
          comments: 5,
          likes: 2,
          shares: 1,
          dateCreated: "noviembre",
          urlImg:
              "https://i.pinimg.com/originals/1c/aa/03/1caa032c47f63d50902b9d34492e1303.jpg",
          isLiked: true),
      Post(
          title: "Resident evil goty",
          description:
              "Con esto en mente, Ascendant Studios se embarcó en una tarea complicada: dar una bocanada de aire fresco al gén",
          comments: 5,
          likes: 2,
          shares: 1,
          dateCreated: "noviembre",
          urlImg:
              "https://i.pinimg.com/originals/1c/aa/03/1caa032c47f63d50902b9d34492e1303.jpg",
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
    final screens = [PostsView(posts), const EventsView(), const CreateView()];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.red1,
        elevation: 0,
        title: const Text("G A M M U N I T Y",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: Colors.white),
        ),
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
            icon: const Icon(Icons.book_outlined),
            activeIcon: const Icon(Icons.book),
            label: 'Posts',
            backgroundColor: colors.red1,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.star_border),
            activeIcon: const Icon(Icons.star),
            label: 'Events',
            backgroundColor: colors.red1,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.create_outlined),
            activeIcon: const Icon(Icons.create),
            label: 'Create',
            backgroundColor: colors.red1,
          ),
        ],
      ),
    );
  }
}
