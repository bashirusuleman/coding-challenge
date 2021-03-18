import os

source_file = input("Enter the path of the source directory containing the files to be deleted")

#Delete the files
def delete_files(directory )
    for dirpath, dirnames, files in os.walk(directory):
        for file in files:
            if file.endswith(".Z01"):
                yy = str(file)[10:12]
                mm = str(file)[8:10]
                dd = str(file)[6:8]
                fc = str(file)[0:2]

                dest = yy + "/"+ mm + "/" + fc
                if not os.path.exists(dest):
                    os.remove(dest +"/" + file)

        return "Files Deleted Successfully"

delete_files(source_file )