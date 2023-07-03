import 'package:flutter/material.dart';
import 'package:flutter_todo_app/task.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Todo();
  }
}

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return const TodoState();
  }
}

class TodoState extends StatefulWidget {
  const TodoState({Key? key}) : super(key: key);
  @override
  _TodoStateState createState() => _TodoStateState();
}

class _TodoStateState extends State<TodoState> {
  // create list of tasks
  final List<Task> tasks = [];
  // function that modifies the state when a new task is created
  void onTaskCreated(String name) {
    setState(() {
      tasks.add(Task(name));
    });
  }

  @override
  Widget build(BuildContext context) {
    // define routes
    return MaterialApp(
      title: 'TODO APP',
      initialRoute: '/',
      routes: {
        // view task
        '/': (context) => TodoList(tasks: tasks),
        // pass func as callback
        '/create': (context) => TodoCreate(onCreate: onTaskCreated),
      },
    );
  }
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key, required this.tasks}) : super(key: key);
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO APP'),
      ),
      // listview.builder to render list of task
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].getName()),
          );
        },
      ),
      // open screen to create new task
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/create'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TodoCreate extends StatefulWidget {
  final Function onCreate;

  const TodoCreate({Key? key, required this.onCreate}) : super(key: key);

  @override
  State<TodoCreate> createState() => _TodoCreateState();
}

class _TodoCreateState extends State<TodoCreate> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a Task'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            autofocus: true,
            controller: controller,
            decoration:
                const InputDecoration(labelText: 'Enter name for your task'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.done),
        onPressed: () {
          widget.onCreate(controller.text);
          Navigator.pop(context);
        },
      ),
    );
  }
}
