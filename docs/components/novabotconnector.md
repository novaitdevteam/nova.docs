[NOV-271]: https://sd.novait.com.ua/browse/NOV-271
[NOV-238]: https://sd.novait.com.ua/browse/NOV-238
[NOV-265]: https://sd.novait.com.ua/browse/NOV-265
[NOV-172]: https://sd.novait.com.ua/browse/NOV-172
[NOV-181]: https://sd.novait.com.ua/browse/NOV-181
[NOV-199]: https://sd.novait.com.ua/browse/NOV-199
[NOV-203]: https://sd.novait.com.ua/browse/NOV-203
[NOV-215]: https://sd.novait.com.ua/browse/NOV-215
[NOV-147]: https://sd.novait.com.ua/browse/NOV-147
[NOV-163]: https://sd.novait.com.ua/browse/NOV-163
[NOV-154]: https://sd.novait.com.ua/browse/NOV-154
[NOV-141]: https://sd.novait.com.ua/browse/NOV-141
[NOV-140]: https://sd.novait.com.ua/browse/NOV-140

#Nova.BotConnector
##Product Notices
***
##2021R4
###2021R4-1 :briefcase: Epic
####New Features
- Facebook Wall Posts: pooling service [:clipboard: NOV-271] [NOV-271]

####Bug Fixes
- none
***

##2021R3
####New Features
- VK Wall Posts: added support of VK comments on posts [:clipboard: NOV-265] [NOV-265]
	* comment creates new conversation with possibility of one reply from agent
	* comment doesn't create conversation if it doesn't contain mention (**@groupname**) if it is not direct reply to group's post
	* variable in payload for comments **CanReply** has value **false**
	* payload has client's avatar url

####Bug Fixes
- none
***

##2021R2
####New Features
- All chanels: added sending of REF context from uri to Omilia on the start of conversation [:clipboard: NOV-172] [NOV-172]
- Facebook: added receiving of additional user information (*firstname*, *lastname*, *username*) [:clipboard: NOV-181] [NOV-181]
- WebChat: added receiving of additional user infogrmation (*firstname*, *lastname*) [:clipboard: NOV-199] [NOV-199]
- All channels: deletion of user privacy related data from DB [:clipboard: NOV-203] [NOV-203]
- All channels: added outbound messages [:clipboard: NOV-238] [NOV-238]:
	* without specific answer redirect on agent or workgroup\skillgroup 
	* with reservation of agent or workgroup\skillgroup after outbound message and specific answer redirect on agent or workgroup\skillgroup
	* with reservation of agent or workgroup\skillgroup after client's reply and specific answer redirect on agent or workgroup\skillgroup

####Bug Fixes
- Facebook: fixed receiving of additional user information from new users [:clipboard: NOV-215] [NOV-215]
- Slack: fixed **oAuthUrl** field on channel registration in connector
***

##2021R1
####New Features

- Viber: added support of "**Request Contact**" button type [:clipboard: NOV-140] [NOV-140]
- Facebook: added support of "**Request Contact**" button type [:clipboard: NOV-141] [NOV-141]
- WhatsApp (Nexmo): added support of Omilia **Quick Replies** rich media [:clipboard: NOV-154] [NOV-154]
- Rich content mapping documentation [:clipboard: NOV-163] [NOV-163]

####Bug Fixes
- Telegram: any text that goes with **/start** command is inputed as a first message to Omilia[:clipboard: NOV-147] [NOV-147]
- All channels: Carousel type error fix