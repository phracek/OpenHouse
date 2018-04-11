Testing memcached container by MTF for OpenHouse
================================================

MTF is the tool which can help you with testing containers, so you guarantee that container works

Install MTF
-----------

```bash
$ dnf copr enable phracek/meta-test-family
$ dnf install -y meta-test-family
```

How to test memcached container
-------------------------------

```bash
make test_mtf
```

The repository contains these files:
* [config.yaml](./config.yaml) ... configuration file for MTF
* [Dockerfile](./Dockerfile) ... dockerfile which will build container
* [sanity1.py](./sanity1.py) ... python testing file, which contains all tests
* [help.1](./help.1) ... manual page for memcached container
* [Makefile](./Makefile) ... makefile which contains all needed make targets
