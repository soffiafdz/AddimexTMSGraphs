---
title: "Functional Connectivity Networks' Topology Changes after rTMS in Cocaine Addiction 2.5"
subtitle: "Nodal analysis"
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







#### Strength


```
## GLM formula:
## 	 strength ~ age + bis + vas + fd + sex + group * session 
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
## 1: Frontal_Med_Orb.L1   2.8103   0.294978      5.3256     1.2637  2.2239
## 2:        Fusiform.R3   4.3563   0.117345      8.5952     2.1296  2.0456
## 3:    Parietal_Sup.L3   3.9202   1.204104      6.6363     1.3646  2.8729
## 4:          Insula.L3   3.4275   0.570570      6.2844     1.4353  2.3880
## 5:        Thalamus.L1   2.3247   0.132960      4.5164     1.1011  2.1112
## 6:         Caudate.L1   3.6724   0.359752      6.9851     1.6643  2.2066
## 7:   Occipital_Mid.L7   2.9601   0.043632      5.8766     1.4652  2.0202
##     Pr(>|t|) Pr(>|t|) (FDR)
## 1: 0.0290123         0.7571
## 2: 0.0441290         0.7571
## 3: 0.0052218         0.7571
## 4: 0.0193293         0.7571
## 5: 0.0379170         0.7571
## 6: 0.0302451         0.7571
## 7: 0.0467492         0.7571
```

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







#### Strength


```
## GLM formula:
## 	 strength ~ age + bis + vas + fd + sex + group * session 
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
## 1:     Frontal_Mid.L1   4.8044    1.14811      8.4607     1.8369  2.6155
## 2:       Precuneus.L6   5.1053    0.59820      9.6124     2.2644  2.2546
## 3: Frontal_Inf_Tri.R1   5.7132    0.67301     10.7533     2.5322  2.2562
## 4:     Frontal_Mid.L3   4.9740    0.72695      9.2210     2.1337  2.3311
## 5:    Parietal_Sup.L3   5.3432    1.22375      9.4627     2.0696  2.5817
## 6:    Parietal_Inf.R3   4.6483    0.59596      8.7006     2.0359  2.2832
## 7:     Frontal_Mid.R5   4.5014    0.39697      8.6059     2.0621  2.1830
## 8:    Temporal_Sup.L3   6.1446    0.20103     12.0882     2.9861  2.0578
##    Pr(>|t|) Pr(>|t|) (FDR)
## 1: 0.010670         0.6897
## 2: 0.026926         0.6897
## 3: 0.026820         0.6897
## 4: 0.022296         0.6897
## 5: 0.011679         0.6897
## 6: 0.025108         0.6897
## 7: 0.032008         0.6897
## 8: 0.042910         0.6897
```

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





<!-- ## Schaefer-200 -->
<!-- ```{r, child = here('reports/nodal_raw_schaefer.Rmd')} -->
<!-- ``` -->

<!-- # Density -->

<!-- ## Power264 -->
<!-- ```{r, child = here('reports/nodal_dens_power.Rmd')} -->
<!-- ``` -->

<!-- ## Schaefer-200 -->
<!-- ```{r, child = here('reports/nodal_dens_schaefer.Rmd')} -->
<!-- ``` -->
