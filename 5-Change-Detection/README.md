We compute -2ρlnQ for each pixel (so we can show this as a gray-scale image). From this we have to create a binary image where:  
- Black Areas represent no changes
- White areas represent changes

---
THIS IS IMPORTANT!!!
To choose a threshold to create this binary image: The distribution of -2ρlnQ follows a χ2 distribution. If we select a no change area (known from the description of crops) and draw an histogram we should observe that:

![immagine](https://github.com/Roberto888888/Remote-Sensing-Project-Polarimetric-SAR/assets/90435131/4dcef14a-db7e-467d-8489-4b75a1c1deb8)

Most pixels will have low values and be on the left side of the histogram. We set the threshold to a level so that 5% of the total pixels will be to the right of this level (easy to see in the histogram) which means that we're accepting a <u>5% false alarm rate</u>. In practice, this means that in this histogram of a no change area (where every pixel should represent a no change in the binary image), pixels with a value above the threshold will erroneously indicate a change and we accept this for 5% of the total pixels in the region selected. Then, we can use this threshold for the whole picture knowing that there will be some errors but they should be contained.
I hope it's clear.

---
RESULTS:

-2ρlnQ Images:
![](https://github.com/Roberto888888/Remote-Sensing-Project-Polarimetric-SAR/blob/main/5-Change-Detection/lnQ.bmp)
![](https://github.com/Roberto888888/Remote-Sensing-Project-Polarimetric-SAR/blob/main/5-Change-Detection/lnQ%20Filtered.bmp)

Binary Images:
![](https://github.com/Roberto888888/Remote-Sensing-Project-Polarimetric-SAR/blob/main/5-Change-Detection/changes.bmp)
![](https://github.com/Roberto888888/Remote-Sensing-Project-Polarimetric-SAR/blob/main/5-Change-Detection/changes%20Filtered.bmp)
