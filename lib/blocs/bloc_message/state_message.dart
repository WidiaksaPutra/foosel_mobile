//DataStateListMessage
class DataStateListMessage{
  List dataUser;
  bool loading;
  DataStateListMessage(this.dataUser, this.loading);
}

class DataListMessage extends DataStateListMessage{
  DataListMessage(List dataUser, bool loading) : super(dataUser, loading);
}

class DataStateTitleMessage{
  String image, status, title;
  bool loadingData;
  DataStateTitleMessage(this.image, this.status, this.title, this.loadingData);
}

class DataTitleMessage extends DataStateTitleMessage{
  DataTitleMessage(String image, String status, String title, bool loadingData)
  : super(image, status, title, loadingData);
}

// DataStateCubitBottomSpace
class DataStateCubitBottomSpace{
  List bSpace;
  DataStateCubitBottomSpace(this.bSpace);
}

class DataCubitBottomSpace extends DataStateCubitBottomSpace{
  DataCubitBottomSpace(List bSpace) : super(bSpace);
}

//DataBlocStateChatMessage
class DataBlocStateChatMessage{
  bool loadingPostChat;
  DataBlocStateChatMessage(this.loadingPostChat);
}

class DataBlocChatMessage extends DataBlocStateChatMessage{
  DataBlocChatMessage(bool loadingPostChat)
  : super(loadingPostChat);
}

class DataStateNavMessageDetail{
  String tokenPenerima;
  int roleBar;
  bool detailMessage, loadingMessage;
  DataStateNavMessageDetail(this.tokenPenerima, this.roleBar, this.detailMessage, this.loadingMessage);
}

class DataNavMessageDetail extends DataStateNavMessageDetail{
  DataNavMessageDetail({required String tokenPenerima, required int roleBar, required bool detailMessage, required bool loadingMessage})
  : super(tokenPenerima, roleBar, detailMessage, loadingMessage);
}