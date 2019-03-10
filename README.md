# unraid-sftp
Make the data on unraid available via sftp

# Usage

    docker run -d -t -i -e password='secret' \
    -e username='sftpuser' \
    -e publickey='ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAwYRKaVwx7WS/MSsoAk7sqFPP1LO04FcF+y/erPOEbCUU2gOa/BXFzBvFLADMgKUjdoDyWvOIonqLrXrkY5wMx8wbGx0Hwx6/B3xexWPKgfxB/r5Nm5hBTst5ANuAk6cE5ENsNFfPMjZ5vPqJZYc1JLwlnwbfhgdBQkNt2+yjNXTGGOhVJBvZmyIt7Y+z16S6qODDMwCLUuCFVA5eg4WJIPrM5E9GjIgwGupnpeq5iMmsJShDafQEwpMyXbjBdXNfS9QbBdc82UvXnoONnZunMMdVdppLybzwCMb+I/LuQs3tLy/MhlQnQOTejEzSE1YpLeH7bk/cbusXJ+IPdoaIOQ== rsa-key-20190309' \
    -p 22222:22 \
    -v /home/matthew/sftpdata:/data \
    drbrocoli/unraid-sftp

### Environment Variables
You must run the image with the following environment labels:

| Environment Label | Function |
|-------------------|----------|
| `-e username='sftpuser'` | The username of your new sftpuser |
| `-e publickey='ssh-rsa'` | The ssh key for your new user |
| `-e password='secret'` | The password for your new user |