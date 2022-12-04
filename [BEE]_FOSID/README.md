# Matlab codes for computing FOSID

###### Contributors: Xiaowei Wang, Abdollah Shafieezadeh, and Jamie Ellen Padgett

###### Contact email: xiaoweiwang@tongji.edu.cn (Xiaowei Wang)

File descriptions:
**-- "FOSID_example.m"**: Main file for computing FOSID given in Equation (12) in Wang et al. (2021).

**-- "ora_foc.m"**: Oustaloup-Recursive-Approximation for fractional order differentiator developed by Prof. YangQuan Chen (Xue et al., 2006). Please find more details on the references and contact information in this file. Note that this file is used in the main file.

**-- "SAFracSDoF_AccResponse.mdl"**: Matlab/Simulink-based architecture representing a damped single-degree-of-freedom (SDOF) system considering fractional order responses. This file is used in the mail file.

**-- "Acc(g).acc"**: Example ground acceleration (Unit:g) file for Figure 1 in Wang et al. (2021).

**-- "FOSID_result.mat"**: Output file from FOSID_example.m, including the result of FOSID.

###### Main files:
#### -- FOSID_example.m
######	Inputs:
#### -- “ora_foc.m”, “SAFracSDoF_AccResponse.mdl”, “Acc(g).acc”.	
######	Output: 
#### -- “FOSID_result.mat”

###### References:
###### Wang, X., Shafieezadeh, A., and Padgett, J. E. (2021) "FOSID: a fractional order spectrum intensity for probabilistic seismic demand modeling of extended pile-shaft-supported highway bridges under liquefaction and transverse spreading." Bulletin of Earthquake Engineering, 19(6): 2531-2559. https://doi.org/10.1007/s10518-021-01082-4
###### Wang X., Ye A., Shafieezadeh A., and Padgett J.E. (2019) “Fractional order optimal intensity measures for probabilistic seismic demand modeling of extended pile-shaft-supported bridges in liquefiable and laterally spreading ground.” Soil Dynamics and Earthquake Engineering, 120: 301-315. https://doi.org/10.1016/j.soildyn.2019.02.012
###### Shafieezadeh A, Ramanathan K, Padgett JE, DesRoches R. (2012) "Fractional order intensity measures for probabilistic seismic demand modeling applied to highway bridges." Earthquake Engineering and Structural Dynamics, 41(3): 391–409. https://doi.org/10.1002/eqe.1135
