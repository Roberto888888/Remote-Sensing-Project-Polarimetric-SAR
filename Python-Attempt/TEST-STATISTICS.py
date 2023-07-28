# Calculates the determinants of the covariance matrices for each pixel

# NOTE: The elements above the main diagonal in the covariance matrices
#       are the complex conjugates of the ones below, therefore the
#       determinants are real numbers. Because of the limited precision
#       of the floating point numbers, the calculation may have a non-zero
#       imaginary part which theoretically shouldn't be there, so it can be
#       ignored.

def CMIm(Cm , n):
    L = np.ma.size(Cm, axis = 2)
    V = np.empty(L).T
    for k in range(L):
        V[k] = np.real(np.linalg.det(Cm[0:3 , 0:3 , k]))
    X = np.reshape(V, (n, n)).T
    return X


#######################################################################
#                         Main Script
#######################################################################

#####################################
#               lnQ       
#####################################

# Not Filtered

X = CMIm(Cm3 , 1024)
Y = CMIm(Cm4 , 1024)
XpY = CMIm(Cm3 + Cm4 , 1024)

# By checking the shape of X, Y, and XpY should be (1024, 1024)


lnQ = ENL*(6*np.log(2) + np.log(Y) + np.log(X) - 2*np.log(XpY))
    
     
########################################
#      No changes distribution   
########################################

rho = 1 - (17/18)*(1.5*ENL) 
T = - 2*rho*lnQ 

plt.figure('Changes', figsize=(10,10))
plt.title('Changes')

plt.imshow(TS.T, cmap='gray', vmin = 0, vmax = 1)

#############################################################################
#############################################################################

plt.figure('-lnQ*2*rho', figsize=(10,10))
plt.title('-lnQ*2*rho')

plt.imshow(T.T / 32, cmap='gray', vmin = 0, vmax = 1)
plt.colorbar(fraction=0.046, pad=0.04)

##############################################################################

def NCD(T):
    NC = T[320:383 , 35:95]
    #plt.figure('',figsize=(6,6))
    #plt.title('mmm')
    plt.hist(np.ndarray.flatten(NC), bins=100)
    return NC
    
##########################################

NC = NCD(T)