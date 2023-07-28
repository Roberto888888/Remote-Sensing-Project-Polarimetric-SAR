##################################################
# Functions to adapt data for visualization

def Norm(Ain):
    Amax = np.max(Ain)
    Amin = np.min(Ain)
    return (Ain - Amin) / (Amax - Amin)

##################################################

def scaling (HH, HV, VV):
    HH = Norm(10*np.log10(HH))
    HV = Norm(10*np.log10(HV))
    VV = Norm(10*np.log10(VV))
    
    return np.stack((HV, HH, VV), axis = 2)

###################################################
# Main Script

hh3 = np.reshape(HH3, (1024, 1024))
hv3 = np.reshape(HV3, (1024, 1024))
vv3 = np.reshape(VV3, (1024, 1024))

hh4 = np.reshape(HH4, (1024, 1024))
hv4 = np.reshape(HV4, (1024, 1024))
vv4 = np.reshape(VV4, (1024, 1024))

C3 = scaling(hh3, hv3, vv3)
C4 = scaling(hh4, hv4, vv4)

######################################################

import matplotlib.pyplot as plt
#from matplotlib.pyplot import imshow

fig , ax = plt.subplots(1, 2, figsize=(14 , 7))

fig.suptitle('RGB Coded Site data (Not Filtered)')
ax[0].set_title('March')
ax[1].set_title('May')
ax[0].axis('off')
ax[1].axis('off')

ax[0].imshow(C3, aspect = 'auto')
ax[1].imshow(C4, aspect = 'auto')