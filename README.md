### Команды которые показаны на видео
sudo iptables -L -vn <br>
sudo apt update <br>
sudo apt install wget nano -y <br>
wget https://raw.githubusercontent.com/Unixweb-RU/ufw/main/install-ufw.sh <br>
nano ./install-ufw.sh <br>
sudo bash install-ufw.sh <br>
#
### Собственно тут перевод комментариев к командам на Русский язык! 
### Обязательно работайте с правами root или sudo
### Установка ufw
sudo apt update
sudo apt install ufw -y
### Проверка того, включен ли IPv6
sudo grep IPV6 /etc/default/ufw
### Настройка правил ufw по умолчанию
sudo ufw default deny incoming
sudo ufw default allow outgoing
### Открытие порта 22 - эти порты необходимы для работы FTP
sudo ufw allow OpenSSH
### Если вы не хотите открывать этот порт, вы можете задать комментарий к этому правилу или удалить его из скрипта.
### Открытие портов 80,443 - эти порты необходимы для работы сайта
### sudo ufw allow 'Nginx Full' если у вас установлен пакет nginx
sudo ufw allow 80,443/tcp
### Открытие портов 21,65000:65500 - эти порты необходимы для работы по протоколу FTP. Не забудьте проверить диапазон портов, настроенный в ProFTPD, выполните эту команду в терминале Linux:
### grep PassivePorts /etc/proftpd.conf
sudo ufw allow 21,65000:65500/tcp
### Открытие портов 25,110,143,465,587,993,995 - эти порты необходимы для работы с почтой
sudo ufw allow 25,110,143,465,587,993,995/tcp
### 
### Если вам нужно открыть порт 3306 mysql, удалите комментарий из правила, убрав знак сетки # в начале правила и заменив IP 192.168.1.1 своим IP-адресом. Не рекомендуется открывать этот порт для всех.
### sudo ufw allow proto tcp from 192.168.1.1 to any port 3306
### Добавление UFW в автозагрузку
sudo systemctl enable ufw
### Включаем UFW
sudo ufw enable
### Выводим статус установленных правил UFW
sudo ufw status
