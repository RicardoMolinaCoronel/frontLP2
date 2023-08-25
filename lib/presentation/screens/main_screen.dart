import 'package:flutter_application_1/presentation/views/posts_view.dart';
import 'package:flutter_application_1/presentation/views/events_view.dart';
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
    final colors = Theme.of(context).colorScheme;

    final screens = [const PostsView(), const EventsView()];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
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
            backgroundColor: colors.primary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.star_border),
            activeIcon: const Icon(Icons.star),
            label: 'Events',
            backgroundColor: colors.tertiary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.create_outlined),
            activeIcon: const Icon(Icons.create),
            label: 'Create',
            backgroundColor: colors.tertiary,
          ),
        ],
      ),
    );
  }
}
