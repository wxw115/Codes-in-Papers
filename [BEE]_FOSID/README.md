#Matlab codes for computing FOSID

Contributors: Xiaowei Wang, Abdollah Shafieezadeh, and Jamie Ellen Padgett

Contact email: wxwangus@gmail.com (Xiaowei Wang)

File descriptions:
-- "FOSID_example.m": Main file for computing FOSID given in Equation (12) in Wang et al. (2021).

-- "ora_foc.m": Oustaloup-Recursive-Approximation for fractional order differentiator developed by Prof. YangQuan Chen (Xue et al., 2006). Please find more details on the references and contact information in this file. Note that this file is used in the main file.

-- "SAFracSDoF_AccResponse.mdl": Matlab/Simulink-based architecture representing a damped single-degree-of-freedom (SDOF) system considering fractional order responses. This file is used in the mail file.

-- "Acc(g).acc": Example ground acceleration (Unit:g) file for Figure 1 in Wang et al. (2021).

-- "FOSID_result.mat": Output file from FOSID_example.m, including the result of FOSID.

Main files:
FOSID_example.m
	Inputs:
		“ora_foc.m”
		“SAFracSDoF_AccResponse.mdl”
		“Acc(g).acc”
	Outputs: 
		“FOSID_result.mat”

Reference:
Wang, X., Shafieezadeh, A., and Padgett, J. E. (2021) "FOSID: a fractional order spectrum intensity for probabilistic seismic demand modeling of extended pile-shaft-supported highway bridges under liquefaction and transverse spreading." Bulletin of Earthquake Engineering, (0123456789). https://doi.org/10.1007/s10518-021-01082-4


