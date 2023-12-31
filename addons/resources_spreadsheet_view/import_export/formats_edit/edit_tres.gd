class_name SpreadsheetEditFormatTres
extends SpreadsheetEditFormat

var timer : SceneTreeTimer


func get_value(entry, key : String):
	return entry[key]


func set_value(entry, key : String, value, index : int):
	entry[key] = value


func save_entries(all_entries : Array, indices : Array, repeat : bool = true):
	# No need to save. Resources are saved with Ctrl+S
	# (likely because plugin.edit_resource is called to show inspector)
	return


func create_resource(entry) -> Resource:
	return entry


func duplicate_rows(rows : Array, name_input : String):
	if rows.size() == 1:
		var new_row = rows[0].duplicate()
		new_row.resource_path = rows[0].resource_path.get_base_dir() + "/" + name_input + ".tres"
		ResourceSaver.save(new_row)
		return

	var new_row
	for x in rows:
		new_row = x.duplicate()
		new_row.resource_path = x.resource_path.get_basename() + name_input + ".tres"
		ResourceSaver.save(new_row)


func rename_row(row, new_name : String):
	var new_row = row
	DirAccess.open("res://").remove(row.resource_path)
	new_row.resource_path = row.resource_path.get_base_dir() + "/" + new_name + ".tres"
	ResourceSaver.save(new_row)


func delete_rows(rows):
	for x in rows:
		DirAccess.open("res://").remove(x.resource_path)


func has_row_names():
	return true


func import_from_path(folderpath : String, insert_func : Callable, sort_by : String, sort_reverse : bool = false) -> Array:
	var rows := []
	var dir := DirAccess.open(folderpath)
	if dir == null: return []
	dir.list_dir_begin()

	editor_view.remembered_paths.clear()
	var cur_dir_script : Script = null

	var filepath = dir.get_next()
	var res : Resource

	while filepath != "":
		res = null
		filepath = folderpath + filepath
		if filepath.ends_with(".tres"):
			res = load(filepath)
			if !is_instance_valid(cur_dir_script):
				editor_view.fill_property_data(res)
				cur_dir_script = res.get_script()
				if !(sort_by in res):
					sort_by = "resource_path"

			if res.get_script() == cur_dir_script:
				insert_func.call(res, rows, sort_by, sort_reverse)
		
		editor_view.remembered_paths[filepath] = res
		filepath = dir.get_next()

	return rows
