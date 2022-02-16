{%
   include-markdown ".\links.md"
   start="<!--tasklink-start-->"
   end="<!--tasklink-end-->"
   rewrite-relative-urls=false
%}

#Nova.ChatRouter.Omilia
##Product Notices
***
##2022R1
##2022R1-2
####New Features
- none

####Bug Fixes
- Fixed agent receiving "/chatrouterstart" command on transfer  [:clipboard: NOV-311] [NOV-311]

	> Dialog start evoked wrong response or timeout in Omilia, in which situation "ignoreFailure" transferred chat without waiting for proper event

***
##2021R3
####New Features
- Added support of external configuration file [:clipboard: NOV-258] [NOV-258]

	> • Configuration file now can be outside component directory

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
- Singled out DRT link into configuration (field **URL**) [:clipboard: NOV-168] [NOV-168]

	> • Link to DRT can be different depending on assembling process

- Realized sending of service *(/start, /help, /settings)* messages from *Telegram* [:clipboard: NOV-136] [NOV-136]
- Added support of "Request Contact" button type for *Viber* channel [:clipboard: NOV-140] [NOV-140]
- Added support of "Request Contact" button type for *Facebook Messager* channel [:clipboard: NOV-141] [NOV-141]
- Implemented normalization (deletion of special symbols and emoji) of text sent to Omilia [:clipboard: NOV-170] [NOV-170]
- Added support of Omilia Autherization header [:clipboard: NOV-103] [NOV-103]

	> • new fields in config:

	> • accessToken - token for authorization

	> • useAccessToken - allow usage of accessToken (default is "false")

####Bug Fixes
- Fixed bug with survey where Genesys system message at the end of dialog can make survey buttons disappear [:clipboard: NOV-150] [NOV-150]
- Fixed bug where message from Line channel can suspend agent messages [:clipboard: NOV-151] [NOV-151]
- Fixed Carousel Rich Media causing error in *BotConnector* [:clipboard: NOV-165] [NOV-165]
***

##2020R4
####New Features
- Added sending of Omilia custom data to ChatProxy [:clipboard: NOV-110] [NOV-110]
- Implemented webservices to control Omilia conversation sessions [:clipboard: NOV-118] [NOV-118]

	> • 1) Reset of conversation state on Omilia connector 

	> DELETE /api/v1/conversations?id=<some-interaction-id>&omiliadialogid=<some-omilia-dialog-id>

	> • 2) Transfer of conversation on new Omilia dialog

	> UPDATE /api/v1/conversationss?id=<some-interaction-id>&omiliaconfigurationid=<some-omilia-configuration-id>&custom-param-1=<some-custom-param-1=value>&custom-param-N=<some-custom-param-N=value>

- Added support of "Request Contact" button type for **Telegram** channel [:clipboard: NOV-124] [NOV-124]

####Bug Fixes
- Fixed issue where sending unsupported by Omilia data cause error and does not create session  [:clipboard: NOV-126] [NOV-126]
***

##2020R3
####New Features
- Added support of Omilia RichControls tag **DataModels** [:clipboard: NOV-79] [NOV-79]

####Bug Fixes
- none
***

##2020R2
####New Features
- Implemented sending of conversation history from **Omilia** to **PureConnect** [:clipboard: NOV-37] [NOV-37]

####Bug Fixes
- none
***

##2020R1
####New Features
- Implemented sending of conversation history from **Omilia** to **PureCloud** [:clipboard: NOV-38] [NOV-38]
- Added mechanism to send *NoInput* events from client [:clipboard: NOV-43] [NOV-43]
- Realized connection of survey application after ending of conversation in Omilia [:clipboard: NOV-44] [NOV-44] 
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

##2019R4
####New Features
- Added usage of custom fields [:clipboard: NOV-34] [NOV-34]

####Bug Fixes
- Fixed sending of client Id [:clipboard: NOV-34] [NOV-34]
***

##2019R3
####New Features
- Integration with high-availability *Mongodb* cluster (on *mongoose* driver level) [:clipboard: NOV-22] [NOV-22]

####Bug Fixes
- none
***

##2019R2
####New Features
- Implemented mechanism for currect catching of chat session ending from ChatProxy and ending session in CharRouter [:clipboard: NOV-16] [NOV-16]

####Bug Fixes
- none
***

##2019R1
####New Features
- Developed module for custom filtering between *ChatProxy* and *BotConnector* [:clipboard: NOV-13] [NOV-13]
- Implemented sending of Rich Content from Omilia [:clipboard: NOV-13] [NOV-13]

####Bug Fixes
- none