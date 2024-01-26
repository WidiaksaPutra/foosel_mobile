class StateUpdateBarang{
  bool loading;
  bool snackBar;
  String responApi;
  StateUpdateBarang(this.loading, this.snackBar, this.responApi);
}

class UpdateBarang extends StateUpdateBarang{
  UpdateBarang({
    required bool loading,
    required bool snackBar,
    required String responApi,
  })
  : super(loading, snackBar, responApi);
}