import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Cubit Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Cubit Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {
          state.wasIncremented == true
              ? Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Incremented!"),
                  duration: Duration(milliseconds: 3000),
                ))
              : Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Decremented!"),
                  duration: Duration(milliseconds: 3000),
                ));
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('You have pushed the button this many times:'),
                Text(state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      },
                      tooltip: 'Decrement',
                      child: Icon(Icons.remove),
                    ),
                    SizedBox(width: 15),
                    FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                      },
                      tooltip: 'Increment',
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
