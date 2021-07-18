extends Node


var encrypt_pass = ""
var dir = Directory.new()

func init_file(path:String, flags:int, encode:bool=false):
	if encrypt_pass:
		encode = true
	var openCode = File.READ if flags == 0 else File.WRITE if flags == 1 else File.READ_WRITE
	var file = File.new()
	if !encode:
		file.open(path, openCode)
	else:
		file.open_encrypted_with_pass(path, openCode, encrypt_pass)
	return file

func read_file(path):
	return init_file(path, 0).get_as_text()

func write_file(path:String, data:String):
	return init_file(path, 1).store_string(data)

func make_empty_file(path:String):
	write_file(path, "")

func make_dir(path:String):
	return dir.make_dir(path)

func remove_dir(path:String):
	if !path.ends_with("/"):
		path += "/"
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir() and file_name != "." and file_name != "..":
				print("dir:"+file_name)
				remove_dir(path+file_name)
			else:
				dir.remove(file_name)
			file_name = dir.get_next()
	else:
		print_debug("Could not open dir for deletion:"+path)
	dir.remove(path)
