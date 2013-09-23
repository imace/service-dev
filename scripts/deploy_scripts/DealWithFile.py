# -*- coding:utf-8 -*-  

import os 
import time  
import os.path
import zipfile

COPYFILECOUNTS = 0 
def copyFiles(sourceDir, targetDir): 
	    global COPYFILECOUNTS  
	    for f in os.listdir(sourceDir): 
	        sourceF = os.path.join(sourceDir, f) 
	        targetF = os.path.join(targetDir, f) 
	                 
	        if os.path.isfile(sourceF): 
	            #创建目录 
	            if not os.path.exists(targetDir): 
	                os.makedirs(targetDir) 
	            COPYFILECOUNTS += 1  
	            #文件不存在，或者存在但是大小不同，覆盖 
	            if not os.path.exists(targetF) or (os.path.exists(targetF) and (os.path.getsize(targetF) != os.path.getsize(sourceF))): 
	                #2进制文件 
	                open(targetF, "wb").write(open(sourceF, "rb").read())   
	        if os.path.isdir(sourceF): 
	            copyFiles(sourceF, targetF) 
	           



def zip_dir(dirname,zipfilename):
    filelist = []
    if os.path.isfile(dirname):
        filelist.append(dirname) 
    else :
        for root, dirs, files in os.walk(dirname): 
            for name in files:
                filelist.append(os.path.join(root, name)) 
    zf = zipfile.ZipFile(zipfilename, "w", zipfile.zlib.DEFLATED)
    for tar in filelist:
		if os.path.isfile(dirname):
			arcname = os.path.basename(dirname) 
			zf.write(tar,arcname)
		else :
			arcname = tar[len(dirname):] 
			zf.write(tar,arcname)
    zf.close()


def unzip_file(zipfilename, unziptodir):
    if not os.path.exists(unziptodir): os.mkdir(unziptodir, 0777)
    zfobj = zipfile.ZipFile(zipfilename)
    for name in zfobj.namelist():
        name = name.replace('\\','/') 
        if name.endswith('/'):
            os.mkdir(os.path.join(unziptodir, name))
        else:            
            ext_filename = os.path.join(unziptodir, name)
            ext_dir= os.path.dirname(ext_filename)
            if not os.path.exists(ext_dir) : os.mkdir(ext_dir,0777)
            outfile = open(ext_filename, 'wb')
            outfile.write(zfobj.read(name))
            outfile.close()