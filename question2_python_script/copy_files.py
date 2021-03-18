import os
import shutil


source_directory= input("Enter the path of the source directory")  # Absolute path to the source directory containing the files to be copied 

def copy_files(directory):
  for dirpath, dirnames, files in os.walk(directory):
    for file in files:
      if file.endswith(".Z01"):
        yy = file[10:12]
        mm = file[8:10]
        dd = file[6:8]
        fc = file[0:2]

        dest = yy + "/"+ mm + "/" + dd + "/" + fc + "/"
        if os.path.exists(dest):
            shutil.copy(file,dest)

          
    return "Files were copied Successfully"
      
directory = copy_files(source_file)