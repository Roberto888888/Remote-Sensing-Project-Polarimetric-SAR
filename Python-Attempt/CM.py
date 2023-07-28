##########################################################################
#                             CM

# Builds a  3x3xl matrix with all the covariance matrices, for every pixel
# (CovMat)

# NB: l = number of pixels
# NB: It must work for matrices of general dimensions because after 
# despeckling the dimensions of the matrices will change

# On the workspace:
#     Cmx (x = specific data set)
##########################################################################

def CovMat( HH, HV, VV, HHHV, HHVV, HVVV ):
    l = len(HH)
    CM = np.empty( (3 , 3 , l), dtype = np.complex64)
    
    # HH, HV, and VV are real and need to be converted to complex otherwise numpy will convert everything to real
    # and drop the imaginary part of complex numbers

    #CM[ 0 , 0 , : ] = np.complex64(HH)
    CM[ 0 , 0 , : ] = HH
    CM[ 0 , 1 , : ] = HHHV
    CM[ 0 , 2 , : ] = HHVV
    
    CM[ 1 , 0 , : ] = np.conj(HHHV)
    #CM[ 1 , 1 , : ] = np.complex64(HV)
    CM[ 1 , 1 , : ] = HV
    CM[ 1 , 2 , : ] = HVVV
    
    CM[ 2 , 0 , : ] = np.conj(HHVV)
    CM[ 2 , 1 , : ] = np.conj(HVVV)
    #CM[ 2 , 2 , : ] = np.complex64(VV)
    CM[ 2 , 2 , : ] = VV
    
    return CM

# NOT FILTERED
Cm3 = CovMat(HH3, HV3, VV3, HHHV3, HHVV3, HVVV3)
Cm4 = CovMat(HH4, HV4, VV4, HHHV4, HHVV4, HVVV4)

##################################################################################

# Check:

Cm3.shape , Cm3.dtype

# Should print: ((3, 3, 1048576), dtype('complex64'))

# This may be a potential source of error too: Numpy only has the type np.complex64 the
# components of the complex numbers read from input files are in 32 bits. I don't know if this
# can mess with data. Theoretically it shouldn't.

