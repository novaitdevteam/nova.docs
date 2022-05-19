#Nova.BotConnector
###Flowcharts
###Incoming Message

<div class="mermaid">
graph TB;
  A{Customer IM} --> |IM proprietary Protocol| B[Messenger];
  B -->|IM Webhook Communication Protocol| C[Webhook URL for incoming messages];
  C --> |:443| D[Reverse-Proxy - e.g. enginx];
  D --> E[BotConnector - unification];
  subgraph Nova.ChatsConnector;
  E -->|:8080| F[ChatProxy - de-unification];
  E & F -->|:27017| J[(MongoDB - Database)];
  end;
  F --->|:500X| G[Internal System: Genesys - PureConnect, PureEngage, PureCloud, Cisco - UCCE, UCCX, NovaIT - Nova.Chats];
  G -->  H[Operator];
</div>

###Outgoing Message

<div class="mermaid">
graph TB;
  H[Operator] --> G[Internal System: Genesys - PureConnect, PureEngage, PureCloud, Cisco - UCCE, UCCX, NovaIT - Nova.Chats];
  G --> F[ChatProxy - de-unification];
  subgraph Nova.ChatsConnector;
  F[ChatProxy - de-unification] -->|:27017| J[(MongoDB - Database)];
  E[BotConnector - unification] -->|:27017| J[(MongoDB - Database)];
  F --> |:8080| E[BotConnector - unification];
  end;
  E ---> D[Reverse-Proxy - e.g. enginx];
  D --> |:443| C[Webhook URL for incoming messages];
  C --> |IM Webhook Communication Protocol| B[Messenger];
  B --> |IM proprietary Protocol| A{Customer IM};
</div>