README - Script SQL per la Creazione di un Database

Questo script SQL è stato progettato per creare le tabelle necessarie per la creazione di un database chiamato "piscine_comunali". 
un database progettato per gestire informazioni relative alle piscine, ai corsi, agli istruttori, agli iscritti e altro. 

STRUTTURA 

Il Database presenta diverse tabelle  per gestire  diversi tipi di relazioni.
Sono infatti presenti diverse tabelle ponte che gestiscono relazioni molti-a-molti.
Di seguito alcuni esempi:
Tabella corsi_istruttore:

questa tabella collega i corsi agli istruttori. 
Ogni riga in questa tabella rappresenta un collegamento tra un corso e un istruttore specifico. 
Un corso può avere più istruttori, e un istruttore può insegnare diversi corsi. 
Questa tabella gestisce questa relazione molti-a-molti.

Tabella iscritti_corsi:

Questa tabella gestisce le iscrizioni ai corsi. Ogni riga in questa tabella collega un iscritto a un corso specifico.
Gli iscritti possono partecipare a più corsi, e ogni corso può avere più iscritti. 
Questa tabella consente di tenere traccia di chi partecipa a quali corsi.

Le tabelle ponte sono spesso caratterizzate dalla presenza di almeno due colonne che fungono da chiavi esterne, 
una proveniente da ciascuna delle tabelle collegate. 
Ad esempio, nella tabella corsi_istruttore, le colonne id_corso e id_istruttore sono chiavi esterne che collegano i corsi agli istruttori.

