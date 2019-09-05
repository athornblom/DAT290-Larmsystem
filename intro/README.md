# Inledande övning i GIT och LaTeX

Denna övning syftar till att ge en introduktion till Git och LaTeX, två
system/program som används i kursen. Här ges en kort översikt över övningen. Läs
igenom den innan ni kommer till övningen; gör gärna så mycket som möjligt av
övningarna på egen dator för att få ut mesta möjliga vid det handledda
tillfället!


## Git

I kursen ska ni använda versionshanteringssystemet [Git][1]. Git skapades för
att hantera källkoden till Linux-kärnan och är idag ett av de dominerande
systemen för versionshantering. Med hjälp av ett versionshanteringssystem som
Git är det möjligt att följa hur en textmassa förändras över tid och att se vem
som har gjort vilka ändringar.

### Övningsmoment

Ni kommer under övningen att lära er grundläggande funktioner i Git: att sätta
upp ett arkiv (*repository*) och lägga till filer till detta; ni kommer att
arbeta lokalt och mot ett fjärrarkiv.

Under denna del av övningen arbetar ni gemensamt, hela projektgruppen vid en
dator. I slutet av övningen delar ni upp er två och två (eller tre om ni är
grupp med udda antal medlemmar); de som då inte har suttit vid datorn där det
gemensamma arbetet genomfördes utför moment 4.5 _Klona ett arkiv_. 

### Programvaror

Om ni arbetar på Chalmers datorer så finns Git BASH installerat, och det är
detta kommandoradsverktyg som ni ska använda. Det finns också grafiska verktyg
att ladda ner, men under övningen ska ni inte använda er av dessa. Om ni arbetar
på egen dator så kan Git BASH laddas ner för Windows. För Linux eller Mac finns
ofta Git installerat, alternativt kan det installeras med den pakethanterare som
används på det aktuella systemet.

### Filer
* ```git-intro.pdf```: Instruktioner för Git-delen av övningen.


## LaTeX

[LaTeX][2] är ett system för typsättning baserat på TeX som skapades av Donald
Knuth på 1980-talet. TeX skapades för att typsätta matematisk text, och LaTeX är
en utökning med makron för att enklare skapa publikationer. LaTeX är vida använt
inom akademin och för teknisk dokumentation. 

### Övningsmomentet

Under övningen introduceras och tillämpas grundläggande funktionalitet i LaTeX:
indelning i stycken och avsnitt, referenser, listor, figurer och tabeller med
mera. Ni tillhandahålls en LaTeX-källfil (```projektplan-mall.tex```) samt ett
pdf-dokument (```projektplan-mall.pdf```) innehållandes samma textmassa men
strukturerad och formatterad med LaTeX. Källfilen innehåller minimalt med
LaTeX-kod för att kunna kompileras. Er uppgift är att gradvis omvandla källfilen
så att den återfår samma utseende som förlagan.

Under hela denna del av övningen ska ni arbeta i grupper om två eller tre. Varje
grupp ska arbeta mot det gemensamma arkiv som ni har skapat vid första delen av
övningen. Varje grupp skapar en katalog under ```intro/```-katalogen där arbetet
utförs. Checka in era ändringar i Git med jämna mellanrum och pusha till
fjärrarkivet!

### Programvaror

Om ni arbetar på Chalmers datorer så finns den integrerade miljön [MiKTeX][3]
tillgänglig. Denna erbjuder syntaxmarkering, inbyggd visning av det kompilerade
dokumentet, komplettering med mera. MiKTeX kan också installeras på egen dator
(Mac, Linux, Windows). Alternativt kan valfri editor användas. Denna bör då ha
syntaxmarkering för LaTeX, vilket finns i exempelvis Emacs, VIM, Atom, Sublime
och många andra. Då behövs även ett LaTeX-system installeras. Hur detta görs är
beroende av vilken plattform som används, se [The LaTeX Project][4].

Om en integrerad miljö används så finns kan dokumentet ofta renderas genom en
knapptryckning. Om en integrerad miljö inte används så renderas dokumentet
lättast med kommandot ```pdflatex källfil.tex```. 

Det finns också olika tjänster på nätet för att skriva LaTeX. Fördelen med dessa
är att man inte behöver installera någon programvara på den egna datorn och att
flera kan skriva samtidigt i samma dokument. Vi avråder dock från att använda
dessa i projektkursen på grund av att det då inte på ett enkelt sätt går att få
in texten i versionshanteringen.

### Filer
* ```latex-intro.pdf```: Detta dokument utgör ett referensmaterial för
  grundläggande LaTeX samt innehåller de övningar som ni förväntas ha genomfört
  vid övningspassets slut. Källtexten till dokumentet kommer att tillhandahållas
  efter att samtliga grupper klarat av övningen, och kan användas som exempel
  och referensmaterial i det fortsatta arbetet med LaTeX under kursen.
* ```projektplan-mall.pdf```: Detta dokument beskriver hur en projektrapport kan
  struktureras och vad den bör innehålla.
* ```projektplan-mall.tex```: Denna fil är en LaTeX-källfil innehållandes den
  ostrukturerade texten från projektrapportsmallen samt minimal LaTeX-kod för
  att kunna kompileras. Under övningen skall ni återskapa strukturen och
  formateringen så som den visas i ```projektrappor-mall.pdf```.
* ```figurer/tidsplan.pdf```: En bild som används under övningen.
* ```referenser.bib```: En referenslista i BiBTeX-format som används under
  övningen.
* ```IEEtran.bst```: En referensdefinition för IEEE-systemet som används för
  utformningen av referenser.

[1]: https://git-scm.com/
[2]: https://www.latex-project.org/
[3]: https://miktex.org/
[4]: https://www.latex-project.org/get/
