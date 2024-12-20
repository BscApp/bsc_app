import 'package:bsc_app/core/dioServices.dart';
import 'package:bsc_app/hebergement/logic/models/heberge.dart';
import 'package:bsc_app/hebergement/logic/models/reservationModel.dart';

class Remote {
  final dio=Dioservices.dio;
  Future<List<Heberge>> getHeberge() async {
    final response = await dio.get('/Hauberge');
    return (response.data as List).map((e) => Heberge.fromJson(e)).toList();
  }
  Future<Heberge> getHebergeById(String id) async {
    final response = await dio.get('hauberge/$id');
    return Heberge.fromJson(response.data);
  }
Future<List<Heberge>>getAvailableHeberges(DateTime startTime)async{
  final response = await dio.get('/Hauberge/Available/${startTime.toIso8601String()}');
    return (response.data as List).map((e) => Heberge.fromJson(e)).toList();
  }
Future<Reservation>MakeReservation(Reservation reservation)async{
    final res=await dio.post('/reservation',data: reservation.toJson());    
    return Reservation.fromJson(res.data);
  }
  
}
