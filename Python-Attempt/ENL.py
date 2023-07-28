# Cut a ROI in the image and calculate the ENL
# (remember that Python excludes the last index when indexing)

def looks(M, x1, x2, y1, y2):
    A = M[ x1:x2-1 , y1:y2-1 ]
    rows , cols = A.shape
    mi = np.mean(A)
    sigma = np.var(A)
    
    return (mi**2) / sigma
                      
###########################################################
# Repeat the calculation of ENL for 3 different ROIs and on
# 3 datasets (the co-registered data)

def EqNLooks(HH, HV, VV):
    ENL = np.empty(9).T
    
    # Area #1
    x1 = np.int64(360)
    x2 = np.int64(410)
    y1 = np.int64(205)
    y2 = np.int64(279)
    
    ENL[0] = looks(HH, x1, x2, y1, y2);
    ENL[1] = looks(HV, x1, x2, y1, y2);
    ENL[2] = looks(VV, x1, x2, y1, y2);
    
    # Area #2
    x1 = np.int64(715)
    x2 = np.int64(764)
    y1 = np.int64(360)
    y2 = np.int64(399)
    
    ENL[3] = looks(HH, x1, x2, y1, y2);
    ENL[4] = looks(HV, x1, x2, y1, y2);
    ENL[5] = looks(VV, x1, x2, y1, y2);
    
    # Area #3
    x1 = np.int64(115)
    x2 = np.int64(179)
    y1 = np.int64(610)
    y2 = np.int64(669)
    
    ENL[6] = looks(HH, x1, x2, y1, y2);
    ENL[7] = looks(HV, x1, x2, y1, y2);
    ENL[8] = looks(VV, x1, x2, y1, y2);
    
    return ENL

############################################################
# Main Script

############################################
# Equivalent Number of Looks Estimation   
############################################

# Assumed that the data for the three channels hhhh, hvhv, vvvv are already
# available (execute after "images")

# Unfiltered data
HH = np.reshape(HH3, (1024, 1024))
HV = np.reshape(HV3, (1024, 1024))
VV = np.reshape(VV3, (1024, 1024))
enlsArr = EqNLooks(HH, HV, VV)
ENL = np.round(np.mean(enlsArr))

################################################################

# Show the ROIs

M = np.copy(C4)
M[360:411 , 205:280 , 0] = 1 # Red
M[715:765 , 360:400 , 1] = 1 # Green
M[115:180 , 610:670 , 2] = 1 # Blue

plt.figure('ROIs', figsize=(6,6))
plt.title('ROIs')
plt.imshow(M)
plt.savefig('ROIs')

##################################################################

# Just for fun - Another way to show the ROIs using OpenCV

import cv2 as cv

R = C3[:,:,0]
G = C3[:,:,1]
B = C3[:,:,2]
img = np.stack([B,G,R], axis = -1)

img = cv.rectangle(img, pt1 = (205, 360), pt2 = (280,411), color=(0,0,255), thickness=2) # red
img = cv.rectangle(img, pt1 = (360,715), pt2 = (400, 765), color=(0,255,0), thickness=2) # green
img = cv.rectangle(img, pt1 = (610, 115), pt2 = (670, 180), color=(255,0,0), thickness=2) # blue

#cv.imwrite('ROIs.png', 255*img)

cv.namedWindow("March - ROI", cv.WINDOW_NORMAL)
cv.imshow('March - ROI', img)
cv.waitKey(0)