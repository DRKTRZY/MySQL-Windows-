# das Team:
fine1k - Mykhail Myronov | 
DRKTRZY - Andrija Draca | 
reaIhumanbean - Aleksandrs Rudzitis | 
Baj140316 - Besfort Ajeti | 
k4d1rd - Kadir Dikbas | 

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

## 1.3 Temmporäre Tabelle mit Initaldaten erstellen
Der einfachste Weg ist es auf MySQL Workbench sich mit dem Datenbank Server zu verbinden und dann unter Schemas einen Rechtsclick auf Tables zu machen und dann auf "Table Data Import Wizard" zu klicken.

![grafik](https://github.com/DRKTRZY/MySQL-Windows-/assets/116079624/6bc456d0-da8a-4d24-86a8-a13add3678fe)

Danach muss man einfach den Pfad zu der zuvor erstellten Initaldaten hinterlegen und die ganze Zeit auf "Next" klicken bis die Tabelle erstellt ist.

![grafik](https://github.com/DRKTRZY/MySQL-Windows-/assets/116079624/e303a2b0-ed50-4d32-aa1b-ba557da50a27)

2.0 Webserver
2.1 Routing
Zu aller erst konfigurieren wir die YAML-File von dem Webserver:
<img width="487" alt="image" src="https://github.com/DRKTRZY/MySQL-Windows-/assets/94437473/cde0fe8c-facc-4826-930a-2d449f0d3708">

Dann installieren wir das Paket "gdebi" oben bei der Initialdaten Erstellung ist erklärt mit welchem Command. Dann vom Filestash die "gna_0.7_all.deb" und die dazugehörige Config-File installieren und auf den Web-Server packen mit z.B. WINSCP oder FileZilla. Dann diesen Command ausführen: 
sudo gdebi gna_0.7_all.deb
Dann noch die Config-File vom Filestash in das richtige Verzeichnis legen. Mit den Commands:
<br>```rm /etc/gna.conf.yaml``` <br>
<br>```mv gna.conf.yaml /etc```<br>

2.2 GNA Config Konfigurieren
Die Verbindungsangaben um sich mit der Datenbank zu verbinden:
<img width="699" alt="image" src="https://github.com/DRKTRZY/MySQL-Windows-/assets/94437473/43fbad32-3271-446a-8a9f-01dca459704a">

GNA Benötigt noch den passenden Treiber in unserem Fall für MySQL. Commands:
<br>```sudo apt install libdbd-mysql-perl``` <br>
Falls es mit apt install nicht klappt den unteren Command benutzen:
<br>```sudo cpan install DBD::mysql``` <br>

2.3 Firewall konfigurieren
Vom Client aus kann man mit der IP und Port auf die Firewall per Web-GUI zugreifen: 
<br>```192.168.210.1:444```<br>
Login für die Firewall ist: ***admin*** PW: ***sml12345***
Nach dem wir uns eingeloggt haben müssen wir neue Rules definieren damit man vom Orangen Netz ins Grüne mit bestimmten Ports kommunizieren kann. In meinem Fall nehme ich das Protokoll ICMP und den Port für MySQL: 3306 TCP. 
<br> <img width="706" alt="image" src="https://github.com/DRKTRZY/MySQL-Windows-/assets/94437473/4628cae7-358f-4151-9015-60e14e83c2c6"> <br>
Dann sollte die Konfiguration auch schon fertig sein für die Firewall. Dann nur noch GNA starten mit dem Befehl:
gna
Dann auf de Client per Browser auf die IP-Adresse: 192.168.220.25:3000




 
