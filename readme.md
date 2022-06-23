To change VM and other stuffs related to sysctl to help with Java things:

in MAC
```bash
docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh
```

in Windows
```powershell
wsl -d docker-desktop
```

After connect, execute commands to adjust limits and vm
```bash
sysctl -w vm.max_map_count=524288
sysctl -w fs.file-max=131072
ulimit -n 131072
ulimit -u 8192
```