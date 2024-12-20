import 'package:bsc_app/ai/logic/model/resModel.dart';
import 'package:bsc_app/ai/logic/remotesouce.dart';

class AiRepo {
  final Remotesouce _remotesouce = Remotesouce();
  Future<Message> getResponse(String prompt) async {
    final Resmodel res = await _remotesouce.getResponse(prompt);
    return Message(res.message);
  }
}
