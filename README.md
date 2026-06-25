# Inlämning1-Powershell

## strukturverktyg.ps1

### Beskrivning
När du startar skriptet möts du av en fråga där du får skriva in ett namn för en huvudmapp. Så fort du trycker på "ENTER" skapas denna mapp, och inuti den byggs automatiskt tre undermappar upp med namnen `logs`, `scripts` och `temp`. 

Skriptet nöjer sig inte bara med mappar, utan skapar även en loggfil i textformat inuti logs-mappen. Denna fil döps automatiskt efter dagens datum, till exempel `log-2026-06-26.txt`. Inuti textfilen sparas en rad som registrerar tidpunkten för skapandet, exempelvis: *Struktur skapad: 2026-06-26*.

### Hur man kör skriptet
Det finns inga krav på att köra skriptet som administratör. 

1. Öppna Powershell 7 x64.
2. Navigera till sökvägen där skriptet finns med hjälp av cd-kommandot. Exempelvis: `cd "C:\Program Files"`
3. Skriv följande kommando direkt i samma powershellruta: `.\strukturverktyg.ps1`
    
*Om kommandot ovan ej skulle funka på grund av säkerhetsinställningar, kör istället följande:*
`powershell -ExecutionPolicy Bypass -File .\strukturverktyg.ps1`

### Reflektion (Svårt eller intressant)
* **Utmanande med struktur:** Den största utmaningen var att strukturera upp logiken runt alla funktionsanrop (function calls) och loopar. Det var lätt att röra till det för sig själv under kodningen och tappa bort sig i vilken ordning allt hände. Men efter en hel del testande, felsökning och justeringar blev det mycket lättare att förstå och följa hur koden faktiskt exekveras steg för steg.

* **Intressant att se resultatet:** Det absolut roligaste och mest lärorika var att se koden "vakna till liv" i praktiken. Eftersom jag inte har programmerat eller skrivit skript på det här sättet tidigare, var det en häftig känsla att se hur datorn på bara en sekund faktiskt skapade alla mappar och genererade textfilen helt automatiskt baserat på raderna jag skrivit. Det gav verkligen mersmak!
