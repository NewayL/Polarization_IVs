# Polarization_IVs
polarization project with IVs.
(names in parentheses are local file names)
The files are used to generate the results in Yawen's job market paper and thesis chapter.


Project Created on July 2nd, 2016, to store the files used to generate results in Yawen's JMP

Initial code 1: dataclean.do (dataclean_16Jul02.do)
This code is the starting part of "Bartik_15Oct17.do"(saved in local computer) , which was used to clean the data.

Initial code 2: regressions_noagct.do (regressionsYawen_15Oct28.do)
This code was used to generate the results in my JMP, where tariff changes are used as IVs. (exclude agriculture sector)

Initial code 3: regressions_agct.do (regressionsYawen_15Nov22.do)
This code was used to generate the results in my JMP, where tariff changes are used as IVs. (include agriculture sector)

Initial code 4: Bartik.do (Bartik_15Oct26.do)
Generate regional trade shocks using bartik format.

Initial code 5: Bartik_cntries.do (Bartik_15Oct26_CHN.do)
Generate regional trade shocks using bartik format. Trade values by trading countries.

Initial code 6: Delta.do (Delta_15Oct26.do)
Compute the regional "delta_omega" (share of tasks being used by foreign countries).

Initial code 7: counterfactual.do (counterfactual_15Dec18.do)
Compute the total trade effect after getting the regression estimates.
