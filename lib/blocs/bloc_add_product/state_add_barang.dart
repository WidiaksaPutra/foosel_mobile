class StateAddPostBarang{
  bool loading;
  bool snackBar;
  String responApi;
  StateAddPostBarang(this.loading, this.snackBar, this.responApi);
}

class AddPostBarang extends StateAddPostBarang{
  AddPostBarang({
    required bool loading,
    required bool snackBar,
    required String responApi,
  })
  : super(loading, snackBar, responApi);
}