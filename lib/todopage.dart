// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todoapp/utilities.dart';

import 'createpage.dart';

class todoapp extends StatelessWidget {
  todoapp({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> completedTask = [];
  final List<Map<String, dynamic>> mydatabase = [
    {
      'name': 'Go to class',
      'response': 'Sure',
      'time': 'Today',
      'isCompleted': true
    },
    {
      'name': 'Play Football',
      'response': 'Yes I will',
      'time': 'Today',
      'isCompleted': true
    },
    {
      'name': 'Watch news?',
      'response': 'Alriht at 7:00 pm',
      'time': 'Yesterday',
      'isCompleted': false
    }
  ];

  @override
  Widget build(BuildContext context) {
    for (var element in mydatabase) {
      if (element['isCompleted'] == true) {
        completedTask.add(element);
      }
    }
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/profile.jpg'),
          ),
        ),
        title: Text(
          "My tasks",
          style: TextStyle(
              color: Colors.indigo.shade900, fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(
            Icons.filter_list,
            color: Colors.indigo.shade900,
          ),
          Icon(Icons.search_rounded, color: Colors.indigo.shade900)
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return listwidget(
                name: mydatabase[index]['name'],
                response: mydatabase[index]['response'],
               
                time: mydatabase[index]['time']);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 5,
            );
          },
          itemCount: mydatabase.length),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              showBarModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          return listwidget(
                              name: completedTask[index]['name'],
                              response: completedTask[index]['response'],
                              time: completedTask[index]['time']);
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: completedTask.length);
                  });
            },
            child: Card(
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.blue),
                 const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text("completed"),
                  ),
                 const Icon(Icons.arrow_drop_down),
                 const SizedBox(
                    width: 110,
                  ),
                  Text(completedTask.length.toString())
                ],
              ),
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  CreateTodo()));
        },
        child: const Icon(
          Icons.add,
          size: 50,
        ),
      ),
    );
  }
}

class listwidget extends StatelessWidget {
  const listwidget(
      {Key? key,
      required this.name,
      required this.response,
      
      required this.time})
      : super(key: key);

  final String name;
  final String response;

  
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, left: 15, right: 15),
      child: Column(
        children: [
          Card(
            elevation: 2,
            child: ListTile(
              leading: Icon(
                Icons.check_circle_outline,
                color: color(time),
                size: 20,
              ),
              title: Text(
                name,
                style: TextStyle(
                    color: Colors.indigo.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.5),
              ),
              minLeadingWidth: 2,
              horizontalTitleGap: 6,
              subtitle: Text(
                response,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 11.6,
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.notifications,
                      color: color(time),
                      size: 15,
                    ),
                    Text(
                      time,
                      style: TextStyle(
                          fontSize: 10, color: color(time)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
