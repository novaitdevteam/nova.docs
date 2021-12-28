[NOV-15]: https://sd.novait.com.ua/browse/NOV-15
[NOV-24]: https://sd.novait.com.ua/browse/NOV-24
[NOV-46]: https://sd.novait.com.ua/browse/NOV-46
[NOV-90]: https://sd.novait.com.ua/browse/NOV-90
[NOV-108]: https://sd.novait.com.ua/browse/NOV-108
[NOV-135]: https://sd.novait.com.ua/browse/NOV-135
[NOV-167]: https://sd.novait.com.ua/browse/NOV-167

#Nova.ChatProxy.Genesys.PureCloud
##Product Notices
***
##2021R4
###2021R4-1 :briefcase: Epic
####New Features
- Integration with Genesys Cloud Open messaging API [:clipboard: NOV-167] [NOV-167]

####Bug Fixes
- none
***

##2021R1
####New Features
- Developed WebSocket reconnection feature [:clipboard: NOV-135] [NOV-135]

	> • Solves problem with Genesys chat ending because socket is not alive

	> • Attempts to reconnect if network problems occurs, or if server closes it down

 	> • All messages that were not sent from agent's side due to websocket closure will be sent after reconnect

####Bug Fixes
- none
***

##2020R4
####New Features
- none

####Bug Fixes
- Fixed bug with picture\photo processing that caused chatproxy to enter errored state [:clipboard: NOV-108] [NOV-108]
***

##2020R3
####New Features
- Added sending of *UserName* and *cliend Id* to PureCloud [:clipboard: NOV-90] [NOV-90]

####Bug Fixes
- none
***

##2020R1
####New Features
- Implemented sending of conversation history with the chatbot [:clipboard: NOV-46] [NOV-46]

####Bug Fixes
- none
***

##2019R3
####New Features
- Integration with high-availability cluster *Mongodb* (on *mongoose* driver level) [:clipboard: NOV-24] [NOV-24]

####Bug Fixes
- none
***

##2019R2
####New Features
- Developed module to integrate ChatProxy with *Genesys PureCloud* [:clipboard: NOV-15] [NOV-15]

####Bug Fixes
- none