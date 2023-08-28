
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/components/item_event.dart';
import 'package:flutter_application_1/presentation/models/event.dart';
import 'package:flutter_application_1/presentation/models/post.dart';
import 'package:flutter_application_1/presentation/theme/app_theme.dart';


class EventsView extends StatefulWidget {
  List<Event> events;
  EventsView(this.events, {super.key});

  @override
  State<EventsView> createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.blue1,
      body: SafeArea(
        child: ListView.builder(
          itemCount: super.widget.events.length,
          itemBuilder: (context, index) {
            return ItemEvent(child: super.widget.events[index]);
          },
        ),
      ),
    );
  }

  Widget _recentEvents(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text(
            'For You',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    );
  }
}
