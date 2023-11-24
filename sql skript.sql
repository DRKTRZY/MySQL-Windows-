-- Erstelle die Datenbank "frigg"
DROP DATABASE IF EXISTS frigg;
CREATE DATABASE frigg;
 
-- Verwende die Datenbank "frigg" für alle folgenden Operationen
USE frigg;
 
-- Erstelle die Tabelle "Type"
CREATE TABLE Type (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Eindeutige ID für den Datensatz
    name VARCHAR(100) -- Name der Art
);
 
-- Erstelle die Tabelle "Data"
CREATE TABLE Data (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Eindeutige ID für den Datensatz
    digest CHAR(100), -- Digest-Wert für die Daten
    size INT, -- Größe der Daten
    compression INT, -- Art der Datenkompression
    content VARCHAR(500), -- Inhalt der Daten
    type_id INT, -- Fremdschlüssel, der auf die Tabelle "Type" verweist
    FOREIGN KEY (type_id) REFERENCES Type(id)
);
 
-- Erstelle die Tabelle "Tag"
CREATE TABLE Tag (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Eindeutige ID für den Tag
    name VARCHAR(100) -- Name des Tags
);
 
-- Erstelle die Tabelle "Data_Tag" für die viele-zu-viele-Beziehung zwischen "Data" und "Tag"
CREATE TABLE Data_Tag (
    id int primary key auto_increment,
    Tag_id INT,
    Data_id INT,
    FOREIGN KEY (Tag_id) REFERENCES Tag(id),
    FOREIGN KEY (Data_id) REFERENCES Data(id)
);
 
-- Erstelle die Tabelle "systemuser" für Benutzerinformationen
CREATE TABLE systemuser (
    uid INT PRIMARY KEY AUTO_INCREMENT, -- Eindeutige ID für den Benutzer
    name VARCHAR(20) -- Name des Benutzers
);
 
-- Erstelle die Tabelle "usergroup" für Benutzergruppen
CREATE TABLE usergroup (
    gid INT PRIMARY KEY AUTO_INCREMENT, -- Eindeutige ID für die Benutzergruppe
    groupname VARCHAR(50) -- Name der Benutzergruppe
);

-- Erstelle die Tabelle "Meta" für Metadaten
CREATE TABLE Meta (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Eindeutige ID für die Metadaten
    path VARCHAR(50), -- Pfad zu den Daten
    permission INT, -- Berechtigungen für die Daten
    time INT, -- Zeitstempel für die Metadaten
    usergroup_gid INT, -- Fremdschlüssel, der auf die Tabelle "usergroup" verweist
    Data_id INT, -- Fremdschlüssel, der auf die Tabelle "Data" verweist
    systemuser_uid INT, -- Fremdschlüssel, der auf die Tabelle "systemuser" verweist
    FOREIGN KEY (usergroup_gid) REFERENCES usergroup(gid),
    FOREIGN KEY (Data_id) REFERENCES Data(id),
    FOREIGN KEY (systemuser_uid) REFERENCES systemuser(uid)
);
