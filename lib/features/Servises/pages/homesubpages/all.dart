import 'package:bsc_app/ai/ui/pages/ai_page.dart';
import 'package:bsc_app/hebergement/ui/bloc/heberge_bloc.dart';
import 'package:bsc_app/hebergement/ui/bloc/heberge_state.dart';
import 'package:bsc_app/hebergement/ui/widgets/hebergeMiniCard.dart';
import 'package:bsc_app/hebergement/ui/widgets/hotelListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class All_page extends StatefulWidget {
  final TabController tabController;
   All_page({super.key,required this.tabController});

  @override
  State<All_page> createState() => _All_pageState();
}
final contrel=PageController(initialPage: 0);
final boumrdess=['images/roock.png','images/beach.png','images/city.png'];

class _All_pageState extends State<All_page> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text('Ask Our AI'),

          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: (){
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const ChatPage()));
            },

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Text('Message BSCAI',style:TextStyle(color: Colors.grey),),
                    Spacer(),
                    Image.asset('images/assistants.png',height: 30,width: 30,)
                  ],
                ),
              ),

            child: Container(
              width: 490,
              height: 90,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(28),
              ),
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('ask our ai'),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: const Text('Boumerdes'),
          ),
          const SizedBox(height: 10),
          Container(
            height: 181,
            child:PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: contrel,
              itemCount: 3,
              itemBuilder:(context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(borderRadius: BorderRadius.circular(15),child: Image.asset(boumrdess[index],fit: BoxFit.fill,width: double.infinity,height: double.infinity,)),
                      Positioned(
                        left: 10,
                        right: 10,
                        top: 55,
                        child: Container(
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                               GestureDetector(
                                 onTap: () {
                                  contrel.animateToPage((index+2)%3, duration:const Duration(microseconds: 100), curve:Curves.linear);
                                 },
                                 child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(115, 255, 255, 255)
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.navigate_before_rounded),
                                  ),
                                 ),
                               ),
                                const Spacer(),
                                GestureDetector(
                                onTap: () {
                                    contrel.animateToPage((index+1)%3, duration:const Duration(microseconds: 100), curve:Curves.linear);
                                },
                                 child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(115, 255, 255, 255)
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.navigate_next_rounded),
                                  ),
                                 ),
                               ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },)
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                const Text('hebergements'),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.tabController.animateTo(2);
                    });
                  },
                  child: const Text('See all')),
                const Icon(Icons.navigate_next_rounded)
              ],
            ),
          ),
          const SizedBox(height: 10),
          BlocBuilder<HebergeBloc,HebergeState>(
            builder: (context,state) {
            if (state is HebergeStateSuccess){
  return SizedBox(
  height:300,
    child: ListView.builder(
     scrollDirection: Axis.horizontal,
     itemCount:state.heberges.length ,
     itemBuilder: (context,index)=>
     MiniCard(heberge: state.heberges[index]),
  ));

            }
            if (state is HebergeStateLoading){
             return CircularProgressIndicator.adaptive();
            }
            if (state is HebergeStateError){
            return Text(state.message);
            }
            return Text('Unexpected State');
                        }
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                const Text('Lieux touristique'),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.tabController.animateTo(4);
                    });
                  },
                  child: const Text('See all')),
                const Icon(Icons.navigate_next_rounded)
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 200,
                  height: 150,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Column(
                      children: [
                        Container(
                       
                          height: 100,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Colors.amberAccent,
                            borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Text('The name of the place')
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10,)
        ],
      ),
    );
  }
}
