#Nova.BotFlow Apple Business Chat
##Features
####Text
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Maximum 160 characters per message
• If there are more than 160 characters, leftover characters will be sent as a secont message (like in SMS)
```
</p>
</details>
####Pictures
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Maximum 5 pictures can be sent at once (which, in total, must not be more that 100 MB)
```
</p>
</details>
####Files
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• File (including video) size limit is: 100 MB
• File extensions: any
• Video formats: any
• Even if file format is not supported, they can be found in /var/mobile/Library/SMS/ (the directory is accessible only with jailbreak)
```
</p>
</details>
####Emoji
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

####Typing
- Typing identificator is precent when agent writes a message
- When a message arrives from bot, ABC client clears its typing status
- The status is set for more than 2 minutes

####Quick Replies
- Quick Replies are supported as a List Picker template where you can choose one or multiple items and reply back with the selection
<details><summary>Known Restrictions</summary>
<p>
```
• Card presented to the consumer the following elements:
	• Bubble title text (field: title)  - the title of the message
	• Buuble text (field: subtitle) - subtitle to be displayed under title of the message
	• Link preview image (field: imageURL) - image to be placed in the List Picker message template
	• Button - required, but only if the items in the list do not have buttons	
• The List Picker header has the following elements:
	• List Picker Header Title - taken from Bubble title text
	• Section title (field: text) - can serve as a overall description for the items of selection
• The List Picker items menu has array of elements with the following elements:
	• Item Image (field: image)
	• Item Title (field: title)
	• Item Subtitle (subtitle)
	• Button

• Maximum Title (in card) length 85 characters (30 is recommended by Apple)
• Maximum Subtitle (in card) length 400 characters (85 is recommended by Apple)
• Pictures in JPG and PNG formats only, the total image size in the list picker is limited to 0.5MB
```
</p>
</details>
<figure> <img src="/nova.docs/components/botflow/examples/ABCFlowQuickReplies1.png" title="Apple Bussines Chat Quick Replies" width="600" height"500"> </a> </figure>
<figure> <img src="/nova.docs/components/botflow/examples/ABCFlowQuickReplies2.png" title="Apple Bussines Chat Quick Replies" width="600" height"500"> </a> </figure>
####Button List
- Button List is supported as a List Picker template (reference picture in Quick Replies)
<details><summary>Known Restrictions</summary>
<p>
```
• Card presented to the consumer the following elements:
	• Bubble title text (field: title)  - the title of the message
	• Buuble text (field: subtitle) - subtitle to be displayed under title of the message
	• Link preview image (field: imageURL) - image to be placed in the List Picker message template
	• Button - required, but only if the items in the list do not have buttons	
• The List Picker header has the following elements:
	• List Picker Header Title - taken from Bubble title text
	• Section title (field: text) - can serve as a overall description for the items of selection
• The List Picker items menu has array of elements with the following elements:
	• Item Image (field: image)
	• Item Title (field: title)
	• Item Subtitle (subtitle)
	• Button

• Maximum Title (in card) length 85 characters (30 is recommended by Apple)
• Maximum Subtitle (in card) length 400 characters (85 is recommended by Apple)
• Pictures in JPG and PNG formats only, the total image size in the list picker is limited to 0.5MB
```
</p>
</details>
####Button Grid
- Button Grid is supported as a List Picker template (reference picture in Quick Replies)
<details><summary>Known Restrictions</summary>
<p>
```
• Card presented to the consumer the following elements:
	• Bubble title text (field: title)  - the title of the message
	• Buuble text (field: subtitle) - subtitle to be displayed under title of the message
	• Link preview image (field: imageURL) - image to be placed in the List Picker message template
	• Button - required, but only if the items in the list do not have buttons	
• The List Picker header has the following elements:
	• List Picker Header Title - taken from Bubble title text
	• Section title (field: text) - can serve as a overall description for the items of selection
• The List Picker items menu has array of elements with the following elements:
	• Item Image (field: image)
	• Item Title (field: title)
	• Item Subtitle (subtitle)
	• Button

• Maximum Title (in card) length 85 characters (30 is recommended by Apple)
• Maximum Subtitle (in card) length 400 characters (85 is recommended by Apple)
• Pictures in JPG and PNG formats only, the total image size in the list picker is limited to 0.5MB
```
</p>
</details>