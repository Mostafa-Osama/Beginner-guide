abstract class ChatStates{}


class ChatInitialState extends ChatStates{}


class ChatSendMessageLoadingState extends ChatStates{}
class ChatSendMessageSuccessState extends ChatStates{}
class ChatSendMessageErrorState extends ChatStates{}


class ChatSendToMessageSuccessState extends ChatStates{}
class ChatSendToMessageErrorState extends ChatStates{}


class GetChatsLoadingState extends ChatStates{}
class GetChatsSuccessState extends ChatStates{}

