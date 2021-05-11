# acp411image


```
docker build -t acpimage dockerfile
```

```
docker run -it --name acpdocker -d --privileged=true --cap-add=NET_ADMIN  -v /root:/mnt -p 8080:8080 -p 8096:8096 axar1990/acp411image /usr/sbin/init
```


```
docker exec -it acpdocker /root/cpsetup.sh
```

```
docker exec -it acpdocker /root/acphf.sh
```

