# Movie Review Ajax App
- - -


## Giorno 6 della mia sfida 12


&nbsp;

#### Introduzione
Il mio obbiettivo di questa sfida è quello di insegnare a me stesso come creare delle applicazioni utilizzando Ruby on Rails in sinergia con Ajax, come base sono stati presi gli ottimi screencast di [12 in 12 Challenge](https://mackenziechild.me/12-in-12/), durante questi esercizi sperimenterò nuovo tecnologie per trovare gli strumenti più adatti alle mie esigenze e al tipo di applicazione che devo sviluppare.
&nbsp;

#### Descrizione
Questa settimana creeremo una applicazione minimale per la recensione di Film, l'applicazione gestisce la creazione e modifica di Utenti  Film e Recensioni.
Per diminuire i tempi di attesa e rendere più reattiva l'applicazione, ho utilizzato Ajax in quasi ogni parte del sito, come potete vedere dal video i tempi di reazione sono molto veloci.

Non ho utilizzato nessun client-side MVC frameworks(React,Angular,Ember..), per vari motivi:
In primis per uno scopo didattico, reputo sia più proficuo imparare prima le basi e poi gli strumenti che facilitano il nostro lavoro come i Framework, se partissi direttamente da un Framework sarebbe come sviluppare in Rails senza saper programmare in Ruby, non avrebbe senso.

In secondo luogo per applicazioni banali come questa, non penso ci sia la necessità di utilizzare un Framework che andrebbe solo ad appesantire e duplicare le ottime funzionalità già presenti in Rails vedi Routes,View,ecc...

Inoltre non mi piace seguire le tendenze, che magari sono diventate famose solo perchè sviluppate da grosse società vedi Google e Facebook. Preferisco sperimentare e adottare nuove tecnologie anche se meno conosciute ma più idonee alle mie esigenze e al tipo di applicativo che devo sviluppare, e questo il motivo per cui circa 10 anni fa ho incominciato a sviluppare in Ruby anche se nessuno lo conosceva, rispetto a linguaggio tipo Java.

Reputo che in campo informatico la strada più difficile da percorrere sia quella che da meno gratificazione immediata ma con il tempo si guadagna in risultati e soddisfazione, basta seguire il proprio istinto, che difficilmente sbaglierà.

Questo non vuol dire che sono contro i Framework, non avrei adottato Rails se fossi contro, voglio solo sperimentare e fare le giuste considerazioni prima di adottare un Framweork e capire se è quello giusto per il tipo di lavoro che sto svolgendo.

Per una miglior gestione organizzativa dei miei Assets Javascript ho utilizzato [rails_script](https://github.com/gemgento/rails_script) una gemma che mi permette di scrivere codice CoffeeScript orientato agli oggetti, inoltre mi permette di eseguire codice Javascript specifico per Controller o Azione.

Per esempio:
```
# app/assets/javascripts/users.js.coffee

window.App ||= {}
class App.Users extends App.Base
   show: =>
      console.log 'users#show'
```

&nbsp;

#### Descrizione
Qui di seguido una piccola dimostrazione dell'applicazione in azione:

[![Movie Review](https://i.ytimg.com/vi/shUwPNLtJMA/hqdefault.jpg)](https://www.youtube.com/watch?v=shUwPNLtJMA "Movie Review")


#### Dipendenze
Per far funzionare la ricerca devo installare elasticsearch(6.2.2), e avviare il server
Nel caso in ci fossero dei problemi con l'index devo eseguire il seguente comando dalla root della mia app
```
rake searchkick:reindex:all
```