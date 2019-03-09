
#build command:
docker build ./sftp -t drbrocoli/unraid-sftp --build-arg password=test1234 --build-arg username=sftpuser \
--build-arg publickey=rsa-testkey

#run command:
docker run -d -p 22222:22 medway
sftp -P 22222 sftpuser@127.0.0.1
docker exec -it d631bce2750a /bin/bash
docker run -v /home/matthew/sftpdata:/sftpdata -d -p 22222:22 medway 

docker run -v /home/matthew/sftpdata:/data -d -p 22222:22 medway