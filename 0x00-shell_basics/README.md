# Shell

## Commands in scripts

### 0-current_working_directory

`pwd` - Prints the absolute path name of the current working directory.

### 1-listit

`ls` - Display the contents list of your current directory.

### 2-bring_me_home

`cd` - Changes the working directory to the user’s home directory.

### 3-listfiles

`ls -l` - Display current directory contents in a long format.

### 4-listmorefiles

`ls -la` - Display current directory contents in a long format, including hidden files.

### 5-listfilesdigitonly

`ls -lna` - Display current directory contents:

* In long format
* With user and group IDs displayed numerically
* And hidden files

### 6-firstdirectory

`mkdir` - creates a directory named `my_first_directory` in the `/tmp/` directory.

### 7-movethatfile

`mv` - Moves files from a specific directory to another.

### 8-firstdelete

`rm` - Deletes files and directories with right arguments.


### 9-firstdirdeletion

`rmdir` - Deletes directories.

### 10-back

`cd -` - Changes the working directory to the previous one.

> *For bash commands involving changing directories (cd), add Source (.) infront of the executable*.

### 11-lists

`ls -la . .. /boot` - Lists all files in the current directory and the parent of the working directory and the `/boot` directory (in this order), in long format.

### 12-file_type

`type` - Reads a file and gives out it's type.


### 13-symbolic_link

`ln -s <path to the file/folder to be linked> <the path of the link to be created` - Creates a shortcut for a specific file..

### 14-copy_html

`cp -nu` - Copies files not present in the target directory.


### 100-lets_move

`mv [[::]] <Destination>` - Moves files with specific characteristics.  


### 101-clean_emacs


`rm *` - Uses wildcard to delete specific files.
