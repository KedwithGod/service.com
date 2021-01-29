
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:servicecom/ViewModel/searchPageModel.dart';
import 'package:servicecom/Views/Uielements/Generaltextdisplay.dart';
import 'package:stacked/stacked.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin{
  int index=0;
  GlobalKey<AnimatedListState> listKey =GlobalKey<AnimatedListState> ();

  // ToDo: remember to add a snack bar, that will notify the user whenever
  // the list is update e.g ['List of tailor was justed updated!',
  // 'a new tailor just added her details,', 'more items to check, list was just updated now!']
  // also at the top display the no of tailors available in that area



  // request for permission to get location
  final Location location = Location();

  PermissionStatus _permissionGranted;
   _requestPermission() async {
    if (_permissionGranted != PermissionStatus.granted) {
      final PermissionStatus permissionRequestedResult =
      await location.requestPermission();
      await location.hasPermission();
      setState(() {
        _permissionGranted = permissionRequestedResult;
      });
    }
  }
  List valueList=[
    ['Ajetunmobi Safaru Enibintan',
      'No 20, Edunjobi olouniyo Street, Surulere, Lagos.',
      '08089223475, 09087365353', '1kM away'],
    ['Ajetunmobi Safaru Enibintan',
    'No 20, Edunjobi olouniyo Street, Surulere, Lagos.',
      '08089223475, 09087365353', '1kM away'],
    ['Ajetunmobi Safaru Enibintan',
    'No 20, Edunjobi olouniyo Street, Surulere, Lagos.',
      '08089223475, 09087365353', '1kM away'],
 ['Ajetunmobi Safaru Enibintan',
      'No 20, Edunjobi olouniyo Street, Surulere, Lagos.',
      '08089223475, 09087365353', '1kM away'],
    ['Ajetunmobi Safaru Enibintan',
    'No 20, Edunjobi olouniyo Street, Surulere, Lagos.',
      '08089223475, 09087365353', '1kM away'],
    ['Ajetunmobi Safaru Enibintan',
    'No 20, Edunjobi olouniyo Street, Surulere, Lagos.',
      '08089223475, 09087365353', '1kM away'],


  ];

  List initialList=[];

  // load initial items
  _loadItems()async{
    for (var item in valueList){
      await Future.delayed(Duration(seconds:1));
      initialList.add(item);
      listKey.currentState.insertItem(initialList.length-1);
    }
  }

  // function for item list

  _listItems(title, address, phoneNo, distance){
    return Container(
      width: 315,
      height:180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GeneralTextDisplay(title, Colors.white,
              1, 17,
              FontWeight.bold, 'title'),
          GeneralTextDisplay(address, Colors.white,
              1, 15,
              FontWeight.w400, 'address',style: FontStyle.italic,),
          GeneralTextDisplay(phoneNo, Colors.white,
              1, 17,
              FontWeight.bold, 'phone No')
          ,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on,color: Colors.yellow,size: 20, ),
                  SizedBox(width:8),
                  GeneralTextDisplay('check direction', Colors.yellow, 1,
                      13, FontWeight.w400, 'direction')
                ],
              ),
              SizedBox(width:86 ,),
              GeneralTextDisplay(distance, Colors.white, 1,
                  16, FontWeight.w400, 'distance',style: FontStyle.italic,)
            ],
          ),
          SizedBox(height:16),
          Divider(height: 1,color: Colors.white38,),
          SizedBox(height:16)
        ],
      ),
    );
  }

  @override
  void initState(){
    _loadItems();
    _permissionGranted == PermissionStatus.granted
        ? null
        : _requestPermission();
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
/*    _permissionGranted == PermissionStatus.granted
        ? null
        : _requestPermission();*/
    return ViewModelBuilder<SearchModel>.nonReactive(
        onModelReady: (model) {
          model.getAddressData();
        },
        viewModelBuilder: () => SearchModel(),
      builder:(context,model,child)=>
          Scaffold(
              body: Container(
                  width: 375,
                  height:667,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/searchPage.jpg'),
                          fit: BoxFit.cover,alignment: Alignment.center)
                  ),
                  child: Container(
                    width: 375,
                    height:667,
                    color: Color.fromRGBO(0, 0, 0, 0.61),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 375,
                            height: 58,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 0.18),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(-5,-5),
                                      blurRadius: 15,
                                      spreadRadius: 1.0,
                                      color: Color.fromRGBO(255, 255, 255, 0.35)
                                  )
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(width: 10,),
                                Icon(Icons.menu, size: 25,
                                  color: Color.fromRGBO(242, 242, 242, 1.0),),

                                Container(
                                    padding: EdgeInsets.all(8),
                                    width:171,
                                    height:45,
                                    alignment:Alignment.center,
                                    child:Text('Carpentry',
                                        style:TextStyle(fontSize: 20,color: Colors.white,
                                            fontWeight: FontWeight.w700))
                                ),
                                SizedBox(height: 59,width: 159,)
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 216,
                          top: 12,
                          child: IndexedStack(
                            index: index,
                            children: [
                              GestureDetector(
                                onTap:(){
                                  setState(() {
                                    index=1;
                                  });
                                },
                                child: Container(
                                  width:136,
                                  height:35,
                                  decoration:BoxDecoration(
                                      color: Color.fromRGBO(128, 255, 255, 0.65),
                                      borderRadius: BorderRadius.all(Radius.circular(2)),
                                      boxShadow: [

                                        BoxShadow(
                                            offset: Offset(-3,-4),
                                            blurRadius: 5,
                                            spreadRadius: 1.0,
                                            color: Color.fromRGBO(100, 200, 200, 0.50)
                                        ),
                                      ]
                                  ),
                                  child: Row(

                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('Filter by Range', style: TextStyle(color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),),
                                      Icon(Icons.directions_walk,color: Colors.black,size: 17, )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap:(){
                                  setState(() {
                                    index=0;
                                  });
                                },
                                child: Container(
                                  width:136,
                                  height:70,
                                  decoration:BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 0.57),
                                    borderRadius: BorderRadius.all(Radius.circular(2)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('Filter by Range', style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),),
                                          Icon(Icons.directions_walk,color: Colors.black,size: 17, ),

                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.remove,color: Colors.black,size: 17, ),
                                          Text('0.5 kM', style: TextStyle(color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),),
                                          Icon(Icons.add,color: Colors.black,size: 17, ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        /*Positioned(
            top: 104,
            left: 30,
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              children: [
                _listItems('Ajetunmobi Safaru Enibintan',
                    'No 20, Edunjobi olouniyo Street, Surulere, Lagos.',
                   '08089223475, 09087365353', '1kM away'),
                _listItems('Ajetunmobi Safaru Enibintan',
                    'No 20, Edunjobi olouniyo Street, Surulere, Lagos.',
                   '08089223475, 09087365353', '1kM away'),
                _listItems('Ajetunmobi Safaru Enibintan',
                    'No 20, Edunjobi olouniyo Street, Surulere, Lagos.',
                   '08089223475, 09087365353', '1kM away'),

              ],
            ),
          ),*/
                        Positioned(
                          top: 104,
                          left: 30,
                          right: 30,
                          bottom: 30,
                          child: SizedBox(
                            height: valueList.length*120.0,
                            child: AnimatedList(
                                initialItemCount: initialList.length,
                                shrinkWrap: false,
                                key:listKey,
                                scrollDirection: Axis.vertical,
                                physics:RangeMaintainingScrollPhysics(),
                                itemBuilder: (context,index, animation ){
                                  return SlideTransition(
                                      position: Tween(
                                          begin: Offset(1, 0),
                                          end:Offset(0,0)
                                      ).animate(animation),
                                      child: SizeTransition(
                                        sizeFactor: animation,
                                        child: _listItems(valueList[index][0], valueList[index][1],
                                            valueList[index][2], valueList[index][3]),
                                      ));
                                }
                            ),
                          ),
                        )
                      ],
                    ),
                  )))
    );
  }
}
