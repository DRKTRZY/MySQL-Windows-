DROP USER IF EXISTS 'friggapp'@'localhost';
DROP USER IF EXISTS 'friggapp'@'%';
DROP USER IF EXISTS 'friggrep'@'localhost';
DROP USER IF EXISTS 'friggrep'@'%';
CREATE USER 'friggapp'@'localhost' IDENTIFIED BY 'sml12345';
CREATE USER 'friggapp'@'%' IDENTIFIED BY 'sml12345';
CREATE USER 'friggrep'@'localhost' IDENTIFIED BY 'sml12345';
CREATE USER 'friggrep'@'%' IDENTIFIED BY 'sml12345';
GRANT ALL ON *.* TO 'friggapp'@'localhost';
GRANT ALL ON *.* TO 'friggapp'@'%';
GRANT SELECT ON *.* TO 'friggrep'@'localhost';
GRANT SELECT ON *.* TO 'friggrep'@'%';
FLUSH PRIVILEGES;
