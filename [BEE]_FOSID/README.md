#FOSID Codes:

The following files are used for compute a novel fractional order seismic intensity measure called FOSID (Fractional Order Spectrum intensity enhanced with Integral period and Damping ratio) in Wang et al. (2021). Send question email to Xiaowei Wang at "wxwangus@gmail.com" or "wxwangus@163.com".

-- "fosid_example.m" is the main file for computing FOSID, Eq.(12) in Wang et al. (2021).

-- "ora_foc.m" is the Oustaloup-Recursive-Approximation for fractional order differentiator developed by Prof. YangQuan Chen. Please find details inclduing the references in this file.

-- "SAFracSDoF_AccResponse.mdl" is the Matlab/Simulink-based architecture representing a damped single-degree-of-freedom (SDOF) system considering fractional order responses.

-- "Acc(g).acc" is the example ground acceleration file (Unit:g).

Reference:

Wang X., Shafieezadeh A., and Padgett J.E. (2021) FOSID: Fractional Order Spectrum intensity enhanced with Integral period and Damping ratio for probabilistic seismic demand modeling of extended pile-shaft-supported highway bridges under liquefaction and transverse spreading. Bulletin of Earthquake Engineering (In Review, Manuscript Number: BEEE-D-20-00397R1)

Contributors: Xiaowei Wang, Abodollah Shafieezadeh, and Jamie Ellen Padgett
