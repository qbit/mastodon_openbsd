mastodon_openbsd
================

Playbooks / roles to bring an OpenBSD machine up as a Mastodon instance.

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

* Remote host has Python 2.7 installed (`pkg_add -z python-2.7`)
* Remote host is running OpenBSD-current (snapshots)
* /var has enough space for the entire Mastodon install (~250M)
* You have pre-configured values for:
    * PAPERCLIP_SECRET
    * SECRET_KEY_BASE
    * OTP_SECRET
    * VAPID private and public key

# Status

- [X] Database install / configuration
    - [X] Redis
    - [X] PostgreSQL
- [X] NGINX install / configuration
    - [X] Acme SSL certs with automatic renewal.
- [X] Mastodon install / configuration
    - [ ] Rake tasks
    - [X] verification of code via PGP and git (fsckobjects)
    - [ ] Pre-generating Secrets
    - [ ] Pre-generating VAPID keys
    - [ ] RC scripts for clean startup

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
