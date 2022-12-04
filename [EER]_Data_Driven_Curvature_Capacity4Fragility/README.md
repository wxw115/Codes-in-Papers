# Database and Python Codes for Efficient Estimates of Multi-Level Limit States of Reinforced Concrete Bridge Column Sections
###### Contributors: Ruiwei Feng, Xinzhe Yuan, Xiaowei Wang, and You Dong

###### File Description:

-- Database_20200111.xlsx: 
   Database used for Artificial Neural Network (ANN) model training and evaluation. 
   This database is created using OpenSeesPy by Dr. Ruiwei Feng (ruiwei.feng@polyu.edu.hk)
   
-- D1.6m_20200111.xlsx: 
   The first sheet contains the normalized dataset of input variables for the case study bridge in Chapter 4 of the paper. 
   This database is created by Dr. Ruiwei Feng (ruiwei.feng@polyu.edu.hk)
   
-- N_Q_optimization.py: 
   Python code for ANN architecture optimization on the number of hidden layers (N) and the number of neruons in each hiden layer (Q). 
   This code is created by Dr. Xinzhe Yuan (xyvm4@mst.edu)
   
-- 100_EER.py: 
   Pyhton code for 100 runs of ANN modeling based on Database_20200111.xlsx and the identified optimal N=2 and Q=12. 
   This code is created by Dr. Xinzhe Yuan (xyvm4@mst.edu) and Dr. Xiaowei Wang (xiaoweiwang@tongji.edu.cn)
   
-- 100_EER_Application.py: 
   Pyhton code for 100 runs of ANN model application based on D1.6m_20200111.xlsx and the identified optimal N=2 and Q=12. 
   This code is created by Dr. Xinzhe Yuan (xyvm4@mst.edu) and Dr. Xiaowei Wang (xiaoweiwang@tongji.edu.cn)

###### Reference:
###### Wang, X., Yuan, X., Feng, R.*, Dong, Y., 2022. Data‐driven probabilistic curvature capacity modeling of circular RC columns facilitating seismic fragility analyses of highway bridges. Earthquake Engineering and Resilience, 1, 211–224. https://doi.org/10.1002/eer2.14
