import 'package:flutter/material.dart';
import 'color_schemes.dart';

void main() => runApp(const ConvertreApp());

class ConvertreApp extends StatefulWidget {
  const ConvertreApp({super.key});

  @override
  State<ConvertreApp> createState() => _ConvertreAppSate();
}

class _ConvertreAppSate extends State<ConvertreApp> {
  final textEditingController = TextEditingController();
  var _darkMode = false;

  void _changeDarkMode(bool darkMode) {
    setState(() {
      _darkMode = darkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Convertre',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme
      ),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme
      ),
      themeMode: _darkMode? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Convertre"),
          actions: [
            Switch(
                value: _darkMode,
                onChanged: _changeDarkMode
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text("TEST")
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "변환할 단위 입력",
                      ),
                      controller: textEditingController,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
