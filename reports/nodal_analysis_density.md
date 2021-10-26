---
title: "Functional Connectivity Networks' Topology Changes after rTMS in Cocaine Addiction 2.5"
subtitle: "Nodal analysis - Density" 
author: "Sofia Fernandez"
date: '22 September, 2021'
output:
  bookdown::pdf_document2:
    toc: true
    fig_caption: true
    keep_md: true
editor_options: 
  markdown: 
    wrap: 72
---




# Density

## Power264






### Global Signal







#### Local Efficiency


```
## GLM formula:
## 	 E.local.wt ~ age + bis + vas + fd + sex + group * session 
## based on 88 observations, with 79 degrees of freedom.
## 
## Contrast type:  T contrast 
## Alternative hypothesis:  C != 0 
## Contrasts:  
##                             Intercept age bis vas fd groupReal sessionT1 sexF
## Group x Session interaction .         .   .   .   .  .         .         .   
##                             groupReal:sessionT1
## Group x Session interaction 1
```

#### Number of hubs


```
## GLM formula:
## 	 hubs.wt ~ age + bis + vas + fd + sex + group * session 
## based on 88 observations, with 79 degrees of freedom.
## 
## Contrast type:  T contrast 
## Alternative hypothesis:  C != 0 
## Contrasts:  
##                             Intercept age bis vas fd groupReal sessionT1 sexF
## Group x Session interaction .         .   .   .   .  .         .         .   
##                             groupReal:sessionT1
## Group x Session interaction 1                  
## 
##                   Region Estimate 95% CI low 95% CI high Std. error t value
##  1:       Postcentral.R3 -0.23302  -0.454853   -0.011192   0.111447 -2.0909
##  2:       Postcentral.R6  0.20751   0.028026    0.386996   0.090173  2.3013
##  3:       Frontal_Sup.R2 -0.35522  -0.545640   -0.164810   0.095664 -3.7132
##  4:       Frontal_Sup.L3  0.21913   0.026929    0.411331   0.096562  2.2693
##  5: Temporal_Pole_Mid.R2 -0.18395  -0.340577   -0.027326   0.078688 -2.3377
##  6:        Precentral.L4  0.32589   0.107443    0.544328   0.109745  2.9695
##  7:      Parietal_Sup.L3  0.29245   0.097125    0.487779   0.098132  2.9802
##  8:        Precentral.R7  0.31194   0.070647    0.553234   0.121226  2.5732
##  9:      Cingulum_Ant.L5 -0.26236  -0.480170   -0.044551   0.109427 -2.3976
## 10:      Temporal_Sup.R4 -0.27633  -0.494036   -0.058625   0.109375 -2.5265
##       Pr(>|t|) Pr(>|t|) (FDR)
##  1: 0.03975398        0.94204
##  2: 0.02401342        0.76195
##  3: 0.00037965        0.10023
##  4: 0.02597555        0.76195
##  5: 0.02193352        0.76195
##  6: 0.00394880        0.34749
##  7: 0.00382690        0.34749
##  8: 0.01194696        0.71388
##  9: 0.01886409        0.76195
## 10: 0.01352036        0.71388
```

### No Global Signal







#### Local Efficiency


```
## GLM formula:
## 	 E.local.wt ~ age + bis + vas + fd + sex + group * session 
## based on 88 observations, with 79 degrees of freedom.
## 
## Contrast type:  T contrast 
## Alternative hypothesis:  C != 0 
## Contrasts:  
##                             Intercept age bis vas fd groupReal sessionT1 sexF
## Group x Session interaction .         .   .   .   .  .         .         .   
##                             groupReal:sessionT1
## Group x Session interaction 1                  
## 
##             Region Estimate 95% CI low 95% CI high Std. error t value Pr(>|t|)
## 1:     Thalamus.L1 0.022851  0.0029652    0.042738  0.0099908  2.2872 0.024858
## 2: Cerebellum_6.L2 0.016512  0.0008260    0.032198  0.0078807  2.0953 0.039351
##    Pr(>|t|) (FDR)
## 1:        0.65996
## 2:        0.65996
```

#### Number of hubs


```
## GLM formula:
## 	 hubs.wt ~ age + bis + vas + fd + sex + group * session 
## based on 88 observations, with 79 degrees of freedom.
## 
## Contrast type:  T contrast 
## Alternative hypothesis:  C != 0 
## Contrasts:  
##                             Intercept age bis vas fd groupReal sessionT1 sexF
## Group x Session interaction .         .   .   .   .  .         .         .   
##                             groupReal:sessionT1
## Group x Session interaction 1                  
## 
##                 Region Estimate 95% CI low 95% CI high Std. error t value
##  1:     Postcentral.L6 -0.29517  -0.555855  -0.0344792   0.130969 -2.2537
##  2:    Temporal_Mid.L4 -0.29657  -0.540713  -0.0524220   0.122659 -2.4178
##  3: Frontal_Inf_Orb.L2 -0.17603  -0.343262  -0.0087966   0.084018 -2.0951
##  4: Frontal_Inf_Tri.R1  0.31397   0.022056   0.6058829   0.146657  2.1408
##  5: Frontal_Sup_Orb.R1 -0.23602  -0.418928  -0.0531130   0.091893 -2.5684
##  6:      Precentral.L4  0.24543   0.033958   0.4569072   0.106245  2.3101
##  7: Frontal_Mid_Orb.L1 -0.15943  -0.290463  -0.0283936   0.065832 -2.4218
##  8:    Parietal_Inf.R3  0.32089   0.108132   0.5336462   0.106889  3.0021
##  9:          Insula.L3 -0.21206  -0.422234  -0.0018821   0.105592 -2.0083
## 10:     Frontal_Mid.R5  0.23847   0.062889   0.4140443   0.088210  2.7034
##      Pr(>|t|) Pr(>|t|) (FDR)
##  1: 0.0269858        0.96787
##  2: 0.0179159        0.94596
##  3: 0.0393614        0.96787
##  4: 0.0353704        0.96787
##  5: 0.0120999        0.94596
##  6: 0.0234950        0.96787
##  7: 0.0177371        0.94596
##  8: 0.0035886        0.94596
##  9: 0.0480317        0.96787
## 10: 0.0084007        0.94596
```

## Schaefer-200






### Global Signal







#### Local Efficiency


```
## GLM formula:
## 	 E.local.wt ~ age + bis + vas + fd + sex + group * session 
## based on 88 observations, with 79 degrees of freedom.
## 
## Contrast type:  T contrast 
## Alternative hypothesis:  C != 0 
## Contrasts:  
##                             Intercept age bis vas fd groupReal sessionT1 sexF
## Group x Session interaction .         .   .   .   .  .         .         .   
##                             groupReal:sessionT1
## Group x Session interaction 1                  
## 
##                      Region Estimate 95% CI low 95% CI high Std. error t value
## 1: 7Networks_RH_Cont_Cing_2 0.021577 0.00025277      0.0429   0.010713   2.014
##    Pr(>|t|) Pr(>|t|) (FDR)
## 1: 0.047409        0.71493
```

#### Number of hubs


```
## GLM formula:
## 	 hubs.wt ~ age + bis + vas + fd + sex + group * session 
## based on 88 observations, with 79 degrees of freedom.
## 
## Contrast type:  T contrast 
## Alternative hypothesis:  C != 0 
## Contrasts:  
##                             Intercept age bis vas fd groupReal sessionT1 sexF
## Group x Session interaction .         .   .   .   .  .         .         .   
##                             groupReal:sessionT1
## Group x Session interaction 1                  
## 
##                          Region Estimate 95% CI low 95% CI high Std. error
## 1:       7Networks_LH_SomMot_10 -0.25057 -0.4328320  -0.0683125   0.091567
## 2: 7Networks_LH_DorsAttn_Post_6  0.26480  0.0509253   0.4786679   0.107449
## 3:     7Networks_LH_Cont_PFCl_5  0.26674  0.0201800   0.5132984   0.123871
## 4:   7Networks_LH_Default_Par_4 -0.23791 -0.3710215  -0.1047899   0.066877
## 5:   7Networks_LH_Default_PFC_2 -0.13656 -0.2633134  -0.0098154   0.063679
## 6:           7Networks_RH_Vis_8  0.11667  0.0155734   0.2177607   0.050789
## 7:       7Networks_RH_SomMot_18 -0.25377 -0.4896177  -0.0179313   0.118487
## 8: 7Networks_RH_DorsAttn_Post_1  0.29449  0.0025277   0.5864470   0.146680
##    t value   Pr(>|t|) Pr(>|t|) (FDR)
## 1: -2.7365 0.00766719        0.76672
## 2:  2.4644 0.01589504        0.77872
## 3:  2.1534 0.03434011        0.77872
## 4: -3.5574 0.00063695        0.12739
## 5: -2.1446 0.03505906        0.77872
## 6:  2.2971 0.02426252        0.77872
## 7: -2.1418 0.03529171        0.77872
## 8:  2.0077 0.04809599        0.77872
```

### No Global Signal







#### Local Efficiency


```
## GLM formula:
## 	 E.local.wt ~ age + bis + vas + fd + sex + group * session 
## based on 88 observations, with 79 degrees of freedom.
## 
## Contrast type:  T contrast 
## Alternative hypothesis:  C != 0 
## Contrasts:  
##                             Intercept age bis vas fd groupReal sessionT1 sexF
## Group x Session interaction .         .   .   .   .  .         .         .   
##                             groupReal:sessionT1
## Group x Session interaction 1                  
## 
##                                  Region Estimate 95% CI low 95% CI high
## 1:               7Networks_LH_SomMot_10 0.020652 0.00088950    0.040415
## 2:       7Networks_LH_Limbic_TempPole_1 0.028341 0.00045726    0.056225
## 3: 7Networks_RH_SalVentAttn_FrOperIns_3 0.025019 0.00216777    0.047871
## 4:             7Networks_RH_Cont_Temp_1 0.018484 0.00074885    0.036219
##    Std. error t value Pr(>|t|) Pr(>|t|) (FDR)
## 1:  0.0099288  2.0800 0.040764        0.68044
## 2:  0.0140089  2.0231 0.046446        0.68044
## 3:  0.0114807  2.1793 0.032291        0.68044
## 4:  0.0089102  2.0745 0.041290        0.68044
```

#### Number of hubs


```
## GLM formula:
## 	 hubs.wt ~ age + bis + vas + fd + sex + group * session 
## based on 88 observations, with 79 degrees of freedom.
## 
## Contrast type:  T contrast 
## Alternative hypothesis:  C != 0 
## Contrasts:  
##                             Intercept age bis vas fd groupReal sessionT1 sexF
## Group x Session interaction .         .   .   .   .  .         .         .   
##                             groupReal:sessionT1
## Group x Session interaction 1                  
## 
##                         Region  Estimate 95% CI low 95% CI high Std. error
##  1:         7Networks_LH_Vis_3  0.319214  0.0056870  0.63274125   0.157516
##  2:   7Networks_LH_Cont_Cing_1  0.152127  0.0306242  0.27362947   0.061043
##  3: 7Networks_LH_Default_Par_2 -0.165023 -0.3049777 -0.02506887   0.070313
##  4:         7Networks_RH_Vis_8  0.091258  0.0078473  0.17466829   0.041905
##  5:      7Networks_RH_SomMot_2  0.351525  0.0388747  0.66417517   0.157075
##  6:      7Networks_RH_SomMot_3 -0.231548 -0.4604543 -0.00264107   0.115002
##  7:      7Networks_RH_SomMot_6 -0.277413 -0.5544445 -0.00038144   0.139180
##  8:      7Networks_RH_SomMot_7 -0.194642 -0.3754217 -0.01386256   0.090823
##  9:     7Networks_RH_SomMot_18 -0.252562 -0.4945669 -0.01055708   0.121583
## 10:    7Networks_RH_Cont_Par_1  0.152411  0.0035201  0.30130201   0.074803
##     t value Pr(>|t|) Pr(>|t|) (FDR)
##  1:  2.0266 0.046082        0.77055
##  2:  2.4921 0.014791        0.77055
##  3: -2.3470 0.021431        0.77055
##  4:  2.1777 0.032411        0.77055
##  5:  2.2379 0.028041        0.77055
##  6: -2.0134 0.047476        0.77055
##  7: -1.9932 0.049693        0.77055
##  8: -2.1431 0.035184        0.77055
##  9: -2.0773 0.041025        0.77055
## 10:  2.0375 0.044947        0.77055
```
