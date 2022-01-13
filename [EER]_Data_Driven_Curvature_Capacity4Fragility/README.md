This fold contains the database and python codes for the following paper:

Xiaowei Wang, Xinzhe Yuan, Ruiwei Feng*, and You Dong."Data-Driven Probabilistic Curvature Capacity Modeling of Circular RC Columns Facilitating
Seismic Fragility Analyses of Highway Bridges." Earthquake Engineering and Resilience, 1(1). [Under review]

-- Database_20200111.xlsx: 
   Database used for Artificial Neural Network (ANN) model training and evaluation. 
   This database is created using OpenSeesPy by Dr.Ruiwei Feng (ruiwei.feng@polyu.edu.hk)
   
-- D1.6m_20200111.xlsx: 
   The first sheet contains the normalized dataset of input variables for the case study bridge in Chapter 4 of the paper. 
   This database is created by Dr.Ruiwei Feng (ruiwei.feng@polyu.edu.hk)
   
-- N_Q_optimization.py: 
   Python code for ANN architecture optimization on the number of hidden layers (N) and the number of neruons in each hiden layer (Q). 
   This code is created by Dr. Xinzhe Yuan (xyvm4@mst.edu)
   
-- 100_EER.py: 
   Pyhton code for 100 runs of ANN modeling based on Database_20200111.xlsx and the identified optimal N=2 and Q=12. 
   This code is created by Dr. Xinzhe Yuan (xyvm4@mst.edu) and Dr. Xiaowei Wang (xwang@case.edu)
   
-- 100_EER_Application.py: 
   Pyhton code for 100 runs of ANN model application based on D1.6m_20200111.xlsx and the identified optimal N=2 and Q=12. 
   This code is created by Dr. Xinzhe Yuan (xyvm4@mst.edu) and Dr. Xiaowei Wang (xwang@case.edu)
