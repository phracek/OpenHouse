Testing memcached container with MTF for OpenHouse
================================================

[Meta Test Family (MTF)](http://meta-test-family.readthedocs.io) is the tool which can help you with testing containers, so you can guarantee that a container works.

Install MTF
-----------

```bash
$ dnf copr enable phracek/meta-test-family
$ dnf install -y meta-test-family
```

Build custom memcached image from [Dockerfile](./Dockerfile)

```bash
make build
```

Test memcached container with MTF
-------------------------------

```bash
make test_mtf
```

You should see 2 from 3 tests failing

```bash
 (1/3) sanity1.py:SanityCheck1.test_smoke: PASS (15.27 s)
 (2/3) sanity1.py:SanityCheck1.test_binary: ERROR (15.04 s)
 (3/3) sanity1.py:SanityCheck1.test_config: ERROR (15.95 s)
```

Your task is to make [them](./sanity1.py) all pass (green).

```bash
 (1/3) sanity1.py:SanityCheck1.test_smoke: PASS (26.69 s)
 (2/3) sanity1.py:SanityCheck1.test_binary: PASS (14.93 s)
 (3/3) sanity1.py:SanityCheck1.test_config: PASS (14.76 s)
```

The repository contains these files:
* [config.yaml](./config.yaml) ... configuration file for MTF
* [Dockerfile](./Dockerfile) ... dockerfile which will build image
* [sanity1.py](./sanity1.py) ... python testing file, which contains all tests
* [help.1](./help.1) ... manual page for memcached container
* [Makefile](./Makefile) ... makefile with all needed make targets
