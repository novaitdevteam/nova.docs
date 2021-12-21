[NOV-13]: https://sd.novait.com.ua/browse/NOV-13
[NOV-16]: https://sd.novait.com.ua/browse/NOV-16
[NOV-22]: https://sd.novait.com.ua/browse/NOV-22
[NOV-37]: https://sd.novait.com.ua/browse/NOV-37
[NOV-38]: https://sd.novait.com.ua/browse/NOV-38
[NOV-43]: https://sd.novait.com.ua/browse/NOV-43
[NOV-44]: https://sd.novait.com.ua/browse/NOV-44
[NOV-52]: https://sd.novait.com.ua/browse/NOV-52
[NOV-79]: https://sd.novait.com.ua/browse/NOV-79
[NOV-103]: https://sd.novait.com.ua/browse/NOV-103
[NOV-110]: https://sd.novait.com.ua/browse/NOV-110
[NOV-118]: https://sd.novait.com.ua/browse/NOV-118
[NOV-124]: https://sd.novait.com.ua/browse/NOV-124
[NOV-126]: https://sd.novait.com.ua/browse/NOV-126
[NOV-136]: https://sd.novait.com.ua/browse/NOV-136
[NOV-140]: https://sd.novait.com.ua/browse/NOV-140
[NOV-141]: https://sd.novait.com.ua/browse/NOV-141
[NOV-150]: https://sd.novait.com.ua/browse/NOV-150
[NOV-151]: https://sd.novait.com.ua/browse/NOV-151
[NOV-164]: https://sd.novait.com.ua/browse/NOV-164
[NOV-165]: https://sd.novait.com.ua/browse/NOV-165
[NOV-170]: https://sd.novait.com.ua/browse/NOV-170
[NOV-192]: https://sd.novait.com.ua/browse/NOV-192
[NOV-196]: https://sd.novait.com.ua/browse/NOV-196
[NOV-202]: https://sd.novait.com.ua/browse/NOV-202
[NOV-253]: https://sd.novait.com.ua/browse/NOV-253
[NOV-258]: https://sd.novait.com.ua/browse/NOV-258

#Nova.ChatProxy.Cisco.ECE
##Product Notices
***
##2021R3
####New Features
- Added support of external configuration file [:clipboard: NOV-258] [NOV-258]

	```Configuration file now can be outside component directory```

- Optimized deployment of new component versions with daemon process manager [:clipboard: NOV-253] [NOV-253]
- Modification of Rich Media to be compatible with new Omilia API [:clipboard: NOV-192] [NOV-192]:

<details><summary>Template</summary>
<p>

```
Viber: support of Card, changed Carusel visuals
Line: usage of native Quick Replies
Slack: support of Buttons, transfer on newer API
Twitter: support of Buttons
Kik: support of Buttons
```
</p>
</details>

####Bug Fixes
- Fixed problem with HA mode where one of parallel working nodes does send *NoInput* event [:clipboard: NOV-164] [NOV-164]
- Fixed issue with creation of new dialog on Omilia's **EXIT** response caused by unsupported data type (smile) [:clipboard: NOV-196] [NOV-196]
- Changed the mechanism of sending smiles to Omilia [:clipboard: NOV-202] [NOV-202]
***

##2021R2
####New Features
- Realized sending of service *(/start, /help, /settings)* messages from *Telegram* [:clipboard: NOV-136] [NOV-136]
- Added support of "Request Contact" button type for *Viber* channel [:clipboard: NOV-140] [NOV-140]
- Added support of "Request Contact" button type for *Facebook Messager* channel [:clipboard: NOV-141] [NOV-141]
- Implemented normalization (deletion of special symbols and emoji) of text sent to Omilia [:clipboard: NOV-170] [NOV-170]
- Added support of Omilia Autherization header [:clipboard: NOV-103] [NOV-103]

	```
	new fields in config:
	accessToken - token for authorization
	useAccessToken - allow usage of accessToken (default is "false")
	```

####Bug Fixes
- Fixed bug with survey where Genesys system message at the end of dialog can make survey buttons disappear [:clipboard: NOV-150] [NOV-150]
- Fixed bug where message from Line channel can suspend agent messages [:clipboard: NOV-151] [NOV-151]
- Fixed Carousel Rich Media causing error in *BotConnector* [:clipboard: NOV-165] [NOV-165]
***

##2020R4
####New Features
- Added sending of Omilia custom data in ChatProxy [:clipboard: NOV-110] [NOV-110]
- Implemented webservices to control Omilia conversation sessions [:clipboard: NOV-118] [NOV-118]

```
1) Reset of conversation state on Omilia connector 
DELETE /api/v1/conversations?id=<some-interaction-id>&omiliadialogid=<some-omilia-dialog-id>

2) Transfer of conversation on new Omilia dialog
UPDATE /api/v1/conversationss?id=<some-interaction-id>&omiliaconfigurationid=<some-omilia-configuration-id>&custom-param-1=<some-custom-param-1=value>&custom-param-N=<some-custom-param-N=value>
```
- Added support of "Request Contact" button type for *Telegram* channel [:clipboard: NOV-124] [NOV-124]

####Bug Fixes
- Fixed issue where sending unsupported by Omilia data cause error and does not create session  [:clipboard: NOV-126] [NOV-126]
***

##2020R3
####New Features
- Added support of new Omilia RichControls tag *DataModels* [:clipboard: NOV-79] [NOV-79]

####Bug Fixes
- none
***

##2020R2
####New Features
- Implemented sending of conversation history from *Omilia* to *PureConnect* [:clipboard: NOV-37] [NOV-37]

####Bug Fixes
- none
***

##2020R1
####New Features
- Implemented sending of conversation history from *Omilia* to *PureCloud* [:clipboard: NOV-38] [NOV-38]
- Added mechanism to send *NoInput* events from client [:clipboard: NOV-43] [NOV-43]
- Realized connection of survey after ending of conversation in Omilia [:clipboard: NOV-44] [NOV-44] 
- Added sending of extra user date at the start of conversation to Omilia [:clipboard: NOV-52] [NOV-52]:

<details><summary>Extra User Data</summary>
<p>

```
    "user_id": "string"
    "fullname": "string"
    "username": "string"
    "email": "string"
	
	"email" is formed as {channel_id} + @ + {channel_name} 
```
</p>
</details>

####Bug Fixes
- none
***

##2019R3
####New Features
- Integration with *Mongodb* with the help of *mongoose* driver [:clipboard: NOV-22] [NOV-22]

####Bug Fixes
- none
***

##2019R2
####New Features
- Implemented mechanism for currect catching of chat session ending from ChatProxy and ending session in the component [:clipboard: NOV-16] [NOV-16]

####Bug Fixes
- none
***

##2019R1
####New Features
- Developed module for custom filtering between *ChatProxy* and *BotConnector* [:clipboard: NOV-13] [NOV-13]
- Implemented sending of Rich Content from Omilia [:clipboard: NOV-13] [NOV-13]

####Bug Fixes
- none