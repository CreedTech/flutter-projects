class Task {
  // class Props
  late int _id;
  late String _name;
  late bool _completed;

  Task(this._name);
  // getter and setter
  getId() => _id;
  setId(id) => _id = id;

  getName() => _name;
  setName(name) => _name = name;

  isCompleted() => _completed;
  setCompleted(completed) => _completed = completed;

}