# MySQL-Windows-

# 1.0
## 1.1 Initaldaten erstellen
Auf dem gibb Filestash in dem Module Ordner die Datei "frigg_0.6_all.deb". Dann in das Verzeichnis wo die Datei abgelegt ist gehen mit dem Terminal. Mit dem Befehl:               
```ll``` <br>
Dann kannst du sehen das die Datei nicht executable ist um das zu ändern gib den Befehl:
<br> ```sudo chmod 777 <dateiname>``` <br>
Dann noch "gdebi" installieren, jedoch zu erst die Repository updaten mit dem Befehl:
<br>```sudo apt-get update``` <br>
Mit dem unten stehenden Befehl kann man dann "gdebi" installieren: 
<br>```sudo apt-get install gdebi``` <br>
Dann wird eine Bestätigung gefordert um die Installation fortzufahren. _Hinweis: Bei Linux ist es immer der gross geschriebene Buchstabe im (J/n) der Default-Wert in dem Beispiel also Ja. Also kann man es mit einem simplen Enter bestätigen._
Um fortzufahren führst du jetzt die Datei aus. Mit dem Befehl:
<br>```sudo gdebi <dateiname>``` <br>
Gegen Mitte der Installation wird gefragt: "Would you like to configure as much as possible automatically?" dann bestätigst mit Enter (Default-Wert = Yes). Am Ende kommen dann wieder Abfragen: VORNAMEN: <Dein Vorname>. NACHNAMEN: <Dein-Nachname>. KLASSE: <Deine-Klasse> (in unserem Fall: INF2022B).
Dann um die Datei in einer CSV Datei abzuspeichern diesen Befehl ausführen:
<br>```sudo frigg /opt/frigg/ > import-vorname-nachname.csv``` <br>
Du kannst oben auch ein anderer Dateiname als import... nehmen.

## 1.2 MySQL Installation und konfigurieren
Wir wollen auf dem Windows Server MySQL installieren und so konfigurieren das wir zugriff vom Client aus haben. Installiere MySQL-Server auf dem Winows-Server. Link: "https://dev.mysql.com/downloads/mysql/". Du kannst MySQL-Server nach Default installieren. Ich habe jedoch die Option ausgewählt das MySQL maximale Leistung des Servers darf benutzen, da ich vor habe MySQL Workbench auf dem Client zu installieren. Das spielt in unserem Fall keine grosse Rolle. Willst du dich mit dem Client auf den MySQL-Server verbinden dann musst du zu erst die richtigen Ports auf der Windows eigen Firewall öffnen. Link zum Tutorial: "https://www.netzwelt.de/anleitung/181406-windows-10-firewall-so-oeffnet-ports.html". Ich habe den Port: 3306 Geöffnet und noch andere wie z.B. ICMP um den Server pingen zu können. Wichtig ist auch ein Remote User zu erstellen! <br>
<img width="500" alt="image" src="https://github.com/DRKTRZY/MySQL-Windows-/assets/94437473/6c4036d5-6739-4c42-a384-ddab0dc890ee"> <br>
Hier kann man sehen das ich mich vom Client auf den MySQL-Server verbinde. Mit der Workbench auf dem Client.

