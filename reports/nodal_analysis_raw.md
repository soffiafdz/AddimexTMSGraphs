---
title: "Functional Connectivity Networks' Topology Changes after rTMS in Cocaine Addiction 2.5"
subtitle: "Nodal analysis - Raw" 
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




# Raw

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
## 
##                Region  Estimate 95% CI low 95% CI high Std. error t value
## 1: Frontal_Inf_Orb.R3 0.0134894 0.00268012    0.024299  0.0054306  2.4840
## 2:       Precuneus.L1 0.0102365 0.00014644    0.020327  0.0050692  2.0193
## 3: Supp_Motor_Area.R4 0.0107004 0.00057379    0.020827  0.0050876  2.1032
## 4:       Precuneus.R5 0.0099231 0.00012381    0.019722  0.0049231  2.0156
## 5: Frontal_Mid_Orb.R1 0.0182848 0.00574733    0.030822  0.0062988  2.9029
## 6:     Frontal_Mid.L3 0.0110717 0.00167375    0.020470  0.0047215  2.3449
## 7:        Thalamus.L1 0.0173334 0.00155350    0.033113  0.0079278  2.1864
## 8:    Cerebellum_6.L1 0.0150107 0.00120758    0.028814  0.0069347  2.1646
## 9:    Cerebellum_6.R1 0.0251975 0.00893736    0.041458  0.0081691  3.0845
##     Pr(>|t|) Pr(>|t|) (FDR)
## 1: 0.0151085        0.94793
## 2: 0.0468437        0.94793
## 3: 0.0386282        0.94793
## 4: 0.0472423        0.94793
## 5: 0.0047905        0.63235
## 6: 0.0215411        0.94793
## 7: 0.0317456        0.94793
## 8: 0.0334388        0.94793
## 9: 0.0028094        0.63235
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
##  1:          Insula.R7  0.16144  0.0195216    0.303363   0.071301  2.2642
##  2:       Precuneus.R4 -0.21491 -0.4018428   -0.027987   0.093912 -2.2885
##  3:     Frontal_Sup.R2 -0.30792 -0.5150227   -0.100813   0.104049 -2.9594
##  4:    Temporal_Mid.L5  0.16689  0.0032412    0.330547   0.082219  2.0299
##  5:     Frontal_Mid.L2  0.25711  0.0383400    0.475879   0.109910  2.3393
##  6: Frontal_Mid_Orb.R1 -0.14379 -0.2737684   -0.013810   0.065301 -2.2019
##  7:      Precentral.L4  0.41065  0.1855000    0.635791   0.113113  3.6304
##  8:    Parietal_Sup.L3  0.27430  0.0626487    0.485953   0.106334  2.5796
##  9:      Precentral.R7  0.29574  0.0401785    0.551306   0.128395  2.3034
## 10:    Temporal_Sup.R4 -0.27274 -0.5000247   -0.045456   0.114187 -2.3885
##       Pr(>|t|) Pr(>|t|) (FDR)
##  1: 0.02630084        0.86793
##  2: 0.02478351        0.86793
##  3: 0.00406728        0.53688
##  4: 0.04573601        0.91291
##  5: 0.02184808        0.86793
##  6: 0.03058729        0.89723
##  7: 0.00050064        0.13217
##  8: 0.01174509        0.86793
##  9: 0.02388765        0.86793
## 10: 0.01930208        0.86793
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
##                Region Estimate 95% CI low 95% CI high Std. error t value
## 1: Frontal_Inf_Orb.R3 0.013332 0.00150483    0.025158  0.0059417  2.2437
## 2: Frontal_Med_Orb.L1 0.011519 0.00056432    0.022474  0.0055037  2.0930
## 3:       Precuneus.R5 0.013584 0.00134962    0.025819  0.0061467  2.2100
## 4:     Frontal_Mid.L3 0.012061 0.00175070    0.022372  0.0051800  2.3284
## 5:    Temporal_Sup.L3 0.015791 0.00275206    0.028829  0.0065505  2.4106
##    Pr(>|t|) Pr(>|t|) (FDR)
## 1: 0.027650        0.80961
## 2: 0.039560        0.80961
## 3: 0.029998        0.80961
## 4: 0.022448        0.80961
## 5: 0.018250        0.80961
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
##                    Region Estimate 95% CI low 95% CI high Std. error t value
##  1: Paracentral_Lobule.R1 -0.24897 -0.4769513   -0.020997   0.114536 -2.1738
##  2:       Temporal_Mid.L4 -0.27672 -0.5280787   -0.025371   0.126280 -2.1914
##  3:    Frontal_Inf_Tri.R1  0.35856  0.0983839    0.618739   0.130713  2.7431
##  4:         Precentral.L4  0.32841  0.1333157    0.523498   0.098014  3.3506
##  5:       Parietal_Sup.L3  0.23381  0.0032371    0.464384   0.115840  2.0184
##  6:    Frontal_Mid_Orb.L1 -0.18797 -0.3405874   -0.035359   0.076673 -2.4516
##  7:       Parietal_Inf.R3  0.25583  0.0561342    0.455522   0.100326  2.5500
##  8:        Frontal_Mid.R5  0.29095  0.1063445    0.475558   0.092746  3.1371
##  9:            Putamen.L2 -0.20114 -0.3870394   -0.015233   0.093398 -2.1535
## 10:    Frontal_Inf_Tri.R3  0.24577  0.0076212    0.483926   0.119647  2.0541
##      Pr(>|t|) Pr(>|t|) (FDR)
##  1: 0.0327166        0.80556
##  2: 0.0313719        0.80556
##  3: 0.0075274        0.66241
##  4: 0.0012386        0.31653
##  5: 0.0469440        0.80556
##  6: 0.0164283        0.80556
##  7: 0.0127073        0.80556
##  8: 0.0023980        0.31653
##  9: 0.0343252        0.80556
## 10: 0.0432688        0.80556
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
##                            Region Estimate 95% CI low 95% CI high Std. error
## 1: 7Networks_LH_Limbic_TempPole_1 0.017429 0.00088149    0.033977  0.0083137
##    t value Pr(>|t|) Pr(>|t|) (FDR)
## 1:  2.0965  0.03924        0.75748
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
## 1:       7Networks_LH_SomMot_10 -0.21719 -0.3953616   -0.039015   0.089514
## 2: 7Networks_LH_DorsAttn_Post_6  0.24875  0.0348130    0.462690   0.107483
## 3:          7Networks_RH_Vis_14 -0.25386 -0.4645101   -0.043202   0.105832
## 4:       7Networks_RH_SomMot_12 -0.17216 -0.3268019   -0.017521   0.077691
## 5:      7Networks_RH_Cont_Par_2 -0.21825 -0.4127787   -0.023724   0.097730
## 6:     7Networks_RH_Cont_PFCl_4  0.25688  0.0013129    0.512451   0.128398
##    t value Pr(>|t|) Pr(>|t|) (FDR)
## 1: -2.4263 0.017532        0.87663
## 2:  2.3143 0.023248        0.87663
## 3: -2.3987 0.018812        0.87663
## 4: -2.2160 0.029571        0.87663
## 5: -2.2332 0.028365        0.87663
## 6:  2.0007 0.048863        0.87663
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
##                      Region Estimate 95% CI low 95% CI high Std. error t value
## 1:    7Networks_LH_SomMot_6 0.015839 1.1724e-03    0.030505  0.0073684  2.1496
## 2:   7Networks_LH_SomMot_10 0.014314 1.2150e-03    0.027412  0.0065807  2.1751
## 3: 7Networks_LH_Cont_Temp_1 0.017155 2.6071e-03    0.031702  0.0073087  2.3472
## 4:    7Networks_RH_SomMot_7 0.014583 3.7084e-05    0.029130  0.0073081  1.9955
##    Pr(>|t|) Pr(>|t|) (FDR)
## 1: 0.034650         0.4036
## 2: 0.032614         0.4036
## 3: 0.021422         0.4036
## 4: 0.049433         0.4036
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
##                            Region Estimate 95% CI low 95% CI high Std. error
## 1:          7Networks_LH_SomMot_4 -0.27116  -0.540781  -0.0015323   0.135459
## 2:   7Networks_LH_DorsAttn_Post_2  0.48667   0.198768   0.7745802   0.144644
## 3:             7Networks_RH_Vis_6 -0.22668  -0.403134  -0.0502271   0.088650
## 4:          7Networks_RH_SomMot_7 -0.27337  -0.454942  -0.0917965   0.091222
## 5:         7Networks_RH_SomMot_19 -0.17918  -0.351875  -0.0064759   0.086764
## 6:   7Networks_RH_DorsAttn_Post_3 -0.28202  -0.512383  -0.0516658   0.115732
## 7:       7Networks_RH_Cont_PFCl_4  0.31417   0.065838   0.5625103   0.124764
## 8:    7Networks_RH_Default_Temp_2  0.18525   0.048819   0.3216892   0.068545
## 9: 7Networks_RH_Default_pCunPCC_1 -0.11699  -0.218995  -0.0149765   0.051249
##    t value  Pr(>|t|) Pr(>|t|) (FDR)
## 1: -2.0018 0.0487430        0.80705
## 2:  3.3646 0.0011849        0.23698
## 3: -2.5570 0.0124720        0.55273
## 4: -2.9968 0.0036453        0.36453
## 5: -2.0651 0.0421947        0.80705
## 6: -2.4369 0.0170632        0.56877
## 7:  2.5182 0.0138181        0.55273
## 8:  2.7027 0.0084175        0.55273
## 9: -2.2827 0.0251385        0.71824
```
