#### Команды которые показаны на видео
<code>sudo iptables -L -vn <br>
sudo apt update <br>
sudo apt install wget nano -y <br>
wget https://raw.githubusercontent.com/Unixweb-RU/ufw/main/install-ufw.sh <br>
nano ./install-ufw.sh <br>
sudo bash install-ufw.sh</code>
#
##### Собственно тут перевод комментариев к командам на Русский язык! 
##### Обязательно работайте с правами root или sudo
#### Установка ufw
<code>sudo apt update<br>
sudo apt install ufw -y</code>
#### Проверка того, включен ли IPv6<br>
<code>sudo grep IPV6 /etc/default/ufw</code><br>
#### Настройка правил ufw по умолчанию<br>
<code>sudo ufw default deny incoming</code><br>
<code>sudo ufw default allow outgoing</code><br>
#### Открытие порта 22 - эти порты необходимы для работы FTP<br>
<code>sudo ufw allow OpenSSH</code><br>
##### Если вы не хотите открывать этот порт, вы можете задать комментарий к этому правилу или удалить его из скрипта.
#### Открытие портов 80,443 - эти порты необходимы для работы сайта
##### sudo ufw allow 'Nginx Full' если у вас установлен пакет nginx<br>
<code>sudo ufw allow 80,443/tcp</code><br>
##### Открытие портов 21,65000:65500 - эти порты необходимы для работы по протоколу FTP. Не забудьте проверить диапазон портов, настроенный в ProFTPD, выполните эту команду в терминале Linux:
##### grep PassivePorts /etc/proftpd.conf<br>
<code>sudo ufw allow 21,65000:65500/tcp</code><br>
#### Открытие портов 25,110,143,465,587,993,995 - эти порты необходимы для работы с почтой<br>
<code>sudo ufw allow 25,110,143,465,587,993,995/tcp</code><br>
#### 
##### Если вам нужно открыть порт 3306 mysql, удалите комментарий из правила, убрав знак сетки # в начале правила и заменив IP 192.168.1.1 своим IP-адресом. Не рекомендуется открывать этот порт для всех.<br>
##### sudo ufw allow proto tcp from 192.168.1.1 to any port 3306
#### Добавление UFW в автозагрузку<br>
<code>sudo systemctl enable ufw</code><br>
#### Включаем UFW<br>
<code>sudo ufw enable</code><br>
#### Выводим статус установленных правил UFW<br>
<code>sudo ufw status</code><br>
