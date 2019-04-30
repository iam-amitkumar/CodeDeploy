#!/bin/bash
sudo su
apt-get install python3-pip python3-dev nginx git -y
apt-get install virtualenv -y
virtualenv --python=python3 /home/venv
source /home/venv/bin/activate
pip3 install -r /home/ChatApp/requirements.txt
pip3 install Django==2.1.3
pip3 install django-widget-tweaks==1.4.1
pip3 install djangorestframework==3.7.3
pip3 install pytz==2017.3
pip3 install python3-memcached
pip3 install django bcrypt django-extensions
pip3 install gunicorn
pip3 install django bcrypt django-extensions
cd /home/ChatApp
python3 manage.py collectstatic
python3 manage.py migrate
cp /home/ChatApp/files/gunicorn.service /etc/systemd/system/
systemctl daemon-reload
systemctl start gunicorn
systemctl enable gunicorn
unlink /etc/nginx/sites-enabled/*
cp /home/ChatApp/files/ChatApp /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/ChatApp /etc/nginx/sites-enabled
nginx -t
rm /etc/nginx/sites-enabled/default
service nginx restart

# #!/bin/bash
#sudo apt-get install python3-pip python3-dev nginx git -y
#sudo apt-get install virtualenv -y
#virtualenv --python=python3 /home/venv
##chown ubuntu:ubuntu /home/ubuntu/ChatApp-Django
#source /home/venv/bin/activate
#pip3 install -r /home/ChatApp/requirements.txt
#pip3 install Django==2.1.3
#pip3 install django-widget-tweaks==1.4.1
#pip3 install djangorestframework==3.7.3
#pip3 install pytz==2017.3
#pip3 install python3-memcached
#pip3 install django bcrypt django-extensions
#pip3 install gunicorn
#pip3 install django bcrypt django-extensions
#cd /home/ChatApp
#python3 manage.py collectstatic
##sudo cp /home/ChatApp/files/gunicorn.service /etc/systemd/system/
#sudo systemctl daemon-reload
#sudo systemctl start gunicorn
#sudo systemctl enable gunicorn
#sudo unlink /etc/nginx/sites-enabled/*
#sudo cp /home/ChatApp/files/ChatApp /etc/nginx/sites-available/
#sudo ln -s /etc/nginx/sites-available/ChatApp /etc/nginx/sites-enabled
#sudo nginx -t
#sudo rm /etc/nginx/sites-enabled/default
#sudo service nginx restart
