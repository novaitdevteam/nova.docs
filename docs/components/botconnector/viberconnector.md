#Nova.BotConnector Viber
##Features
####Text
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Text character limit: 1056
```
</p>
</details>
####Pictures
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Picture size limit is: 1 MB
• Picture formats: jpeg
• Description text: no
```
</p>
</details>
####Files
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• File size limit is: 200 MB
• Video size limit is: 26 MB
• Video formats: mp4, H264
```
</p>
</details>
####Emoji
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

####Typing
- Typing indicators are not supported for bots

####Quick Replies
- Quick Replies are supported as a not disappearing after click/tap keyboard buttons
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Keyboard
• Maximum content length is 7000 characters
• Maximum label (buttons text) length is 250 characters
• Maximum number of rows is 24
• Maximum number of columns is 6
• Font size can be changed between 12 and 32
```
</p>
</details>
<figure> <img src="/nova.docs/components/botconnector/examples/ViberConnectorQuickReplies.png" title="Viber Quick Replies" width="600" height"500"> </a> </figure>
####Card
- Card is supported as a monolith structure with *Title*, *Subtitle* and *Quick Replies* keyboard buttons
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Rich Media Message
• Maximum length of Title with Subtitle is 239 characters
• Maximum length of label (buttons text) is 250 characters
• Maximum 3 buttons
• Picture size limit is: 1 MB
• Picture formats: jpeg

```
</p>
</details>
<figure> <img src="/nova.docs/components/botconnector/examples/ViberConnectorCard.png" title="Viber Card" width="600" height"500"> </a> </figure>
####Button List
- Button List is supported as a Title with number of keyboard buttons positioned vertically 
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Keyboard
• Maximum title length 7000 characters
• Maximum number of rows is 24
• Font size can be changed between 12 and 32
```
</p>
</details>
<figure> <img src="/nova.docs/components/botconnector/examples/ViberConnectorButtonlist.png" title="Viber Button List" width="600" height"500"> </a> </figure>
####Button Grid
- Button Grid is supported as a Title with number of keyboard buttons positioned vertically 
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Keyboard
• Maximum title length 7000 characters
• Maximum number of rows is 24
• Maximum number of columns is 6
• Font size can be changed between 12 and 32
```
</p>
</details>
<figure> <img src="/nova.docs/components/botconnector/examples/ViberConnectorButtongrid.png" title="Viber Button Grid" width="600" height"500"> </a> </figure>
####Carousel
- Carousel is supported as a monolith structure with *Picture*, *Header* (Title), *Details* (Subtitle), and not disappearing *Buttons* (Call to Action)
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Rich Media Message
• Maximum content length 7000 characters
• Maximum number of columns per carousel content block is 6
• Maximum number of rows per carousel content block is 7
• Maximum array of buttons is 6 * "columns per carousel content block" * "rows per carousel content block"
```
</p>
</details>
<figure> <img src="/nova.docs/components/botconnector/examples/ViberConnectorCarousel.png" title="Viber Carousel" width="600" height"500"> </a> </figure>