
import 'package:bsc_app/features/Servises/widgets/calendar.dart';
import 'package:bsc_app/hebergement/logic/models/heberge.dart';
import 'package:bsc_app/hebergement/ui/bloc/heberge_bloc.dart';
import 'package:bsc_app/hebergement/ui/bloc/heberge_event.dart';
import 'package:bsc_app/hebergement/ui/bloc/heberge_state.dart';
import 'package:bsc_app/hebergement/ui/widgets/hotelListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Hebergement extends StatefulWidget {
  const Hebergement({super.key});

  @override
  State<Hebergement> createState() => _HebergementState();
}

List<Heberge> _hebergement = [
  Heberge(
    id: '1',
    nom: 'Hotel 1',
    rating: 4,
    image: ['https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'],
    offres: [],
    type: '',
    adresse: '',
    cost: '600Da',
  ),
];

class _HebergementState extends State<Hebergement> {
  late DateTime currentDay;

  @override
  void initState() {
    currentDay = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 3),
            child: Container(
              padding: const EdgeInsets.all(10),
            
            decoration: BoxDecoration(
            
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(18),
              color:Color(0xffD9D9D9)
              ),
              child: Text(DateFormat.yMMMMd().format(currentDay))),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.48,
                    child: CalendarAlert(
                      startDate: currentDay,
                      onDaySelected: (curr, focus) {
                        context.read<HebergeBloc>().add(HebergesEventFetchAvailable(curr));
                        Navigator.of(context).pop();
                        setState(() {
                          currentDay = curr;
                        });
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
        BlocBuilder<HebergeBloc, HebergeState>(
          builder: (context, state) {
            if (state is HebergeStateSuccess) {
              return Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: state.heberges.length,
                  itemBuilder: (context, index) {
                    return HebergeCard(heberge: state.heberges[index]);
                  },
                ),
              );
            }
            if (state is HebergeStateLoading) {
              return const CircularProgressIndicator();
            }
            if (state is HebergeStateError) {
              return Text(state.message);
            }
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: _hebergement.length,
                itemBuilder: (context, index) {
                  return HebergeCard(heberge: _hebergement[index]);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

