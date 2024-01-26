class StateDataLogout{
  bool loadingLogout;
  StateDataLogout(this.loadingLogout);
}

class DataLogout extends StateDataLogout{
  DataLogout({required bool loadingLogout}) 
  : super(loadingLogout);
}
