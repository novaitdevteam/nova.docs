{%
   include-markdown ".\links.md"
   start="<!--datelink-chatproxygenesyspurecloud-start-->"
   end="<!--datelink-chatproxygenesyspurecloud-end-->"
   rewrite-relative-urls=true
%}

{%
   include-markdown ".\glossary.md"
   start="<!--glossary-start-->"
   end="<!--glossary-end-->"
   rewrite-relative-urls=true
%}

#Nova.ChatProxy.Genesys.PureCloud

*Nova.ChatProxy.Genesys.PureCloud is a module of Nova.ChatsConnector for Genesys PureCloud Integration*

##Features
###Component specific

- Genesys Cloud Open messaging API integration [:material-location-enter:] [2021r4]
- WebSocket reconnection [:material-location-enter:] [2021r1]
- Sending of additional parameters *UserName* and *cliend Id* [:material-location-enter:] [2020r3]
- Sending of conversation history with the chatbot [:material-location-enter:] [2020r1]
- Integration with high-availability *Mongodb* cluster (on *mongoose* driver level) [:material-location-enter:] [2019r3]
- log4js logging [:material-location-enter:] [2019r3]