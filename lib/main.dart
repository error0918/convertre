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
  final _dropDownList = ["S1", "S2", "S3", "S4"];
  bool _darkMode = false;
  String? _dropDownValue;

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
                onChanged: (bool darkMode) {
                  setState(() {
                    _darkMode = darkMode;
                  });
                },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black26,
                          width: 1
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 5,
                          bottom: 5
                        ),
                        child: DropdownButton(
                          value: _dropDownValue,
                          items: _dropDownList.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (dynamic value) {
                            setState(() {
                              _dropDownValue = value;
                            });
                          },
                          icon: Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: const Icon(
                                Icons.arrow_circle_down_rounded
                              ),
                            ),
                          ),
                          hint: const Text("단위를 선택해주세요"),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    )
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
