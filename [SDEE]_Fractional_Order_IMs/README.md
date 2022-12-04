# Matlab Codes for Fractional Order IMs Calculation
###### Contributors: Xiaowei Wang, Aijun Ye, Abdollah Shafieezadeh, Jamie Ellen Padgett
###### Contact Email: xiaoweiwang@tongji.edu.cn (Xiaowei Wang)
###### Instruction:
Put the following files in the same directory and execute ~.m files for individual fractional order (FO) intensity measures (IMs) in Wang et al. (2019).
Users can change the key parameter(s) of each FO IM in the corresponding ~.m file.

###### File Description:
**-- "PGR_alpha.m"**: For computing the FO IM, Fractional Peak Response, Eq.(9) in Wang et al. (2019).

**-- "CAR_alpha.m"**: For computing the FO IM, Cumulative Absolute Fractional Response, Eq.(10) in Wang et al. (2019).

**-- "CAR_5_alpha.m"**: For computing the FO IM, Modified Cumulative Absolute Fractional Response, Eq.(11) in Wang et al. (2019).

**-- "Sa_d_Tn_alpha.m"**: For computing the FO IM, Spectral acceleration at a period for fractionally damped single-degree-of-freedom (SDOF) system, Eq.(13) in Wang et al. (2019).

**-- "Sa_r_Tn_alpha.m"**: For computing the FO IM, Spectral acceleration at a period for traditionally damped SDOF system with fractional response, Eq.(14) in Wang et al. (2019).

**-- "SI_d_alpha.m"**: For computing the FO IM, Spectrum Intensity across periods of 0.1~2.5s for fractionally damped SDOF system, Eq.(15) in Wang et al. (2019).

**-- "SI_r_alpha.m"**: For computing the FO IM, Spectrum Intensity across periods of 0.1~2.5s for traditionally damped SDOF system with fractional response, Eq.(16) in Wang et al. (2019).

**-- "ora_foc.m"**: The Oustaloup-Recursive-Approximation for fractional order differentiator developed by Prof. YangQuan Chen. Please find more details on the references and contact information in this file. [used in all ~.m files]

**-- "FracPGR.mdl"**: The Matlab/Simulink architecture for fractional order intergation of acceleration. [used in PGR_alpha.m, CAR_alpha.m, CAR_5_alpha.m]

**-- "FracDamp_SDoF.mdl"**: The Matlab/Simulink architecture representing a fractionally damped SDOF system. [used in Sa_d_Tn_alpha.m, SI_d_alpha.m]

**-- "FracResp_SDoF.mdl"**: The Matlab/Simulink architecture representing a traditionally damped SDOF system considering fractional responses. [used in Sa_r_Tn_alpha.m, SI_r_alpha.m]

**-- "Acc(g).acc"**: An example ground acceleration (Unit:g) recorded in M6.6 1971 San Fernando Earthquake at Station Lake Hughes #4 (NGA RSN: 72). [time step defined in ~.m files]


###### References:

###### Wang X, Ye A, Shafieezadeh A, Padgett JE (2019) Fractional order optimal intensity measures for probabilistic seismic demand modeling of extended pile-shaft-supported bridges in liquefiable and laterally spreading ground. Soil Dyn Earthq Eng 120:301-315. https://doi.org/10.1016/j.soildyn.2019.02.012

###### Shafieezadeh A, Ramanathan K, Padgett JE, DesRoches R (2012) Fractional order intensity measures for probabilistic seismic demand modeling applied to highway bridges. Earthq Eng Struct Dyn 41:391-409. https://doi.org/10.1002/eqe.1135

###### Wang, X., Shafieezadeh, A., and Padgett, J. E. (2021) "FOSID: a fractional order spectrum intensity for probabilistic seismic demand modeling of extended pile-shaft-supported highway bridges under liquefaction and transverse spreading." Bulletin of Earthquake Engineering, 19(6): 2531-2559. https://doi.org/10.1007/s10518-021-01082-4
