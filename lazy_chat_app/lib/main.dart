import 'package:flutter/material.dart';
import 'package:lazy_chat_app/view/channel_page.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

Future<void> main() async {
  const apiKey = "htfqv37jbwzh";
  const userToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibGF6eXByb2dyYW1tZXIifQ.u4GSTWgu19r8v47woBhg9BPzXvpW8fnZZr8ySajQZ_c";

  final client = StreamChatClient(
    apiKey,
    logLevel: Level.INFO,
  );

  await client.connectUser(
    User(
      id: 'lazyprogrammer',
      extraData: const {
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT--EIQS1UonOQVmTZuBM1QHV8wplcHZxgFvg&usqp=CAU'
      },
    ),
    userToken,
  );

  final channel = client.channel(
    'messaging',
    id: 'lazyProgrammer',
    extraData: {
      "name": 'Lazy Programmer',
      "image":
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT--EIQS1UonOQVmTZuBM1QHV8wplcHZxgFvg&usqp=CAU',
    },
  );

  channel.watch();

  runApp(MyApp(client, channel));
}

class MyApp extends StatelessWidget {
  final StreamChatClient client;
  final Channel channel;
  const MyApp(this.client, this.channel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xffc34c4c)));
    return MaterialApp(
      builder: (context, widget) {
        return StreamChat(
          client: client,
          child: widget,
          streamChatThemeData: StreamChatThemeData.fromTheme(theme),
        );
      },
      home: StreamChannel(
        channel: channel,
        child: ChannelPage(),
      ),
    );
  }
}


