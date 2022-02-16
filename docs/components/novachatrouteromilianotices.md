{%
   include-markdown ".\links.md"
   start="<!--datelink-chatrouteromilia-start-->"
   end="<!--datelink-chatrouteromilia-end-->"
   rewrite-relative-urls=true
%}

{%
   include-markdown ".\glossary.md"
   start="<!--glossary-start-->"
   end="<!--glossary-end-->"
   rewrite-relative-urls=true
%}

#Nova.ChatRouter.Omilia

*Nova.ChatRouter.Omilia is a module of Nova.ChatsConnector connected to Omilia for custom filters between Nova.BotConnector and Nova.ChatProxy*

##Features
###Component specific

- Support of external configuration file [:material-location-enter:] [2021r3]
- Rich Media compatibility with Omilia API [:material-location-enter:] [2021r3]
- Field for DRT link in configuration (field **URL**) [:material-location-enter:] [2021r2]
- Support of Omilia Authorization header [:material-location-enter:] [2021r2]
- Sending of Omilia custom data to ChatProxy [:material-location-enter:] [2020r4]
- Webservices to control Omilia conversation sessions [:material-location-enter:] [2020r4]
- Support of Omilia RichControls tag **DataModels** [:material-location-enter:] [2020r3]
- Sending of conversation history from **Omilia** to **PureConnect** [:material-location-enter:] [2020r2]
- Sending of conversation history from **Omilia** to **PureCloud** [:material-location-enter:] [2020r1]
- Connection of survey application after ending of conversation in Omilia [:material-location-enter:] [2020r1]
- Sending of extra user data at the start of conversation to Omilia [:material-location-enter:] [2020r1]
- Support of custom fields usage [:material-location-enter:] [2019r4]
- Integration with high-availability *Mongodb* cluster (on *mongoose* driver level) [:material-location-enter:] [2019r3]
- Sending of Rich Content from Omilia [:material-location-enter:] [2019r1]
- log4js logging [:material-location-enter:] [2019r1]

***

###All channels

- Normalization of text sent to Omilia [:material-location-enter:] [2021r2]
- Mechanism to send *NoInput* events from client [:material-location-enter:] [2020r1]
- Mechanism for currect catching of chat session ending from ChatProxy and ending session in ChatRouter [:material-location-enter:] [2019r2]

***

###Channel specific
####Telegram

- Sending of service *(/start, /help, /settings)* messages [:material-location-enter:] [2021r2]
- Support of "Request Contact" button type [:material-location-enter:] [2020r4]

####Viber

- Support of "Request Contact" button type [:material-location-enter:] [2021r2]

####Facebook

- Support of "Request Contact" button type [:material-location-enter:] [2021r2]