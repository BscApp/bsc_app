
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bsc_app/ai/ui/bloc/ai_bloc.dart';
import 'package:bsc_app/ai/ui/bloc/ai_events.dart';
import 'package:bsc_app/ai/ui/bloc/ai_state.dart';
import 'package:bsc_app/ai/logic/model/resModel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.grey,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("BSCAI",style: TextStyle(color: Colors.grey),),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 20, 12, 71),
      ),
      body: BlocBuilder<AiBloc, MessagesState>(
        builder: (context, state) {
          List<Message> messages = [];

          if (state is MessagesLoaded) {
            messages = state.messages;
          } else if (state is MessagesLoading) {
            messages = state.messages;
          }
          return Column(
            children: [
              // Chat Messages List
              Expanded(
                child: (messages.isNotEmpty)? ListView.builder(
                  padding: const EdgeInsets.all(12.0),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isAi = message.isAi ?? false;
                    return  Align(
                      alignment:
                          isAi ? Alignment.centerLeft : Alignment.centerRight,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color:
                              isAi ? Colors.grey[300] : Color.fromARGB(255, 20, 12, 71),
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(16.0),
                            topRight: const Radius.circular(16.0),
                            bottomLeft: Radius.circular(isAi ? 0 : 16.0),
                            bottomRight: Radius.circular(isAi ? 16.0 : 0),
                          ),
                        ),
                        child: Text(
                          message.content,
                          style: TextStyle(
                            color: isAi ? Colors.black87 : Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                )
                :Container(child: Align(alignment: Alignment.bottomCenter,child: Container(
                  height: 140,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Popular Prompts',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      GestureDetector(onTap: () {
                        context.read<AiBloc>().add(PromptSentEvent("Tell me About boumrdess history"));
                      },child: Text("Tell me About boumrdess history")),
                      Divider(),
                      GestureDetector(onTap: () {
                        context.read<AiBloc>().add(PromptSentEvent("give me a nice trip at boumrdess"));
                      },child: Text("give me a nice trip at boumrdess")),
                      Divider(),
                      GestureDetector(onTap: () {
                        context.read<AiBloc>().add(PromptSentEvent("give me the best place to visit in boumrdess"));
                      },child: Text("give me the best place to visit in boumrdess")),
                    ],
                  ),
                ),
                )
                ,),
              ),

              // Loading Indicator
              if (state is MessagesLoading)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),

              // Message Input Section
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 12.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: "Type your message...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          
                        });
                        final prompt = _controller.text.trim();
                        if (prompt.isNotEmpty) {
                          context.read<AiBloc>().add(PromptSentEvent(prompt));
                          _controller.clear();
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 20, 12, 71),
                        radius: 24.0,
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

