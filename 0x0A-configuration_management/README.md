# Configuration management

The project looks into puppet as a server configuration management tool.  
`puppet-lint` is used to check the manifests for errors.  
The puppet manifests end with the extension `.pp`.  

## Getting started

### Install puppet

```sh

$ apt-get install -y ruby=1:2.7+1 --allow-downgrades
$ apt-get install -y ruby-augeas
$ apt-get install -y ruby-shadow
$ apt-get install -y puppet

```

### Install puppet-lint

```sh

$ gem install puppet-lint

```

The files in this project are puppet manifests that accomplish a specific objective.  

#### To run the puppet files

```sh

$ puppet apply filename

```
> Where filename is the `.pp` file

#### Check for errors

```sh

$ puppet-lint filename

```

### Files

* [0-create_a_file.pp](0-create_a_file.pp) - Creates a file `school` in `/tmp`.The file permission is `0744`, owner is `www-data` and group is `www-data`. The file contains a text 'I love Puppet'
* [1-install_a_package.pp](1-install_a_package.pp) - Installs `puppet-lint` version `2.5.0`
* [2-execute_a_command.pp](2-execute_a_command.pp) - Uses the puppet `exec` resource and the `pkill` command to kill a process `killmenow`

```sh

$ cat killmenow
#!/bin/bash
while [[ true ]]
do
    sleep 2
done

```

> To see how the third file works, run `./killmenow` in a different terminal.
> Apply the puppet manifest in a new terminal. The `killmenow` process should terminate.
> Note that the `killmenow` file should have executable rights.
