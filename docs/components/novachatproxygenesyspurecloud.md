{%
   include-markdown ".\links.md"
   start="<!--tasklink-start-->"
   end="<!--tasklink-end-->"
   rewrite-relative-urls=false
%}

#Nova.ChatProxy.Genesys.PureCloud
##Product Notices
***
##2022R1
###2021R1-5 :briefcase: Epic
####New Features
- none

####Bug Fixes
- Fixed Websocket hearbeat error [:clipboard: NOV-361] [NOV-361]

	> • switched to new version of *ws* library for mongodb
	
	> • parameters *useFindAndModify* and *poolSize* were deleted
***

###2021R1-4 :briefcase: Epic
####New Features
- none

####Bug Fixes
- *Nexmo*: Fixed problem when text messages sent in quick order create a new dialogs [:clipboard: NOV-356] [NOV-356]
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
- Integration with high-availability *Mongodb* cluster (on *mongoose* driver level) [:clipboard: NOV-24] [NOV-24]

####Bug Fixes
- none
***

##2019R2
####New Features
- Developed module to integrate ChatProxy with *Genesys PureCloud* [:clipboard: NOV-15] [NOV-15]

####Bug Fixes
- none