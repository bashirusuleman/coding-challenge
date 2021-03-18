#This is a python script to create directories using certain file names and copy files

import os
import shutil
import fnmatch


destination = []

#Make Directory for First Month 
def create_directory(directory):
  for dirpath, dirnames, files in os.walk(directory):
    for file in files:
      if file.endswith(".Z01"):
         yy = file[10:12]
        mm = file[8:10]
        dd = file[6:8]
        fc = file[0:2]

        dest = yy + "/"+ mm + "/" + dd + "/" + fc + "/"
        if not os.path.exists(dest):
          os.makedirs(dest)
          destination.append(dest)
    return destination
      
derectory = create_directory("./source_dir")