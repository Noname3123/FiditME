# FiditME
Flutter based mobile app for students implementing data from FIDIT website. Created by Benjamin Jakupović for subject "Razvoj desktop i mobilnih aplikacija" in 6th semester of FIDIT studies.

# FUNCTIONALITIES

*	Aplikacija predstavlja rekreaciju FIDIT službene stranice te ima implementirane stranice:
    - O fakultetu (kratki sumirani opis FIDITA sa svih (pod)stranica te prikaz lokacije fidita na karti- implement Open Street Map, Ako postoje numeričke vrijednosti, pokaži ih sa “dashboard gauge”)
    - Upisi – prikaz dokumenata sa upisa na preddiplomski, diplomski i više godine
    - Studiji – Preddiplomski, Diplomski
    - Izvedbeni program za prijediplomski I diplomski studij
*	Aplikaciju koriste studenti preddiplomskih I diplomskih studija te učenici koji će postati studenti.

## Grupe
*	Kada se aplikacija prvi put pokrene, pojavljuje se pop-up dijalog kojim korisnik definira kojoj grupi pripada: učenik, student preddiplomskog i student diplomskog.
*	Postavke grupe su spremljene nakon izbora te su automatski primjenjene nakon svakog učitavanja aplikacije
*	Korisnik u bilo kojem trenutku može promijeniti svoju grupu u postavkama aplikacije
*	Svi korisnici imaju pristup opciji “O fakultetu”, koja prikazuje (ukratko, sumirano), sve informacije o fakultetu
## Učenici 
*	Učenici na stranici “Upisi” imaju pristup dokumentima koji opisuju postupak upisa na preddiplomski studij.
*	Učenici na stranici “Studiji” imaju pristup dokumentima koje prikazuju aktualan program preddiplomskog I diplomskog studija
*	Stranica “Izvedbeni planovi” je skrivena učenicima

## Student preddiplomskog studija
*	Studenti preddiplomskog studija na stranici “Upisi” imaju pristup dokumentima koji opisuju postupak upisa u više godine I u diplomski studij
*	Studenti preddiplomskog studija na stranici “studiji” imaju pristup dokumentima koji prikazuju aktualan program preddiplomskog I diplomskog studija
*	Na stranici “Izvedbeni planovi”, studenti preddiplomskog  studija imaju pristup svim DINP-ovima, svih semestara, preddiplomskih studija  

## Student diplomskog studija
*	Studenti diplomskog studija imaju pristup uputama za upis u više godine na stranici “Upisi”.
*	Studenti diplomskog studija na stranici “studiji” imaju pristup dokumentima koji prikazuju aktualan program diplomskog studija
*	Studenti diplomskog studija na stranici “Izvedbeni planovi” imaju pristup dokumentima koji prikazuju DINP-ove za sve predmete, svih semestara diplomskog studija 

## Postavke
*	U postavkama aplikacije će se moći definirati “light/dark mode” koji će promijeniti boje aplikacije na svijetlo ili tamno. Postavka se sprema te se učitava prilikom otvaranja aplikacije. “Light mode” je “Default” stanje aplikacije. (+)
*	Sve postavke se automatski spremaju i primjenjuju čim korisnik promijeni opciju

## Lokalizacija
*	(opcionalno) Aplikacija je lokalizirana na engleskom I na hrvatskom jeziku te se u postavkama pomoću dropdown liste izabire željeni jezik. (+)

## Dijeljenje (OPCIONALNO)
*   Korisnik može izabrati dokument (npr. Dinp predmeta) te ga podijeliti pomoću aplikacije (npr. Gmail, viber...) drugim korisnicima (OPCIONALNO)
