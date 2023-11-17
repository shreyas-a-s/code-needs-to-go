- To get the name:
```bash
sh -c 'ps -p $$ -o ppid=' | xargs ps -o comm= -p
```
- OR to get full path of executable:
```bash
sh -c 'ps -p $$ -o ppid=' | xargs -I'{}' readlink -f '/proc/{}/exe'
```
source: https://askubuntu.com/a/1022440
