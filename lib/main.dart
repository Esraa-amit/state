import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state34/controller/helper/shared.dart';
import 'package:state34/utilities/routes_app/route.dart';
import 'package:state34/utilities/routes_app/routers.dart';
import 'package:state34/utilities/theme/app_theme.dart';
import 'controller/cubit_color/color_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await MyCache.init();
  runApp(
      MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>ColorCubit()),
      ],
       child: MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorCubit,ColorState>(
        builder: (context, state) {
         ColorCubit.get(context).getChangeTheme();
          return MaterialApp(
          title: 'Flutter Demo',
          theme: ColorCubit.get(context).isDarkTheme ?
          ThemesMode.darkTheme :
          ThemesMode.lightTheme ,
          // home: HomePage(),
            onGenerateRoute: onGenerateRoute,
            initialRoute: AppRoutes.splashScreen,
          );
        }
    );
  }
}




//////////////////////////////
//*********************************main provider**********************
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:state39/controller/provider_counter.dart';
// import 'package:state39/view/homepage.dart';
//
// void main() {
//   Provider.debugCheckInvalidValueType = null;
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create:(_)=> CounterProvider(),)
//       ],
//       // ChangeNotifierProvider(
//       // create:(_)=> CounterProvider(),
//       child:  MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home:  MyHomePage(),
//       ),
//     );
//   }}//////////////////////////////
// //*********************************main counterColor**********************

// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CounterCubit(),
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: MyHomePage(),
//       ),
//     );
//   }
// }
//*************************BlocStream**********************
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//       ),
//       home: BlocProvider(
//         create: (context) => CounterBloc(),
//         child: MyHomePage(title: 'Flutter Demo Home Page'),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   // int _counter = 0;
//
//   // void _incrementCounter() {
//   //   setState(() {
//   //     _counter++;
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             BlocBuilder<CounterBloc, CounterState>(
//               builder: (context, state) {
//                 return Text(
//                   state.counter.toString(),
//                   style: Theme
//                       .of(context)
//                       .textTheme
//                       .headline4,
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed:(){
//           BlocProvider.of<CounterBloc>(context,listen: false).add(IncrementEvent());},
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
