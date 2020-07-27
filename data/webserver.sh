#!/bin/bash
# Install Docker
yum install -y docker

service docker start

cat << EOF >> /etc/fstab
/dev/xvdf   /my_stoarge     ext4   defaults,nofail 0   0
EOF

mkdir /my_storage
chmod 777 /my_storage
sleep 300
mount /my_storage

cat << EOF > /my_storage/index.html
<h1>Hello AWS World</h1>
<a href="https://github.com/saadkhattak/png/data">source code</a>
EOF

docker run -d --name awsdemo -v /my_storage:/usr/share/nginx/html:ro -p 80:80 --restart always nginx
