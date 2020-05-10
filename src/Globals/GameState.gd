extends Node


var firebase = null

func _ready() -> void:
	print("################## Start App ##################")

	if Engine.has_singleton("Firebase"):
		firebase = Engine.get_singleton("Firebase")

	if firebase:
		firebase.init(get_instance_id())

		var dic: Dictionary = {"nome": "Lucas", "sobrenome": "C Oliveira"}

		firebase.firestore_add_document("FirstCollection", dic)
		firebase.firestore_load_document("FirstCollection")
		firebase.firestore_set_document_data("FirstCollection", "FirstDocument", dic)


		print("instance_id: ", get_instance_id())

		print("________________ CODE END ________________")
		print(" ")


func _on_firebase_receive_message(tag, from, key, data) -> void:

	if tag == "Firebase":
		if from == "Firestore":
			if key == "AddDocument":
				print("################## AddDocument ##################")
				print("data: ", data)
			
			if key == "Documents":
				print("################## Documents ##################")
				print("data: ", data)

			if key == "SetDocument":
				print("################## SetDocument ##################")
				print("data: ", data)

			
			if key == "SnapShotData":
				print("################## SetDocument ##################")
				print("data: ", data)

			# if key == "Document":
			# 	print("################## Document ##################")
			# 	print("data: ", data)

			# if key == "LoadDocument":
			# 	print("################## LoadDocument ##################")
			# 	print("data: ", data)

	# print("############################")
	# print("tag: ", tag)
	# print("from: ", from)
	# print("key: ", key)
	# print("data: ", data)
	# print("############################")
	# print(" ")
