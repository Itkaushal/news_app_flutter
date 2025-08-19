import 'package:flutter/material.dart';
import 'package:news_flutter_apk/providers/news_provider.dart';
import 'package:news_flutter_apk/screens/home_screen.dart';
import 'package:news_flutter_apk/screens/notification_screen.dart';
import 'package:news_flutter_apk/screens/profile_screen.dart';
import 'package:news_flutter_apk/screens/read_artical_screen.dart';
import 'package:news_flutter_apk/screens/search_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter News App',
          themeMode: ThemeMode.system,
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          home: MainScreen(),

      ),
    );
  }
}


class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
        body: Container(
                alignment: Alignment.topCenter,
                child: HomeScreen(),
        ),

        bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(
            ),
            notchMargin: 9,
            surfaceTintColor: Colors.black,
            elevation: 5,
            clipBehavior: Clip.antiAlias,
            padding: EdgeInsets.all(5.0),
            height: 60,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(icon: const Icon(Icons.home,color: Colors.red,), onPressed: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                  }),
                  IconButton(icon: const Icon(Icons.search,color: Colors.red,), onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => SearchScreen()));
                  }),
                  const SizedBox(width: 40), // FAB ke liye space
                  IconButton(icon: const Icon(Icons.notifications,color: Colors.red,), onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => NotificationScreen()),
                    );
                  }),
                  IconButton(icon: const Icon(Icons.person,color: Colors.red,), onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()));
                  }),
                ],
              ),
            ),
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => ReadArticalScreen()));
          },
          elevation: 5,
          splashColor: Colors.red,
          backgroundColor: Colors.white12,
          enableFeedback: true,
          heroTag: "fab",
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Center(
              child: const Icon(
                Icons.chrome_reader_mode_outlined,
                color: Colors.black54,size: 30,
                weight: 10,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
  }

}
