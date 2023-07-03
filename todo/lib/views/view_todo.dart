import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/adapter/todo_adapter.dart';
import 'package:todo/views/add_todo.dart';

class ViewTodoList extends StatefulWidget {
  const ViewTodoList({Key? key}) : super(key: key);

  @override
  _ViewTodoListState createState() => _ViewTodoListState();
}

class _ViewTodoListState extends State<ViewTodoList> {
  // late Box todoBox;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lazy\'s Todo'),
        centerTitle: true,
        backgroundColor: Colors.purple[900],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[900],
        onPressed: () {
          Get.to(const AddTodo());
        },
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
          valueListenable: Hive.box<Todo>('todos').listenable(),
          builder: (context, Box box, _){
            if(box.values.isEmpty){
              return const Center(
                child: Text(
                  'No Task available',
                ),
              );
            }
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index){
                Todo? todoContent = box.getAt(index);
                return Card(
                  elevation: 5.0,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                    title: Text(todoContent!.title),
                    subtitle: Text(todoContent.description),
                    trailing: Icon(Icons.delete, color: Colors.purple[900],),
                  ),
                );
              },
            );
          }
      ),
    );
  }
}
