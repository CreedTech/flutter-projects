class Entry {
  final String title;
  final List<Entry> children;

  const Entry(this.title, [this.children = const <Entry>[]]);
}

//data to display
const List<Entry> data = <Entry>[
  Entry(
    'Animations',
    <Entry>[
      Entry('Fancy App Bar'),
      Entry('Item a2'),
    ],
  ),
  Entry(
    'Page 2',
    <Entry>[
          Entry('Item b1'),
          Entry('Item b2'),
    ],
  ),
  Entry(
    'Page 2',
    <Entry>[
          Entry('Item b1'),
          Entry('Item b2'),
    ],
  ),
  Entry(
    'Page 2',
    <Entry>[
          Entry('Item b1'),
          Entry('Item b2'),
    ],
  ),
];


