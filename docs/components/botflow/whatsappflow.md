#Nova.BotFlow WhatsApp
##Features
####Text
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Text character limit: 65,536 (counting the spaces)
```
</p>
</details>
####Pictures
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Picture (and all other media) size limit up to 16 MB
```
</p>
</details>
####Files
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• File size limit up to 100 MB
• Video (and all other media) size limit up to 16 MB
```
</p>
</details>
####Emoji
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

####Quick Replies
Quick Replies are supported as a disappearing after click/tap **keyboard** buttons
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Custom Template
• Message templates are created in the WhatsApp Manager, which is part of your WhatsApp Account in the Facebook Business Manager
• Template needs to be approved by Facebook
• Maximum 3 buttons
• Maximum header length 60 characters 
• Maximum message length 1,024 characters
• Maximum label length (button text) up to 20 characters
```
</p>
</details>
<figure> <img src="/nova.docs/components/botflow/examples/WhatsAppFlowQuickReplies.png" title="WhatsApp Quick Replies" width="600" height"500"> </a> </figure>
####Card
- Card is not supported, but can be replicated as Picture message then Quick Replies

####Button List
- Button List is not supported as a different data structure, but it can be replicated with Quick Replies as it's button aligned vertically if total label text width equal or less of messenger width

####Button Grid
- Button Grid is not supported as a different data structure, but it can be replicated with Quick Replies as it's button are in net alignment if total label text width more than messenger width 

####Carousel
- Carousel is not supported directly
- Vertical Carousel can be replicated as a number of Card type structures (Picture message plus Quick Replies), where every card may have buttons (different, if needed)