import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: sliderScaffold(),
     )
  );
}

class sliderScaffold extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return sliderScaffoldstate();
  }
}

class sliderScaffoldstate extends State<sliderScaffold>{

  String feedbacktext = 'Cound be better one';
  var slidervalue = 0.0;

  IconData myFeedbackicon = FontAwesomeIcons.sadTear;
  Color myfeedbackcolor = Colors.yellow;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed : (){},),
        title: Text('Feedback'),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.star),
            onPressed : (){}
          )
        ],
        ),

      body: Container(
        color: Colors.grey,
        child: Column(
          children: <Widget>[
            Container(
             child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('How Do u rate our service?',
                style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold,color: Colors.black),
                ),
              ) 
            ),
            SizedBox(height: 30.0,),
            Container(
              child: Align(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Colors.green,
                  child: Container(
                    height: 400.0,
                    width: 350.0,
                    child: Column(
                      children: <Widget>[
                          Padding(
                           padding: EdgeInsets.all(16.0),
                            child:Container(child:Text(feedbacktext,
                              style: TextStyle(fontSize: 22.0,
                                color: Colors.black),
                              )
                            ), 
                          ),

                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Container(
                              child: Icon(myFeedbackicon,color: myfeedbackcolor,size: 100.0,),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Container(
                              child: Slider(
                                
                                min: 0,
                                max: 3,
                                divisions: 3,
                                value: slidervalue,
                                activeColor: Color(0xffff520d),
                                inactiveColor: Colors.blueGrey,
                                onChanged: (newValue){
                                  setState(() {
                                    
                                    slidervalue = newValue;
                                    if(slidervalue >=0.0 && slidervalue <=1.0){
                                      myFeedbackicon = FontAwesomeIcons.sadTear;
                                      myfeedbackcolor = Colors.red;
                                      feedbacktext = 'Could be Better';
                                    }
                                    if(slidervalue >1.0 && slidervalue <=2.0){
                                      myFeedbackicon = FontAwesomeIcons.frown;
                                      myfeedbackcolor = Colors.yellow;
                                      feedbacktext = 'Average';
                                    }
                                    if(slidervalue >2.0 && slidervalue <=3.0){
                                      myFeedbackicon = FontAwesomeIcons.laugh;
                                      myfeedbackcolor = Colors.green;
                                      feedbacktext = 'Good food';
                                    }
                                  });
                                },
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Container(
                              child: Text('Your Rating : $slidervalue',
                                style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                              ),
                            ),
                          )

                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      
      );
  }
}