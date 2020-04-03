Imposm For Windows x64
======
This repository is created to support windows execution of Imposm. 

I tried to have minimum changes from original source.

I have tested import command successfully. Please tell me if you had any error for any command.

See installation instruction to install.

Imposm
======
The development of Imposm is sponsored by [Omniscale](https://omniscale.com/).


Installation
------------
You need Go Compiler and [tdm-gcc](https://jmeubank.github.io/tdm-gcc/) before doing any thing.

`1. Create a new directory and name it anything you want.`

`2. Download "install.ps1" from this repository and place it in your directory.`

`3. Execute "install.ps1".`

After execution of the install script, binaries will be in "bin" directory.


### Source

There are some dependencies:

#### Compiler

You need [Go >=1.9](http://golang.org) and [tdm-gcc](https://jmeubank.github.io/tdm-gcc/).

#### C/C++ libraries

Other dependencies are [libleveldb][] and [libgeos][].
These dependencies are included in this repository. There is no need to install.
They are compiled by by my self, becuase they have no windows binary too.

[libleveldb]: https://github.com/google/leveldb/
[libgeos]: http://trac.osgeo.org/geos/ 

Usage
-----

`imposm` has multiple subcommands. Use `imposm import` for basic imports.

For a simple import:

    imposm import -connection postgis://user:password@host/database \
        -mapping mapping.json -read /path/to/osm.pbf -write

You need a JSON file with the target database mapping. See `example-mapping.json` to get an idea what is possible with the mapping.

Imposm creates all new tables inside the `import` table schema. So you'll have `import.osm_roads` etc. You can change the tables to the `public` schema:

    imposm import -connection postgis://user:passwd@host/database \
        -mapping mapping.json -deployproduction


You can write some options into a JSON configuration file:

    {
        "cachedir": "/var/local/imposm",
        "mapping": "mapping.json",
        "connection": "postgis://user:password@localhost:port/database"
    }

To use that config:

    imposm import -config config.json [args...]

For more options see:

    imposm import -help


Note: TLS/SSL support is disabled by default due to the lack of renegotiation support in Go's TLS implementation. You can re-enable encryption by setting the `PGSSLMODE` environment variable or the `sslmode` connection option to `require` or `verify-full`, eg: `-connect postgis://host/dbname?sslmode=require`. You will need to disable renegotiation support on your server to prevent connection errors on larger imports. You can do this by setting `ssl_renegotiation_limit` to 0 in your PostgreSQL server configuration.


Documentation
-------------

The latest documentation can be found here: <http://imposm.org/docs/imposm3/latest/>

Support
-------

There is a [mailing list at Google Groups](http://groups.google.com/group/imposm) for all questions. You can subscribe by sending an email to: `imposm+subscribe@googlegroups.com`

For commercial support [contact Omniscale](http://omniscale.com/contact).

Development
-----------

The source code is available at: <https://github.com/omniscale/imposm3/>

You can report any issues at: <https://github.com/omniscale/imposm3/issues>

License
-------

Imposm is released as open source under the Apache License 2.0. See LICENSE.

All dependencies included as source code are released under a BSD-ish license. See LICENSE.dep.

All dependencies included in binary releases are released under a BSD-ish license except the GEOS package.
The GEOS package is released as LGPL3 and is linked dynamically. See LICENSE.bin.


### Test ###

I didn't do anything about test. It may fail.
