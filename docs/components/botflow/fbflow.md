#Nova.BotFlow Facebook Messager
##Features
####Text
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Text character limit: 640 UTF-8
```
</p>
</details>
####Pictures
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Picture size limit is: 1 GB (width 720px, 960px, or 2048 px)
• Picture formats: jpeg, png, gif		
• Description text: no
```
</p>
</details>
####Files
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• File size limit is: 25 MB
• Video size limit is: 1 GB
• Video formats: any (mp4 and MOV are recommended)
```
</p>
</details>
####Emoji
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

####Typing
- Typing identificator is precent when agent writes a message
- Typing indicators are automatically turned off after 20 seconds, or when the bot sends a message

####Quick Replies
- Quick Replies are supported as a disappearing after click/tap buttons
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Quick Replies
• Maximum content length is 20000 characters
• Maximum label (buttons text) length 23 characters in Web client and Mobile client
• Maximum label (buttons text) length 14 characters on Facebook website in widget 
• Maximum 13 buttons
• Context (Action Prompt) is required
```
</p>
</details>
<figure> <img src="/nova.docs/components/botflow/examples/FacebookFlowQuickReplies.png" title="Facebook Messenger Quick Replies" width="600" height"500"> </a> </figure>
####Card
- Card is supported as a monolith structure of *Picture*, *Title*, *Subtitle*, and *Quick Replies* buttons
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Generic Template
• Maximum Title length is 80 characters
• Maximum Subtitle length is 80 characters
• Maximum 3 buttons
• Maximum label (buttons text) length 23 characters in Web client and Mobile client
• Maximum label (buttons text) length 14 characters on Facebook website in widget
```
</p>
</details>
<figure> <img src="/nova.docs/components/botflow/examples/FacebookFlowCard.png" title="Facebook Messenger Card" width="600" height"500"> </a> </figure>
####Button List
- Button List is supported as a Title with number of buttons positioned vertically 
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Generic Template
• Maximum Title length is 80 characters
• Maximum 3 buttons
• Maximum label (buttons text) length 23 characters in Web client and Mobile client
• Maximum label (buttons text) length 14 characters on Facebook website in widget
• Context (Action Prompt) is required
```
</p>
</details>
<figure> <img src="/nova.docs/components/botflow/examples/FacebookFlowButtonlist.png" title="Facebook Messenger Buttonlist" width="600" height"500"> </a> </figure>
####Button Grid
- Button Grid is supported as a Title with number of buttons positioned vertically 
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Generic Template
• Maximum Title length is 80 characters
• Maximum 3 buttons
• Maximum label (buttons text) length 23 characters in Web client and Mobile client
• Maximum label (buttons text) length 14 characters on Facebook website in widget
• Context (Action Prompt) is required
```
</p>
</details>
<figure> <img src="/nova.docs/components/botflow/examples/FacebookFlowButtongrid.png" title="Facebook Messenger Button Grid" width="600" height"500"> </a> </figure>
####Carousel
- Carousel is supported as a monolith structure with *Picture*, *Header* (Title), *Details* (Subtitle), and not disappearing *Buttons*
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Generic Template
• Pictures in jpg, png and gif formats
• Maximum up to 10 carousel blocks (cards)
• Maximum Title length is 80 characters
• Maximum Subtitle length is 80 characters
• Maximum 3 buttons under every card
• Maximum label (buttons text) length 23 characters in Web client and Mobile client
• Maximum label (buttons text) length 14 characters on Facebook website in widget
• Context (Action Prompt) is required
```
</p>
</details>
<figure> <img src="/nova.docs/components/botflow/examples/FacebookFlowCarousel.png" title="Facebook Messenger Carousel" width="600" height"500"> </a> </figure>