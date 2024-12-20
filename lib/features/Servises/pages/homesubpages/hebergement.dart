import 'package:bsc_app/hebergement/logic/models/heberge.dart';
import 'package:bsc_app/hebergement/ui/bloc/heberge_bloc.dart';
import 'package:bsc_app/hebergement/ui/bloc/heberge_state.dart';
import 'package:bsc_app/hebergement/ui/widgets/hotelListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    image: ['https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'], offres: [], type: '', adresse: '',  cost: '600Da',
  ),

];

class _HebergementState extends State<Hebergement> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HebergeBloc,HebergeState>(
      builder: (context,state) {
        if (state is HebergeStateSuccess){
 return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: state.heberges.length,
          itemBuilder: (context, index) {
           return HebergeCard(heberge: state.heberges[index]); 
          },
        );


        }
        if (state is HebergeStateLoading){
        return CircularProgressIndicator();
        }
        if (state is HebergeStateError){
        return Text(state.message);
        }
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _hebergement.length,
          itemBuilder: (context, index) {
           return HebergeCard(heberge: _hebergement[index]); 
          },
        );
      }
    );
  }
}
