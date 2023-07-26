# A Test Statistic in the Complex Wishart Distribution and Its Application to Change Detection in Polarimetric SAR Data

Practical project completed as part of the course 'Remote Sensing' which I took during my master programme.

---
The project was performed in Matlab.
It was a group project. I performed the entire data manipulation part and produced the results with the method described in the paper
(uploaded here).

My group mate was supposed to perform an alternative method using partial data to demonstrate the 
effect of using complete polarimetric data compared to partial data (i.e. data coming from a single polarization)
and discuss and compare the results, but it turned out he was working on his own with an incorrect version of the code that he stubbornly refused
to correct in spite of the continuous request from both me and our project supervisor... Not to mention the fact that his code is a complete
and incomprehensible mess.

As a result, the final part of the report is disaster that barely makes any sense and therefore I'm only sharing my part of the
code.

---
What he should've done is using the information that we were provided about the state of the crops to show how the method proposed was better at
detecting changes but he didn't and he also applied some confusing calculation on data imported incorrectly.

---
## <font color = "maroon"> IMPORTANT SIDE NOTE: </font>
I tried to complete this project by myself some years later in Python but the same processing produces different results. I couldn't figure out wether
the problem is in how data is read from binary files or in the display functions. I couldn't find any mention of this discrepancy in any online forum
and eventually I had to give up on that.

I'm mentioning this because this inconsistency between Matlab and Python in importing data from binary files is
a bit concerning! I don't have access to Matlab now so I was never able to see this difference other than in the final results obtained.
