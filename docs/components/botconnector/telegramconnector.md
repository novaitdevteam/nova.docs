#Nova.BotConnector Telegram
##Features
####Text
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Text character limit: 4096 UTF
```
</p>
</details>
####Pictures
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Picture size limit is: 25 MB
• Picture formats: jpeg, jpg, png, gif (only if type:"ANIMATION")
• Description text: character limit 200
```
</p>
</details>
####Files
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• File (including video) size limit is: 2 GB
• Video formats: any
```
</p>
</details>
####Emoji
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

####Typing
- Typing identificator is precent when agent writes a message
- The status is set for 5 seconds or less 
- When a message arrives from bot, Telegram client clears its typing status

####Quick Replies
Quick Replies are supported as a disappearing after click/tap **keyboard** buttons
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Keyboard
• Maximum label (buttons text) length 75 characters
• Maximum content length 3000 characters
• Maximum 5 buttons per row
• Maximum 49 rows
```
</p>
</details>
<figure> <img src="/novadocs/components/botconnector/examples/TelegramConnectorQuickReplies.png" title="Telegram Quick Replies" width="600" height"500"> </a> </figure>
####Card
- Card is supported as a separate structure of *Picture*, *Title* with *Subtitle* and *Quick Replies* buttons
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Keyboard
• Title and Subtitle are written in separate from picture message
• Maximum label (buttons text) length 75 characters
• Maximum content length 3000 characters
• Maximum 5 buttons per row
• Maximum 49 rows
```
</p>
</details>
<figure> <img src="/novadocs/components/botconnector/examples/TelegramConnectorCard.png" title="Telegram Card" width="600" height"500"> </a> </figure>
####Button List
- Button List is supported as a Title with number of buttons positioned vertically 
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Inline Keyboard
• Content: maximum of 4096 characters
• Maximum 100 button rows
```
</p>
</details>
<figure> <img src="/novadocs/components/botconnector/examples/TelegramConnectorButtonlist.png" title="Telegram Button List" width="600" height"500"> </a> </figure>
####Button Grid
- Button Grid is supported as a Title with number of buttons positioned horizontally 
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Inline Keyboard
• Content: maximum of 4096 characters
• Maximum 8 buttons per row
```
</p>
</details>
<figure> <img src="/novadocs/components/botconnector/examples/TelegramConnectorButtongrid.png" title="Telegram Button Grid" width="600" height"500"> </a> </figure>
####Carousel
- Carousel is supported as a number of Card type messages, where every card may have buttons (different, if needed)
<details><summary>Known Restrictions</summary>
<p>
```
• Picture size limit is: 25 MB
• Picture formats: jpeg, jpg, png
• Maximum 3 buttons under every card
```
</p>
</details>
<figure> <img src="/novadocs/components/botconnector/examples/TelegramConnectorCarousel.png" title="Telegram Carousel" width="600" height"500"> </a> </figure>