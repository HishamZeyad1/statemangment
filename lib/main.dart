import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_management/CacheHelper.dart';

import 'CategoryFilter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(MaterialApp( home: MyHomePage(),));
}

class MyHomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  // int? _counter = (CacheHelper.getbool(key:"check1")==null?0:CacheHelper.getbool(key:"check1"));
  // bool? valuefirst =(CacheHelper.getbool(key:"check1")==null?false:CacheHelper.getbool(key:"check1"));
  // bool? valuesecond =CacheHelper.check2 ;//(CacheHelper.getbool(key:"check2")==null?false:CacheHelper.getbool(key:"check2"));

  late List<bool> value=[false,false,false,false,false];
  List<int> listindex=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0;i<5;++i){
      value[i] =(CacheHelper.getbool(key:"check$i")==null?value[i]:CacheHelper.getbool(key:"check$i"))!;
      if(value[i]==true){listindex.add(i);}
    }
    print("before listindex:$listindex");
  }
  @override
  Widget build(BuildContext context) {
    // bool? valuefirst =(CacheHelper.getbool(key:"check1")==null?false:CacheHelper.getbool(key:"check1"));
    // bool? valuesecond=(CacheHelper.getbool(key:"check2")==null?false:CacheHelper.getbool(key:"check2"));

    // print("valuefirst:$valuefirst valuesecond:$valuesecond");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Checkbox Example'),),
        body: Stack(
            children:[
              ListView.builder(
                itemBuilder: (BuildContext Context, int index) {
                  print(index);
                  return Container(
                      padding: new EdgeInsets.all(22.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(width: 10,),
                          Text('Checkbox with Header and Subtitle',style: TextStyle(fontSize: 20.0), ),
                          CheckboxListTile(
                            secondary: const Icon(Icons.alarm),
                            title: const Text('Ringing at 4:30 AM every day'),
                            subtitle: Text('Ringing after 12 hours'),
                            value: value[index],
                            onChanged: (bool? value1) {
                              value[index]=!value[index];
                              setState(() {
                                if(value1==true){listindex.add(index);}
                                else{listindex.remove(index);}
                              });
                              print("add/remove:${listindex}");
                            },
                          ),

                        ],
                      )
                  );
                },
                itemCount:5,
              ),
              FloatingActionButton(onPressed: (){
                update();
                child:SizedBox(
                    width: 100,
                    height: 100,
                    child: Text("click"));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryFilter()),
                );})
            ],
        ),
      ),
    );
  }
  void update(){
    // print("update All:${listindex}");
    // for(int index=0;index<listindex.length;++index){
    //   if(listindex.contains(index)){
    //     CacheHelper.putbool(key: "check${index}", value:true);
    //     print("AllSavedindex:${index}");
    //   }else{
    //     CacheHelper.putbool(key: "check${index}", value:false);
    //     print("AllNotSavedindex:${index}");
    //   }
    // }
    for(int index=0;index<value.length;++index){
      CacheHelper.putbool(key: "check${index}", value:value[index]);
    }
  }
}