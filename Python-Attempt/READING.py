import numpy as np

######################################################################
# Function to read the off-diagonal elements in the covariance matrices
# NOTE: These are COMPLEX numbers

def readCross( fileName ):
    with open(fileName + '_lhhhv' , 'rb') as fin:
        hhhv0 = np.fromfile(fin , dtype = '>f').reshape((-1 , 2)).T
    hhhv = hhhv0[0 , :] + 1j * hhhv0[1 , :]
    
    with open(fileName + '_lhhvv' , 'rb') as fin:
        hhvv0 = np.fromfile(fin , dtype = '>f').reshape((-1 , 2)).T
    hhvv = hhvv0[0 , :] + 1j * hhvv0[1 , :]
    
    with open(fileName + '_lhvvv' , 'rb') as fin:
        hvvv0 = np.fromfile(fin , dtype = '>f').reshape((-1 , 2)).T
    hvvv = hvvv0[0 , :] + 1j * hvvv0[1 , :]
    
    return  hhhv, hhvv, hvvv

#######################################################################
# Function to read the main diagonal elements in the covariance matrices
# NOTE: These are REAL numbers

def readMain( fileName ):
    with open(fileName + '_lhhhh' , 'rb') as fin:
        hhhh = np.fromfile(fin , dtype = '>f')   
    
    with open(fileName + '_lhvhv' , 'rb') as fin:
        hvhv = np.fromfile(fin , dtype = '>f')
    
    with open(fileName + '_lvvvv' , 'rb') as fin:
        vvvv = np.fromfile(fin , dtype = '>f')
    
    return  hhhh, hvhv, vvvv

#########################################################################
# MAIN SCRIPT 

HH3, HV3, VV3 = readMain('fl064');
HH4, HV4, VV4 = readMain('fl065');
HHHV3, HHVV3, HVVV3 = readCross('fl064')
HHHV4, HHVV4, HVVV4 = readCross('fl065')