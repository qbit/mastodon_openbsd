mastodon_openbsd
================

Playbooks / roles to bring an OpenBSD machine up as a Mastodon instance.

[![asciicast](https://asciinema.org/a/157827.png)](https://asciinema.org/a/157827?speed=3)

# Using

On your management machine:
```
doas pkg_add ansible
git clone https://github.com/qbit/mastodon_openbsd.git
cd mastodon_openbsd
cp hosts.example hosts
...modify hosts file. adding your instance name, etc...
ansible-playbook site.yml
```

# Assumptions

* Target machine is a *FRESH* install. If it isn't your configurations might get whacked!
* Target machine has a large amount of RAM (Test instance has 8G).
* Remote host has Python 2.7 installed (`pkg_add -z python-2.7`).
* Remote host is running OpenBSD-current (snapshots).
* /var has enough space for the entire Mastodon install (~250M).
* `instance_name` is the FQDN of your desired Mastodon instance.

# Status

- [X] Database install / configuration
    - [X] Redis
    - [X] PostgreSQL
- [X] NGINX install / configuration
    - [X] Acme SSL certs with automatic renewal.
- [X] Mastodon install / configuration
    - [X] Verification of code via PGP and git (fsckobjects)
    - [X] Generation of Secrets
    - [X] Generation of VAPID keys
    - [ ] RC scripts for clean startup
- [X] Mail service

# LICENSE

```
/*
 * Copyright (c) 2018 Aaron Bieber <aaron@bolddaemon.com>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */
 ```
