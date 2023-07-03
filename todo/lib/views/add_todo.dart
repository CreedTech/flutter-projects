import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/adapter/todo_adapter.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final formKey = GlobalKey<FormState>();

  late String title, description;

  submitData() async {
    if (formKey.currentState!.validate()) {
      Box<Todo> todoBox = Hive.box<Todo>('todos');
      todoBox.add(Todo(title: title, description: description));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        centerTitle: true,
        title: const Text(
          'Add Todo',
          style: TextStyle(
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                hintText: 'Add Title',
              ),
              onChanged: (value){
                setState(() {
                  title = value;
                });
              },
            ),
             TextFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                hintText: 'Add Description',
              ),
              onChanged: (value){
                setState(() {
                  description = value;
                });
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.purple[900])
              ),
              onPressed: submitData,
              child: const Text(
                'Submit Data'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
