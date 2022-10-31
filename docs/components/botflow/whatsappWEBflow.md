#Nova.BotFlow WhatsApp
##Features
####Text
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Text character limit: 4096 (counting the spaces)
```
</p>
</details>
####Pictures
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Picture size limit up to 5 MB
Supported types: image/jpeg, image/png

Images must be 8-bit, RGB or RGBA
```
</p>
</details>
####Files
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Audio size limit up to 16 MB
Supported types: audio/aac, audio/mp4, audio/mpeg, audio/amr, audio/ogg (only opus codecs, base audio/ogg is not supported)

• Document size limit up to 100 MB
Supported types: text/plain, application/pdf, application/vnd.ms-powerpoint, application/msword, application/vnd.ms-excel, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/vnd.openxmlformats-officedocument.presentationml.presentation, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet

• Video (and all other media) size limit up to 16 MB
Supported type: video/mp4, video/3gp

Only H.264 video codec and AAC audio codec is supported.
We support videos with a single audio stream or no audio stream.

• Sticker size limit up to 100KB for Static stickers and up to 500KB for Animated stickers
Supported type: image/webp
```
</p>
</details>
####Emoji
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

####Quick Replies
- Quick Replies are supported as a disappearing after click/tap **keyboard** buttons
- Reply button messages cannot be used as notifications. Currently, they can only be sent within 24 hours of the last message sent by the user. If you try to send a message outside the 24-hour window, you get an error message.
<details><summary>Known Restrictions</summary>
<p>
```
• Maximum 3 buttons
• Maximum header length 60 characters 
• Maximum message length 1,024 characters
• Maximum label length (button text) up to 20 characters
```
</p>
</details>
<figure> <img src="/nova.docs/components/botflow/examples/WhatsAppBCFlowQuickReplies.jpg" title="WhatsApp Quick Replies" width="600" height"500"> </a> </figure>
####List Picker
- List messages cannot be used as notifications. Currently, they can only be sent within 24 hours of the last message sent by the user. If you try to send a message outside the 24-hour window, you get an error message.
<details><summary>Known Restrictions</summary>
<p>
```
• Maximum a menu of up to 10 options
• Maximum header length 60 characters 
• Maximum message length 1,024 characters
• Maximum footer length up to 60 characters
• Maximum label length (button text) up to 20 characters
• List of items must have at least one section
• List section must contain at least one item
```
</p>
</details>
<figure> <img src="/nova.docs/components/botflow/examples/WhatsAppBCFlowListPicker1.jpg" title="WhatsApp BC List Picker" width="600" height"500"> </a> </figure>
<figure> <img src="/nova.docs/components/botflow/examples/WhatsAppBCFlowListPicker2.jpg" title="WhatsApp BC List Picker" width="600" height"500"> </a> </figure>
####Card
- Card is not supported, but can be replicated as a Picture message then Quick Replies

####Button List
- Button List is not supported as a different data structure, but it can be replicated with Quick Replies as it's button aligned vertically if total label text width equal or less of messenger width

####Button Grid
- Button Grid is not supported as a different data structure, but it can be replicated with Quick Replies as it's button are in net alignment if total label text width more than messenger width 

####Carousel
- Carousel is not supported directly
- Vertical Carousel can be replicated as a number of Card type structures (Picture message plus Quick Replies), where every card may have buttons (different, if needed)