abstract class InterfacePatchTransaksi{
  Future patchTransaksi({
    bool testing = false,
    String testingToken = "",
    required String transactionsId,
    required String status,
  });
}