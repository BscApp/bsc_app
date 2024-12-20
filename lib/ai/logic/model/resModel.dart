
class Resmodel {
 final String message; 
 final int  statusCode;
  Resmodel( this.statusCode, this.message,);

}
class Message{
  final String content;
  final bool isAi;
  Message(this.content,{this.isAi=true});
}
