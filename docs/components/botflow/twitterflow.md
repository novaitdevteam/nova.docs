#Nova.BotFlow Twitter
##Features
####Text
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Direct Message text character limit is 10000 characters
• Tweet text character limit is 280 characters
```
</p>
</details>
####Pictures
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Tweet:
	• Photos can be up to 5MB
	• Animated GIFs can be up to 5MB on mobile
	• Animated GIFs can be up to 15MB on web and must be in 1280×1080 resolution
	• Allowed formats: GIF, JPEG, PNG, WEBP files
	• Unallowed formats: BMP, TIFF or other file formats
• Direct Message:
	• Supports MP4, MOV, JPG, PNG, GIF (non-animated) formats
	• Maximum file size of 3 MB for images
	• Recommended size of 30 MB for videos
```
</p>
</details>
####Files
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*
- Only sending of pictures, gif, and video is allowed

<details><summary>Known Restrictions</summary>
<p>
```
• Files size limit up to 512 MB in tweets
• Files size in direct messages recommeded to be around 30 MB
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
• Type: Quick Replies
• Maximum 20 buttons
• Maximum content limit is 10000 characters
• Maximum label (buttons text) limit is 36 characters 
```
</p>
</details>
<figure> <img src="/nova.docs/components/botflow/examples/TwitterFlowQuickReplies.png" title="Twitter Quick Replies" width="600" height"500"> </a> </figure>
####Card
- Card is supported as a separate structure of *Picture*, *Title* with *Subtitle* and *Quick Replies* buttons
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Quick Replies
• Maximum 20 buttons
• Maximum content limit is 10000 characters
• Maximum label (buttons text) limit is 36 characters 
```
</p>
</details>
<figure> <img src="/nova.docs/components/botflow/examples/TwitterFlowCard.png" title="Twitter Card" width="600" height"500"> </a> </figure>
####Button List
- Button List is supported as a Title in form of message with a number of Quick Replies buttons 
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Quick Replies
• Maximum 20 buttons
• Maximum content limit is 10000 characters
• Maximum label (buttons text) limit is 36 characters 
```
</p>
</details>
<figure> <img src="/nova.docs/components/botflow/examples/TwitterFlowButtonlist.png" title="Twitter Button List" width="600" height"500"> </a> </figure>
####Button Grid
- Button List is supported as a Title in form of message with a number of Quick Replies buttons
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Quick Replies
• Maximum 20 buttons
• Maximum content limit is 10000 characters
• Maximum label (buttons text) limit is 36 characters 
```
</p>
</details>
<figure> <img src="/nova.docs/components/botflow/examples/TwitterFlowButtongrid.png" title="Twitter Button Grid" width="600" height"500"> </a> </figure>
####Carousel
- Carousel is not supported because it is rendered as image and text (buttons are transformed to text too)
- Can be substituted with multiple Card templates, in which case, only the last Card will evoke Quick Reply buttons
<figure> <img src="/nova.docs/components/botflow/examples/TwitterFlowCarousel.png" title="Twitter Carousel" width="600" height"500"> </a> </figure>