#This is a python script to create directories using certain file names and copy files

import os
import shutil

source_directory = input("Enter the path to the source directory")
source_directory_files = os.listdir(source_directory)

#create a directory using file name pattern YY/MM/DD/AA
try:
  for source_file in source_directory_files:
    YY = source_file[10:12]
    MM = source_file[8:10]
    DD = source_file[6:8]
    AA = source_file[0:2]
    dir_join = f'{YY}/{MM}/{DD}/{AA}'    
    dir = os.makedirs(dir_join)    
      
except FileExistsError:
  print("Directories Already Exist")