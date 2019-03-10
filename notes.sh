
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



docker build . -t medway
docker run -d -t -i -e password='secret' \
-e username='sftpuser' \
-e publickey='key' \
-p 22222:22 \
-v /home/matthew/sftpdata:/data \
medway