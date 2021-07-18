Godir is an extension for godot that makes it so that games can easily edit files. All following methods and variables will be under the singleton `Godir`.

# Methods:


## `init_dir(path, flags, ?encode=false)`:
Makes a `File` object for editing data. Flag 0 is read, 1 is write, and 2 is read and write. If `encode` is set to `true`, it opens with a password defined by variable `encrypt_pass`. Mostly used as a helper in other methods.

## `read_file(path)`:
Prints the contents of a file as a string.

## `write_file(path, data)`:
Writes `data` to the file stored at `path`. If no file exists, it makes one.

## `make_empty_file(path)`:
Makes a new file at `path` that is empty.

## `make_dir(path)`:
Makes a new directory at the given path.

## `remove_dir(path)`:
Recursively deletes a directory including it's contents. If the given path contains a directory, it calls itself to remove that dir.

Please do not have more than 1024 directories stacked in each other to be removed, or else stack overflow will occur.

# Properties:

## `encrypt_pass`:
The password used to read or write to encrypted files.

## `dir`:
An instance of a `Dir` object used as a helper in the code.
