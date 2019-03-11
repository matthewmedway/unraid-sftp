
#build command:
docker build ./sftp -t drbrocoli/unraid-sftp --build-arg password=test1234 --build-arg username=sftpuser \
--build-arg publickey=rsa-testkey
docker build sftp -t medway2

#run command:
docker run -d -p 22222:22 medway
sftp -P 22222 sftpuser@127.0.0.1
docker exec -it d631bce2750a /bin/bash
docker run -v /home/matthew/sftpdata:/data -d -p 22222:22 medway

docker build sftp -t medway3

docker run -v /home/matthew/sftpdata:/data -d -p 22222:22 medway3 \
-e password=test1234 -e username=test1234 -e password=username


docker logs medway3 -f


docker run -v /home/matthew/sftpdata:/data -d -p 22222:22 medway3 \
password username key

docker run -v /home/matthew/sftpdata:/data -d -p 22222:22 medway3 \
-e password=secret -e username=sftpuser -e key=secretkey

docker run -v /home/matthew/sftpdata:/data -d -p 22222:22 medway3 \
--env password='secret'

docker run -d -t -i -v /home/matthew/sftpdata:/data -d -p 22222:22 medway3 \
-e PASSWORD='secret'



docker build . -t unraid-sftp
docker run -d -t -i -e password='secret' \
-e username='sftpuser' \
-e publickey='ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAwYRKaVwx7WS/MSsoAk7sqFPP1LO04FcF+y/erPOEbCUU2gOa/BXFzBvFLADMgKUjdoDyWvOIonqLrXrkY5wMx8wbGx0Hwx6/B3xexWPKgfxB/r5Nm5hBTst5ANuAk6cE5ENsNFfPMjZ5vPqJZYc1JLwlnwbfhgdBQkNt2+yjNXTGGOhVJBvZmyIt7Y+z16S6qODDMwCLUuCFVA5eg4WJIPrM5E9GjIgwGupnpeq5iMmsJShDafQEwpMyXbjBdXNfS9QbBdc82UvXnoONnZunMMdVdppLybzwCMb+I/LuQs3tLy/MhlQnQOTejEzSE1YpLeH7bk/cbusXJ+IPdoaIOQ== rsa-key-20190309' \
-p 22222:22 \
-v /home/matthew/sftpdata:/data \
unraid-sftp


ln --symbolic --force /dev/console /var/log/sftp-server.log

docker run -d --name='unraid-sftp-test' --net='bridge' -e TZ="America/New_York" -e 'username'='sftpuser' -e 'password'='test123' -e 'publickey'='ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAwYRKaVwx7WS/MSsoAk7sqFPP1LO04FcF+y/erPOEbCUU2gOa/BXFzBvFLADMgKUjdoDyWvOIonqLrXrkY5wMx8wbGx0Hwx6/B3xexWPKgfxB/r5Nm5hBTst5ANuAk6cE5ENsNFfPMjZ5vPqJZYc1JLwlnwbfhgdBQkNt2+yjNXTGGOhVJBvZmyIt7Y+z16S6qODDMwCLUuCFVA5eg4WJIPrM5E9GjIgwGupnpeq5iMmsJShDafQEwpMyXbjBdXNfS9QbBdc82UvXnoONnZunMMdVdppLybzwCMb+I/LuQs3tLy/MhlQnQOTejEzSE1YpLeH7bk/cbusXJ+IPdoaIOQ== rsa-key-20190309' -p '22222:22/tcp' -v '/home/matthew/sftpdata':'/data':'rw' 'drbrocoli/unraid-sftp' 