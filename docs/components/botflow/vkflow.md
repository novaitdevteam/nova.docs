#Nova.BotFlow Vkontakte
##Features
####Text
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Maximum normal message length im My Messages: 4096 characters, including emoji
• Business message text character limit: 1000 characters, including emoji
• Each emoji takes several characters (for example, a smiley is 8 characters long, a heart is 7 characters long, etc.)
```
</p>
</details>
####Pictures
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Picture size limit is: 5 MB
• Possible to attach up to 5 images to a message 
```
</p>
</details>
####Files
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• File size limit is: 200 MB
• Main supported formats:
	• Text documents: DOC, DOCX, XLS, XLSX, RTF
	• Presentations, books: PPT, PPTX, PDF, DJVU, FB2
	• Images: PNG, JPG, GIF, PSD, PS
	• Music: MP3
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
• Maximum keyboard buttons: 40 (with maximum size 5 x 10)
• Maximum inline keyboard buttons: 10 (with maximum size 5 x 6)
• Maximum button's payload: 255 characters
• Maximum label (text on button): 40 characters
```
</p>
</details>
<figure> <img src="/nova.docs/components/botflow/examples/VkFlowQuickReplies.png" title="Vk Quick Replies" width="600" height"500"> </a> </figure>
####Card
- Card is supported as a separate structure of *Picture*, *Title* with *Subtitle* (just a message text) and *Quick Replies* buttons
<details><summary>Known Restrictions</summary>
<p>
```
• Type: message
• Picture size limit is: 5 MB
• Possible to attach up to 5 images to a message
• Maximum message length: 4096 characters, including emoji
• Maximum inline keyboard buttons: 10 (with maximum size 5 x 6)
• Maximum button's payload: 255 characters
• Maximum label (text on button): 40 characters
```
</p>
</details>
<figure> <img src="/nova.docs/components/botflow/examples/VkFlowCard.png" title="Vkontakte Card" width="600" height"500"> </a> </figure>
####Button List
- Button List is supported as a Title with number of buttons positioned vertically 
<details><summary>Known Restrictions</summary>
<p>
```
• Type: message
• Maximum message length: 4096 characters, including emoji
• Maximum inline keyboard buttons: 10 (with maximum size 5 x 6)
• Maximum button's payload: 255 characters
• Maximum label (text on button): 40 characters
```
</p>
</details>
<figure> <img src="/nova.docs/components/botflow/examples/VkFlowButtonlist.png" title="Vkontakte Button List" width="600" height"500"> </a> </figure>
####Button Grid
- Button Grid is supported as a Title with number of buttons positioned horizontally 
<details><summary>Known Restrictions</summary>
<p>
```
• Type: message
• Maximum message length: 4096 characters, including emoji
• Maximum inline keyboard buttons: 10 (with maximum size 5 x 6)
• Maximum button's payload: 255 characters
• Maximum label (text on button): 40 characters
```
</p>
</details>
<figure> <img src="/nova.docs/components/botflow/examples/VkFlowButtongrid.png" title="Vkontakte Button Grid" width="600" height"500"> </a> </figure>
####Carousel
- Carousel is supported as a number of Card type messages with shared inline keyboard buttons
<details><summary>Known Restrictions</summary>
<p>
```
• Type: message
• Picture size limit is: 5 MB
• Possible to attach up to 5 images to a message
• Maximum message length: 4096 characters, including emoji
• Maximum inline keyboard buttons: 10 (with maximum size 5 x 6)
• Maximum button's payload: 255 characters
• Maximum label (text on button): 40 characters
```
</p>
</details>
<figure> <img src="/nova.docs/components/botflow/examples/VkFlowCarousel.png" title="Vkontakte Carousel" width="600" height"500"> </a> </figure>