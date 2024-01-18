class Question{

  const Question(this.text,this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffled(){
    final List<String> ans = List.of(answers);
    ans.shuffle();
    return ans;
  }
}