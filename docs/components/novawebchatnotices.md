{%
   include-markdown ".\links.md"
   start="<!--datelink-webchat-start-->"
   end="<!--datelink-webchat-end-->"
   rewrite-relative-urls=true
%}

{%
   include-markdown ".\glossary.md"
   start="<!--glossary-start-->"
   end="<!--glossary-end-->"
   rewrite-relative-urls=true
%}

#Nova.WebChat

*Nova.WebChat is a JS WebChat for Nova.BotConnector. Based on Recast.*

##Features
###Component specific

- Loading of previous conversation content (history) from Mongodb [:material-location-enter:] [2018r3]
- Seamless integration with BotConnector [:material-location-enter:] [2018r3]
- Configuration can be loaded from static json file [:material-location-enter:] [2018r3]