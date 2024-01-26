class StateDataUpButton{
  int currentTop, currentBody;
  StateDataUpButton(this.currentTop, this.currentBody);
}

class StateUpButton extends StateDataUpButton{
  StateUpButton(int currentTop, int currentBody) : super(currentTop, currentBody);
}