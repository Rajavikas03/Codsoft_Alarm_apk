import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: Colors.white, fontSize: 30),
        ),
        iconTheme: const IconThemeData(color: Colors.white, size: 50),
        cardColor: Colors.transparent,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List isSwitch;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return
        // SingleChildScrollView(
        //   child:
        Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images.jpeg'), fit: BoxFit.cover),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 150,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ' Alarm ',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dailog(width: width, height: height);
                              });
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.add,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Card(
                            color: Theme.of(context).cardColor,
                            child: ListTile(
                              trailing: Switch(
                                  value: isSwitch[index],
                                  onChanged: (val) {
                                    setState(() {
                                      isSwitch[index] = val;
                                    });
                                  }),
                              title: Text(
                                'Time $index',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ));
                      }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    // );
  }
}

class Dailog extends StatelessWidget {
  const Dailog({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: width * 0.9,
      height: height * 0.4,
      child: AlertDialog(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
