#Nova.BotFlow Line
##Features
####Text
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Maximum character limit is 5000
```
</p>
</details>
####Pictures
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Formats: JPEG, PNG
• Maximum image size: no limit
• Maximum file size: 10MB
```
</p>
</details>
####Files
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• File size up to 300MB
• There is a storage period of 30 days only for files larger than 50MB
• The total storage (Keep) limit is 1GB
• Most items can be saved in Keep for any length of time
• Maximum length of video: no limit
• Maximum video file size: 200MB (unofficially, can be up to 300MB, but only if there wont be API timeout)
```
</p>
</details>
####Emoji
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*
<details><summary>Known Restrictions</summary>
<p>
```
• Maximum of 20 LINE emoji's
```
</p>
</details>
####Quick Replies
Quick Replies are supported as a disappearing after click/tap buttons
<details><summary>Known Restrictions</summary>
<p>
```
• Type: quickReply
• Maximum content length is 5000 characters
• Maximum 13 buttons
• Maximum label length is 20 characters
```
</p>
</details>
<figure> <img src="/novadocs/components/botflow/examples/LineFlowQuickReplies.png" title="Line Quick Replies" width="600" height"500"> </a> </figure>
####Card
- Card is supported as a monolith structure of *Picture*, *Title* with *Subtitle* and buttons
<details><summary>Known Restrictions</summary>
<p>
```
• Type buttons template
• Maximum label length is 20 characters
• Maximum title length is 40 characters
• Maximum subtitle length is 60 characters
```
</p>
</details>
<figure> <img src="/novadocs/components/botflow/examples/LineFlowCard.png" title="Line Card" width="600" height"500"> </a> </figure>
####Button List
- Button List is supported as a Content with number of buttons positioned vertically 
<details><summary>Known Restrictions</summary>
<p>
```
• Type Flex message
• Maximum label length is 20 characters
```
</p>
</details>
<figure> <img src="/novadocs/components/botflow/examples/LineFlowButtonlist.png" title="Line Button List" width="600" height"500"> </a> </figure>
####Button Grid
- Button Grid is supported as a Content with number of buttons positioned vertically 
<details><summary>Known Restrictions</summary>
<p>
```
• Type Flex message
• Maximum label length is 20 characters
```
</p>
</details>
<figure> <img src="/novadocs/components/botflow/examples/LineFlowButtongrid.png" title="Line Button Grid" width="600" height"500"> </a> </figure>
####Carousel
- Carousel is supported as a number of Card type messages, where every card may have buttons (different, if needed)
<details><summary>Known Restrictions</summary>
<p>
```
• Type: carousel template
• Maximum 10 cards
• Maximum label length is 20 characters
• Maximum title length is 40 characters
• Maximum subtitle length is 60 characters
• All messages in a carousel must have the same number of images, buttons, and fields
• Pictures are must be in JPEG or PNG image with a maximum width of 1024 pixels. The image URL maximum is 1,000 characters
```
</p>
</details>
<figure> <img src="/novadocs/components/botflow/examples/LineFlowCarousel.png" title="Line Carousel" width="600" height"500"> </a> </figure>