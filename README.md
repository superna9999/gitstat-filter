Linux Involvement stats
=======================

Used internally for BayLibre to meter the linux involvement.

Taken from : https://github.com/gregkh/kernel-history

And added :

- "-a" option to grep into emails to show in the summary
- "-A" option to grep authors in the "git log"
- "-G" option to grep into commit message in the "git log"

### Examples :

#### Find all contributions and involvement of BayLibre in Linux 4.10

```
$ /path/to/gitstat -N -a baylibre -o v4.9..v4.10
```

Sample output : https://gist.github.com/superna9999/57b58b80b2519b8a0ce0b82b3c4d09f3

#### Find all contributions and involvement on Amlogic patches in Linux 4.10

```
$ /path/to/gitstat -G amlogic -G meson -o v4.9..v4.10
```

Sample output : https://gist.github.com/superna9999/0ea3fedaaf30f0928225f66f8189a031

#### Show all contributions and involvement on BayLibre only patches in Linux 4.10

```
$ /path/to/gitstat -N -A baylibre -o v4.9..v4.10
```

Sample output : https://gist.github.com/superna9999/444ffe6c96555f93b640b2a90baf7f52