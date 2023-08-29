import shutil
import os

abc = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
env_version = os.getenv('VERSION')

if not os.path.exists("./files"):
    os.system("mkdir ./files")

if not os.path.exists("./zippedfiles"):
    os.system("mkdir ./zippedfiles")

for letter in abc:
    os.system("mkdir ./files/{foldername}".format(foldername = letter))
    f = open("./files/{filename}/{filename}.txt".format(filename = letter),'x')
    f.close()

    shutil.make_archive('./zippedfiles/{currentletter}_{version}'.format(currentletter = letter, version=env_version), 'zip', './files/{currentletter}'.format(currentletter = letter))
    
