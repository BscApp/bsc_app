sealed class AiEvents {}
class PromptSentEvent extends AiEvents {
  final String prompt;
  PromptSentEvent(this.prompt);
}

