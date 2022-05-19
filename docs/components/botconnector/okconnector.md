#Nova.BotConnector Odnoklassniki
##Features
####Text
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Maximum message text character limit: 4096 characters in Latin and Cyrillic, including emoji
• Each emoji takes several characters (for example, a smiley is 8 characters long, a heart is 7 characters long, etc.)
```
</p>
</details>
####Pictures
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Maximum size of uploading images by API is 1680x1680
```
</p>
</details>
####Files
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• The video length can be any
• File size should not exceed 32 GB
```
</p>
</details>
####Emoji
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

####Quick Replies
Quick Replies are supported as a disappearing after click/tap **inline keyboard** buttons
<details><summary>Known Restrictions</summary>
<p>
```
• Type: message
• Maximum message length: 4096 characters, including emoji
• Maximum buttons: 100
• Maximum label (text on button): 42 characters (the platform will cut off the rest and insert ellipsis)
```
</p>
</details>
<figure> <img src="/nova.docs/components/botconnector/examples/OkConnectorQuickReplies.png" title="Ok Quick Replies" width="600" height"500"> </a> </figure>
####Card
- Card is supported as a separate structure of *Picture* message and text message (*Title* with *Subtitle*) with *Quick Replies* buttons
<details><summary>Known Restrictions</summary>
<p>
```
• Type: message
• Maximum message length: 4096 characters, including emoji
• Maximum label (text on button): 42 characters (the platform will cut off the rest and insert ellipsis)
```
</p>
</details>
<figure> <img src="/nova.docs/components/botconnector/examples/OkConnectorCard.png" title="Ok Card" width="600" height"500"> </a> </figure>
####Button List
- Button List is supported as a Title with number of buttons positioned vertically 
<details><summary>Known Restrictions</summary>
<p>
```
• Type: message
• Maximum message length: 4096 characters, including emoji
• Maximum buttons: 100
• Maximum label (text on button): 42 characters (the platform will cut off the rest and insert ellipsis)
```
</p>
</details>
<figure> <img src="/nova.docs/components/botconnector/examples/OkConnectorButtonlist.png" title="Ok Button List" width="600" height"500"> </a> </figure>
####Button Grid
- Button Grid is not supported as a separate data structure and copies Button List 
<details><summary>Known Restrictions</summary>
<p>
```
• Type: message
• Maximum message length: 4096 characters, including emoji
• Maximum buttons: 100
• Maximum label (text on button): 42 characters (the platform will cut off the rest and insert ellipsis)
```
</p>
</details>
<figure> <img src="/nova.docs/components/botconnector/examples/OkConnectorButtongrid.png" title="Ok Button Grid" width="600" height"500"> </a> </figure>
####Carousel
- Carousel is supported as a number of Card type messages with inline keyboard buttons (different buttons, if needed)
<details><summary>Known Restrictions</summary>
<p>
```
• Type: message
• Maximum size of uploading images by API is 1680x1680
• Maximum message length: 4096 characters, including emoji
• Maximum buttons: 100
• Maximum label (text on button): 42 characters (the platform will cut off the rest and insert ellipsis)
```
</details>
<figure> <img src="/nova.docs/components/botconnector/examples/OkConnectorCarousel.png" title="Ok Carousel" width="600" height"500"> </a> </figure>