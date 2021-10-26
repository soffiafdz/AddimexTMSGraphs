---
title: "Functional Connectivity Networks' Topology Changes after rTMS in Cocaine Addiction 2.0"
subtitle: "Electric Boogaloo"
author: "Sofia Fernandez"
date: '08 September, 2021'
output:
  bookdown::pdf_document2:
    toc: true
    fig_caption: true
    keep_md: true
    # includes:
    #     in_header: my_header.tex
---



# Introduction

In this report I present and analyse the data of the ADDIMEX_TMS project.
For the project, participants diagnosed with Cocaine Use Disorder (CUD)
volunteered to take part into a double-blind randomized clinical trial
(Active/Sham) exploring the efficacy of rTMS diminishing the clinical symptoms
of addiction.

Participants were randomly assigned to receive two daily sessions of either
active or sham rTMS over the left-DLPFC for two weeks (10 weekdays).
This consisted in the **closed-label** phase of the study.
After the last day of treatment the group assignment was revealed.
To those of the sham arm we offered to retake 20 more sessions of real rTMS
under the same parameters as the active group.

We acquired both clinical and MRI data at Baseline (T0), two weeks (T1), three
(T2) and six (T3) months. For this **longitudinal phase** only the participants
who started with active stimulation were included in the analysis.

Here I explore the brain functional connectivity of the participants in the
form of global networks constructed from the BOLD signal of their MRI data.
Different metrics of topology are calculated and compared at the different
time-points to see how they are affected by the treatment in the closed-label,
and how they evolve over time in the Longitudinal phase.


# Demographics and Clinical data





## Demographics
After baseline criteria filtering and subsequent exclusion, 50 participants
were randomly assigned to a group and went through baseline data acquisition.

Table \@ref(tab:demog-table) contains a summary of the demographics of these 50 participants initially enrolled.


Table: (\#tab:demog-table)(\#tab:demog-table) Demographic data at baseline

|                                | Sham (N=23) | Real (N=27) | Total (N=50) |
|:-------------------------------|:-----------:|:-----------:|:------------:|
|**sex**                         |             |             |              |
|&nbsp;&nbsp;&nbsp;M             | 20 (87.0%)  | 23 (85.2%)  |  43 (86.0%)  |
|&nbsp;&nbsp;&nbsp;F             |  3 (13.0%)  |  4 (14.8%)  |  7 (14.0%)   |
|**Age (years)**                 |             |             |              |
|&nbsp;&nbsp;&nbsp;Mean (SD)     | 33.3 (8.1)  | 36.0 (7.2)  |  34.8 (7.7)  |
|&nbsp;&nbsp;&nbsp;Range         | 18.0 - 47.0 | 24.0 - 48.0 | 18.0 - 48.0  |
|**Education (years)**           |             |             |              |
|&nbsp;&nbsp;&nbsp;Mean (SD)     | 13.4 (2.8)  | 12.8 (3.1)  |  13.1 (2.9)  |
|&nbsp;&nbsp;&nbsp;Range         | 8.0 - 18.0  | 8.0 - 19.0  |  8.0 - 19.0  |
|**Civil status**                |             |             |              |
|&nbsp;&nbsp;&nbsp;Single        | 15 (65.2%)  | 13 (48.1%)  |  28 (56.0%)  |
|&nbsp;&nbsp;&nbsp;Married       |  5 (21.7%)  |  6 (22.2%)  |  11 (22.0%)  |
|&nbsp;&nbsp;&nbsp;Divorced      |  1 (4.3%)   |  4 (14.8%)  |  5 (10.0%)   |
|&nbsp;&nbsp;&nbsp;Separated     |  1 (4.3%)   |  3 (11.1%)  |   4 (8.0%)   |
|&nbsp;&nbsp;&nbsp;Widowed       |  1 (4.3%)   |  1 (3.7%)   |   2 (4.0%)   |
|**Employment (last 3 y)**       |             |             |              |
|&nbsp;&nbsp;&nbsp;Full-time     | 12 (52.2%)  | 17 (63.0%)  |  29 (58.0%)  |
|&nbsp;&nbsp;&nbsp;Half-time     |  4 (17.4%)  |  6 (22.2%)  |  10 (20.0%)  |
|&nbsp;&nbsp;&nbsp;Free-lance    |  5 (21.7%)  |  4 (14.8%)  |  9 (18.0%)   |
|&nbsp;&nbsp;&nbsp;Scholarized   |  1 (4.3%)   |  0 (0.0%)   |   1 (2.0%)   |
|&nbsp;&nbsp;&nbsp;Unemployed    |  1 (4.3%)   |  0 (0.0%)   |   1 (2.0%)   |
|**Smoking**                     |             |             |              |
|&nbsp;&nbsp;&nbsp;N-Miss        |      0      |      1      |      1       |
|&nbsp;&nbsp;&nbsp;No            |  5 (21.7%)  |  8 (30.8%)  |  13 (26.5%)  |
|&nbsp;&nbsp;&nbsp;Yes           | 18 (78.3%)  | 18 (69.2%)  |  36 (73.5%)  |
|**tobacco_years**               |             |             |              |
|&nbsp;&nbsp;&nbsp;N-Miss        |      0      |      1      |      1       |
|&nbsp;&nbsp;&nbsp;Mean (SD)     | 15.1 (9.5)  | 15.4 (9.8)  |  15.3 (9.5)  |
|&nbsp;&nbsp;&nbsp;Range         | 0.0 - 32.0  | 0.0 - 36.0  |  0.0 - 36.0  |
|**Cigarettes/day**              |             |             |              |
|&nbsp;&nbsp;&nbsp;N-Miss        |      0      |      1      |      1       |
|&nbsp;&nbsp;&nbsp;Mean (SD)     |  3.9 (4.0)  | 8.2 (13.2)  |  6.2 (10.1)  |
|&nbsp;&nbsp;&nbsp;Range         | 0.0 - 15.0  | 0.0 - 60.0  |  0.0 - 60.0  |
|**Main substance**              |             |             |              |
|&nbsp;&nbsp;&nbsp;Crack-cocaine | 20 (87.0%)  | 27 (100.0%) |  47 (94.0%)  |
|&nbsp;&nbsp;&nbsp;Cocaine       |  3 (13.0%)  |  0 (0.0%)   |   3 (6.0%)   |
|**Treatment**                   |             |             |              |
|&nbsp;&nbsp;&nbsp;None          |  4 (17.4%)  |  5 (18.5%)  |  9 (18.0%)   |
|&nbsp;&nbsp;&nbsp;Psych&Pharm   |  4 (17.4%)  |  6 (22.2%)  |  10 (20.0%)  |
|&nbsp;&nbsp;&nbsp;Pharm         | 15 (65.2%)  | 16 (59.3%)  |  31 (62.0%)  |
|**Onset age of cocaine use**    |             |             |              |
|&nbsp;&nbsp;&nbsp;Mean (SD)     | 22.5 (6.8)  | 23.1 (5.9)  |  22.8 (6.3)  |
|&nbsp;&nbsp;&nbsp;Range         | 14.0 - 41.0 | 15.0 - 35.0 | 14.0 - 41.0  |
|**Years of cocaine use**        |             |             |              |
|&nbsp;&nbsp;&nbsp;Mean (SD)     |  9.6 (7.6)  | 11.6 (7.9)  |  10.7 (7.7)  |
|&nbsp;&nbsp;&nbsp;Range         | 1.0 - 25.0  | 2.0 - 30.0  |  1.0 - 30.0  |

## Dropouts

One of the main drawbacks of the project was the high number of dropouts
throughout the data-acquisition phases. A lot of data would be lost due to
dropouts; six participants didn't complete the two weeks of treatment and only
13 stayed in the program until the six-months time-point.

Most of the analyses are done through mixed-effect models which are robust to
missing data. This allows to maintain the data of those subjects who subsequently
dropped out of the study.

## Covariates

### Clinical data as covariates
The clinical data has already been explored and compared both by the
experimental groups and longitudinally through the different time-points in
another manuscript. For this reason, in this report I focus only in those
variables that showed significant interaction, and their purpose is mainly as covariates for the network analyses.

### In-scanner movement
Head-motion is one of the main sources for artefacts in functional MRI data.
Although some of the noise related to motion can be removed at the
pre-processing steps; residual artefacts can still remain in cases of elevated
motion, especially when dealing with patient populations. Because of this,
frame-wise displacement is treated as a covariate in the models.

## Clinical Data

### Acute phase
In table \@ref(tab:summary-acute) are summarized by experimental group and
session (before and after treatment) the main clinical variables, self-report of consumption (frequency and weight) and in-scanner head movement.

The clinical scores of craving (Viusal Analog Scale) and impulsivity at this
stage are represented in figure \@ref(fig:acute-clin).


Table: (\#tab:summary-acute)(\#tab:summary-acute) Clinical summary of acute phase

|group |                                    |  T0 (N=50)   |  T1 (N=44)  |
|:-----|:-----------------------------------|:------------:|:-----------:|
|Sham  |**sex**                             |              |             |
|      |&nbsp;&nbsp;&nbsp;M                 |  20 (87.0%)  | 18 (90.0%)  |
|      |&nbsp;&nbsp;&nbsp;F                 |  3 (13.0%)   |  2 (10.0%)  |
|      |**Age (years)**                     |              |             |
|      |&nbsp;&nbsp;&nbsp;Mean (SD)         |  33.3 (8.1)  | 33.3 (8.7)  |
|      |&nbsp;&nbsp;&nbsp;Range             | 18.0 - 47.0  | 18.0 - 47.0 |
|      |**Consumption (freq)**              |              |             |
|      |&nbsp;&nbsp;&nbsp;Mean (SD)         | 12.4 (11.8)  |  3.7 (5.5)  |
|      |&nbsp;&nbsp;&nbsp;Range             |  1.0 - 40.0  | 0.0 - 20.0  |
|      |**Consumption (g)**                 |              |             |
|      |&nbsp;&nbsp;&nbsp;Mean (SD)         | 43.0 (148.3) |  4.2 (6.3)  |
|      |&nbsp;&nbsp;&nbsp;Range             | 0.6 - 720.0  | 0.0 - 20.0  |
|      |**relapse**                         |              |             |
|      |&nbsp;&nbsp;&nbsp;No-use            | 23 (100.0%)  |  8 (40.0%)  |
|      |&nbsp;&nbsp;&nbsp;Reincidence       |   0 (0.0%)   |  5 (25.0%)  |
|      |&nbsp;&nbsp;&nbsp;Relapse           |   0 (0.0%)   |  1 (5.0%)   |
|      |&nbsp;&nbsp;&nbsp;Decrease          |   0 (0.0%)   |  5 (25.0%)  |
|      |&nbsp;&nbsp;&nbsp;Equal             |   0 (0.0%)   |  1 (5.0%)   |
|      |**status**                          |              |             |
|      |&nbsp;&nbsp;&nbsp;1Visit            | 23 (100.0%)  |  0 (0.0%)   |
|      |&nbsp;&nbsp;&nbsp;Better            |   0 (0.0%)   |  5 (25.0%)  |
|      |&nbsp;&nbsp;&nbsp;Moderately-better |   0 (0.0%)   |  8 (40.0%)  |
|      |&nbsp;&nbsp;&nbsp;Slightly-better   |   0 (0.0%)   |  4 (20.0%)  |
|      |&nbsp;&nbsp;&nbsp;No-changes        |   0 (0.0%)   |  3 (15.0%)  |
|      |&nbsp;&nbsp;&nbsp;Slightly-worse    |   0 (0.0%)   |  0 (0.0%)   |
|      |&nbsp;&nbsp;&nbsp;Moderately-worse  |   0 (0.0%)   |  0 (0.0%)   |
|      |&nbsp;&nbsp;&nbsp;Worse             |   0 (0.0%)   |  0 (0.0%)   |
|      |**BIS-11**                          |              |             |
|      |&nbsp;&nbsp;&nbsp;Mean (SD)         | 62.6 (16.9)  | 59.8 (21.4) |
|      |&nbsp;&nbsp;&nbsp;Range             | 34.0 - 92.0  | 20.0 - 95.0 |
|      |**Visual Analog Scale**             |              |             |
|      |&nbsp;&nbsp;&nbsp;Mean (SD)         |  2.9 (2.9)   |  2.3 (2.5)  |
|      |&nbsp;&nbsp;&nbsp;Range             |  0.0 - 10.0  |  0.0 - 8.4  |
|      |**In-scanner movement (mm)**        |              |             |
|      |&nbsp;&nbsp;&nbsp;Mean (SD)         |  0.2 (0.1)   |  0.2 (0.1)  |
|      |&nbsp;&nbsp;&nbsp;Range             |  0.1 - 0.4   |  0.1 - 0.4  |
|Real  |**sex**                             |              |             |
|      |&nbsp;&nbsp;&nbsp;M                 |  23 (85.2%)  | 20 (83.3%)  |
|      |&nbsp;&nbsp;&nbsp;F                 |  4 (14.8%)   |  4 (16.7%)  |
|      |**Age (years)**                     |              |             |
|      |&nbsp;&nbsp;&nbsp;Mean (SD)         |  36.0 (7.2)  | 35.8 (7.1)  |
|      |&nbsp;&nbsp;&nbsp;Range             | 24.0 - 48.0  | 24.0 - 47.0 |
|      |**Consumption (freq)**              |              |             |
|      |&nbsp;&nbsp;&nbsp;Mean (SD)         |  10.7 (9.8)  |  2.5 (5.2)  |
|      |&nbsp;&nbsp;&nbsp;Range             |  1.0 - 31.0  | 0.0 - 20.0  |
|      |**Consumption (g)**                 |              |             |
|      |&nbsp;&nbsp;&nbsp;Mean (SD)         | 16.8 (27.8)  |  1.0 (2.3)  |
|      |&nbsp;&nbsp;&nbsp;Range             | 0.4 - 120.0  | 0.0 - 10.0  |
|      |**relapse**                         |              |             |
|      |&nbsp;&nbsp;&nbsp;No-use            | 27 (100.0%)  | 14 (58.3%)  |
|      |&nbsp;&nbsp;&nbsp;Reincidence       |   0 (0.0%)   |  4 (16.7%)  |
|      |&nbsp;&nbsp;&nbsp;Relapse           |   0 (0.0%)   |  1 (4.2%)   |
|      |&nbsp;&nbsp;&nbsp;Decrease          |   0 (0.0%)   |  3 (12.5%)  |
|      |&nbsp;&nbsp;&nbsp;Equal             |   0 (0.0%)   |  2 (8.3%)   |
|      |**status**                          |              |             |
|      |&nbsp;&nbsp;&nbsp;1Visit            | 27 (100.0%)  |  0 (0.0%)   |
|      |&nbsp;&nbsp;&nbsp;Better            |   0 (0.0%)   | 16 (66.7%)  |
|      |&nbsp;&nbsp;&nbsp;Moderately-better |   0 (0.0%)   |  6 (25.0%)  |
|      |&nbsp;&nbsp;&nbsp;Slightly-better   |   0 (0.0%)   |  0 (0.0%)   |
|      |&nbsp;&nbsp;&nbsp;No-changes        |   0 (0.0%)   |  2 (8.3%)   |
|      |&nbsp;&nbsp;&nbsp;Slightly-worse    |   0 (0.0%)   |  0 (0.0%)   |
|      |&nbsp;&nbsp;&nbsp;Moderately-worse  |   0 (0.0%)   |  0 (0.0%)   |
|      |&nbsp;&nbsp;&nbsp;Worse             |   0 (0.0%)   |  0 (0.0%)   |
|      |**BIS-11**                          |              |             |
|      |&nbsp;&nbsp;&nbsp;Mean (SD)         | 64.8 (17.1)  | 53.1 (17.4) |
|      |&nbsp;&nbsp;&nbsp;Range             | 22.0 - 98.0  | 16.0 - 81.0 |
|      |**Visual Analog Scale**             |              |             |
|      |&nbsp;&nbsp;&nbsp;Mean (SD)         |  3.8 (3.6)   |  1.5 (2.4)  |
|      |&nbsp;&nbsp;&nbsp;Range             |  0.0 - 10.0  |  0.0 - 9.3  |
|      |**In-scanner movement (mm)**        |              |             |
|      |&nbsp;&nbsp;&nbsp;Mean (SD)         |  0.2 (0.1)   |  0.2 (0.1)  |
|      |&nbsp;&nbsp;&nbsp;Range             |  0.1 - 0.5   |  0.1 - 0.4  |

![(\#fig:acute-clin)Clinical scores by experimental group in the acute phase. A) Craving scores by VAS & B) Impulsivity by BIS-11.](main_files/figure-latex/acute-clin-1.pdf) 

### Maintenance phase
To explore the longitudinal changes observed by the rTMS treatment, the stages
of those participants initially in the sham arm were recoded to take into account
the firs two weeks of simulated stimulation preceding the active treatment.
In those subjects, the data acquired at baseline were relabelled as **T-1**;
the data obtained followint the end of the acute phase, and thus preceding real
treatment was then **T0**, and the stage following the the two weeks of active
stimulation **T1**.

The labels for the maintenance phase are the same for both arms.

Main clinical data for all participants with this recoding are summarized in
table \@ref(tab:summary-maintenance) and the clinical changes for craving and
impulsivity are represented in figure \@ref(fig:long-clin).


Table: (\#tab:summary-maintenance)(\#tab:summary-maintenance) Clinical summary of maintenance phase

|                                    |  T0 (N=27)  |  T1 (N=24)  |  T2 (N=15)  |  T3 (N=9)   |
|:-----------------------------------|:-----------:|:-----------:|:-----------:|:-----------:|
|**sex**                             |             |             |             |             |
|&nbsp;&nbsp;&nbsp;M                 | 23 (85.2%)  | 20 (83.3%)  | 12 (80.0%)  |  8 (88.9%)  |
|&nbsp;&nbsp;&nbsp;F                 |  4 (14.8%)  |  4 (16.7%)  |  3 (20.0%)  |  1 (11.1%)  |
|**Age (years)**                     |             |             |             |             |
|&nbsp;&nbsp;&nbsp;Mean (SD)         | 36.0 (7.2)  | 35.8 (7.1)  | 39.6 (5.1)  | 40.4 (5.5)  |
|&nbsp;&nbsp;&nbsp;Range             | 24.0 - 48.0 | 24.0 - 47.0 | 32.0 - 47.0 | 33.0 - 47.0 |
|**Consumption (freq)**              |             |             |             |             |
|&nbsp;&nbsp;&nbsp;Mean (SD)         | 10.7 (9.8)  |  2.5 (5.2)  |  3.0 (8.0)  | 4.2 (10.2)  |
|&nbsp;&nbsp;&nbsp;Range             | 1.0 - 31.0  | 0.0 - 20.0  | 0.0 - 31.0  | 0.0 - 31.0  |
|**Consumption (g)**                 |             |             |             |             |
|&nbsp;&nbsp;&nbsp;Mean (SD)         | 16.8 (27.8) |  1.0 (2.3)  | 4.1 (11.9)  |  3.5 (9.9)  |
|&nbsp;&nbsp;&nbsp;Range             | 0.4 - 120.0 | 0.0 - 10.0  | 0.0 - 46.5  | 0.0 - 30.0  |
|**relapse**                         |             |             |             |             |
|&nbsp;&nbsp;&nbsp;No-use            | 27 (100.0%) | 14 (58.3%)  |  7 (46.7%)  |  6 (66.7%)  |
|&nbsp;&nbsp;&nbsp;Reincidence       |  0 (0.0%)   |  4 (16.7%)  |  3 (20.0%)  |  2 (22.2%)  |
|&nbsp;&nbsp;&nbsp;Relapse           |  0 (0.0%)   |  1 (4.2%)   |  3 (20.0%)  |  0 (0.0%)   |
|&nbsp;&nbsp;&nbsp;Decrease          |  0 (0.0%)   |  3 (12.5%)  |  1 (6.7%)   |  1 (11.1%)  |
|&nbsp;&nbsp;&nbsp;Equal             |  0 (0.0%)   |  2 (8.3%)   |  1 (6.7%)   |  0 (0.0%)   |
|**status**                          |             |             |             |             |
|&nbsp;&nbsp;&nbsp;1Visit            | 27 (100.0%) |  0 (0.0%)   |  0 (0.0%)   |  0 (0.0%)   |
|&nbsp;&nbsp;&nbsp;Better            |  0 (0.0%)   | 16 (66.7%)  | 13 (86.7%)  |  8 (88.9%)  |
|&nbsp;&nbsp;&nbsp;Moderately-better |  0 (0.0%)   |  6 (25.0%)  |  1 (6.7%)   |  1 (11.1%)  |
|&nbsp;&nbsp;&nbsp;Slightly-better   |  0 (0.0%)   |  0 (0.0%)   |  0 (0.0%)   |  0 (0.0%)   |
|&nbsp;&nbsp;&nbsp;No-changes        |  0 (0.0%)   |  2 (8.3%)   |  0 (0.0%)   |  0 (0.0%)   |
|&nbsp;&nbsp;&nbsp;Slightly-worse    |  0 (0.0%)   |  0 (0.0%)   |  0 (0.0%)   |  0 (0.0%)   |
|&nbsp;&nbsp;&nbsp;Moderately-worse  |  0 (0.0%)   |  0 (0.0%)   |  0 (0.0%)   |  0 (0.0%)   |
|&nbsp;&nbsp;&nbsp;Worse             |  0 (0.0%)   |  0 (0.0%)   |  1 (6.7%)   |  0 (0.0%)   |
|**BIS-11**                          |             |             |             |             |
|&nbsp;&nbsp;&nbsp;Mean (SD)         | 64.8 (17.1) | 53.1 (17.4) | 48.1 (20.8) | 51.9 (18.2) |
|&nbsp;&nbsp;&nbsp;Range             | 22.0 - 98.0 | 16.0 - 81.0 | 14.0 - 97.0 | 20.0 - 76.0 |
|**Visual Analog Scale**             |             |             |             |             |
|&nbsp;&nbsp;&nbsp;Mean (SD)         |  3.8 (3.6)  |  1.5 (2.4)  |  0.4 (0.9)  |  3.1 (3.7)  |
|&nbsp;&nbsp;&nbsp;Range             | 0.0 - 10.0  |  0.0 - 9.3  |  0.0 - 3.3  |  0.0 - 9.0  |
|**In-scanner movement (mm)**        |             |             |             |             |
|&nbsp;&nbsp;&nbsp;Mean (SD)         |  0.2 (0.1)  |  0.2 (0.1)  |  0.2 (0.1)  |  0.2 (0.1)  |
|&nbsp;&nbsp;&nbsp;Range             |  0.1 - 0.5  |  0.1 - 0.4  |  0.1 - 0.6  |  0.1 - 0.4  |

![(\#fig:long-clin)Clinical scores across all stages: A) Craving scores by VAS & B) Impulsivity by BIS-11.](main_files/figure-latex/long-clin-1.pdf) 

# Graphs: Raw Thresholding

## Power-264 (with Global Signal)





### Acute phase

![(\#fig:rpg-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/rpg-sparklines-acute-1.pdf) 



#### Density

![(\#fig:rpg-repmes-density)Integrated metric of density by group.](main_files/figure-latex/rpg-repmes-density-1.pdf) 

##### Likelihood Ratio Test of Fixed effects


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.02    .875
## 2         group  1      0.21    .644
## 3            fd  1 20.29 ***   <.001
## 4           vas  1      0.95    .330
## 5           bis  1      0.13    .720
## 6           age  1      1.18    .278
## 7           sex  1   7.50 **    .006
## 8 session:group  1      2.21    .137
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-density) Mixed Effects Model for Density.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & density \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.027 \\ 
  & (0.024) \\ 
  & \\ 
 groupSham & 0.021 \\ 
  & (0.019) \\ 
  & \\ 
 fd & 0.400$^{***}$ \\ 
  & (0.080) \\ 
  & \\ 
 sexF & $-$0.072$^{***}$ \\ 
  & (0.026) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.055 \\ 
  & (0.035) \\ 
  & \\ 
 Constant & 0.222$^{***}$ \\ 
  & (0.044) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 3,907.379 \\ 
Akaike Inf. Crit. & $-$7,792.759 \\ 
Bayesian Inf. Crit. & $-$7,731.293 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Strength

![(\#fig:rpg-repmes-strength)Integrated metric of strength by group.](main_files/figure-latex/rpg-repmes-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.02    .886
## 2         group  1      0.13    .715
## 3            fd  1 21.49 ***   <.001
## 4           vas  1      1.36    .244
## 5           bis  1      0.58    .448
## 6           age  1      1.24    .265
## 7           sex  1    6.42 *    .011
## 8 session:group  1      2.27    .132
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-strength) Mixed Effects Model for Strength.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & strength \\ 
\hline \\[-1.8ex] 
 sessionT1 & 3.750 \\ 
  & (2.824) \\ 
  & \\ 
 groupSham & 2.755 \\ 
  & (2.048) \\ 
  & \\ 
 fd & 45.509$^{***}$ \\ 
  & (8.936) \\ 
  & \\ 
 sexF & $-$7.107$^{**}$ \\ 
  & (2.863) \\ 
  & \\ 
 sessionT1:groupSham & $-$6.472 \\ 
  & (4.178) \\ 
  & \\ 
 Constant & 13.699$^{***}$ \\ 
  & (2.945) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & $-$4,375.590 \\ 
Akaike Inf. Crit. & 8,773.180 \\ 
Bayesian Inf. Crit. & 8,834.646 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Modularity

![(\#fig:rpg-repmes-mod)Integrated metric of modularity by group.](main_files/figure-latex/rpg-repmes-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      1.00    .317
## 2         group  1      0.12    .726
## 3            fd  1 20.03 ***   <.001
## 4           vas  1      0.84    .361
## 5           bis  1      0.61    .436
## 6           age  1      0.06    .813
## 7           sex  1   9.56 **    .002
## 8 session:group  1      1.19    .276
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-mod) mixed effects model for modularity.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & mod.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.010 \\ 
  & (0.021) \\ 
  & \\ 
 groupSham & $-$0.013 \\ 
  & (0.018) \\ 
  & \\ 
 fd & $-$0.370$^{***}$ \\ 
  & (0.075) \\ 
  & \\ 
 sexF & 0.074$^{***}$ \\ 
  & (0.023) \\ 
  & \\ 
 sessionT1:groupSham & 0.041 \\ 
  & (0.031) \\ 
  & \\ 
 Constant & 0.396$^{***}$ \\ 
  & (0.028) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 3,955.735 \\ 
Akaike Inf. Crit. & $-$7,889.470 \\ 
Bayesian Inf. Crit. & $-$7,828.004 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 


#### Number of hubs

![(\#fig:rpg-repmes-nhubs)Integrated metric of the number of hubs by group.](main_files/figure-latex/rpg-repmes-nhubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   0.18    .674
## 2         group  1   0.04    .841
## 3            fd  1 4.33 *    .037
## 4           vas  1   0.65    .419
## 5           bis  1   0.21    .649
## 6           age  1   0.02    .877
## 7           sex  1   0.21    .649
## 8 session:group  1 4.61 *    .032
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-nhubs) mixed effects model for number of hubs.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & num.hubs.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 1.303 \\ 
  & (0.833) \\ 
  & \\ 
 groupSham & 1.358 \\ 
  & (0.953) \\ 
  & \\ 
 fd & 7.024$^{**}$ \\ 
  & (3.411) \\ 
  & \\ 
 sexF & 0.358 \\ 
  & (0.973) \\ 
  & \\ 
 sessionT1:groupSham & $-$2.457$^{**}$ \\ 
  & (1.227) \\ 
  & \\ 
 Constant & 62.147$^{***}$ \\ 
  & (1.079) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & $-$5,342.116 \\ 
Akaike Inf. Crit. & 10,706.230 \\ 
Bayesian Inf. Crit. & 10,767.700 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency

![(\#fig:rpg-repmes-eglob)Integrated metric of global efficiency by group.](main_files/figure-latex/rpg-repmes-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.08    .777
## 2         group  1      0.34    .562
## 3            fd  1 22.06 ***   <.001
## 4           vas  1      0.84    .360
## 5           bis  1      0.08    .783
## 6           age  1      0.62    .431
## 7           sex  1  10.69 **    .001
## 8 session:group  1      2.12    .146
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-ge) mixed effects model for Global Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.017 \\ 
  & (0.017) \\ 
  & \\ 
 groupSham & 0.012 \\ 
  & (0.013) \\ 
  & \\ 
 fd & 0.298$^{***}$ \\ 
  & (0.057) \\ 
  & \\ 
 sexF & $-$0.060$^{***}$ \\ 
  & (0.018) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.038 \\ 
  & (0.025) \\ 
  & \\ 
 Constant & 0.545$^{***}$ \\ 
  & (0.033) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 4,831.049 \\ 
Akaike Inf. Crit. & $-$9,640.097 \\ 
Bayesian Inf. Crit. & $-$9,578.631 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency (weighted)

![(\#fig:rpg-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_files/figure-latex/rpg-repmes-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.00    .944
## 2         group  1      0.17    .680
## 3            fd  1 24.51 ***   <.001
## 4           vas  1      1.64    .201
## 5           bis  1      0.54    .462
## 6           age  1      0.54    .462
## 7           sex  1  10.38 **    .001
## 8 session:group  1      1.99    .158
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-gew) mixed effects model for Global Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.011 \\ 
  & (0.010) \\ 
  & \\ 
 groupSham & 0.009 \\ 
  & (0.008) \\ 
  & \\ 
 fd & 0.184$^{***}$ \\ 
  & (0.033) \\ 
  & \\ 
 sexF & $-$0.033$^{***}$ \\ 
  & (0.010) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.022 \\ 
  & (0.015) \\ 
  & \\ 
 Constant & 0.177$^{***}$ \\ 
  & (0.009) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 7,061.485 \\ 
Akaike Inf. Crit. & $-$14,100.970 \\ 
Bayesian Inf. Crit. & $-$14,039.500 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency

![(\#fig:rpg-repmes-eloc)Integrated metric of local efficiency by group.](main_files/figure-latex/rpg-repmes-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.05    .816
## 2         group  1      0.00    .984
## 3            fd  1 11.99 ***   <.001
## 4           vas  1      1.40    .236
## 5           bis  1      0.69    .406
## 6           age  1      0.84    .359
## 7           sex  1    5.65 *    .017
## 8 session:group  1      1.68    .195
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-eloc) mixed effects model for Local Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.011 \\ 
  & (0.009) \\ 
  & \\ 
 groupSham & 0.010 \\ 
  & (0.008) \\ 
  & \\ 
 fd & 0.120$^{***}$ \\ 
  & (0.033) \\ 
  & \\ 
 sexF & $-$0.024$^{**}$ \\ 
  & (0.010) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.018 \\ 
  & (0.013) \\ 
  & \\ 
 Constant & 0.751$^{***}$ \\ 
  & (0.011) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 5,071.152 \\ 
Akaike Inf. Crit. & $-$10,120.300 \\ 
Bayesian Inf. Crit. & $-$10,058.840 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency (weighted)

![(\#fig:rpg-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_files/figure-latex/rpg-repmes-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.16    .693
## 2         group  1      0.02    .883
## 3            fd  1 15.56 ***   <.001
## 4           vas  1      1.89    .170
## 5           bis  1      1.41    .235
## 6           age  1      0.27    .600
## 7           sex  1   7.28 **    .007
## 8 session:group  1      1.33    .250
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-elocw) mixed effects model for Local Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.012 \\ 
  & (0.010) \\ 
  & \\ 
 groupSham & 0.011 \\ 
  & (0.009) \\ 
  & \\ 
 fd & 0.155$^{***}$ \\ 
  & (0.036) \\ 
  & \\ 
 sexF & $-$0.028$^{**}$ \\ 
  & (0.011) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.017 \\ 
  & (0.015) \\ 
  & \\ 
 Constant & 0.244$^{***}$ \\ 
  & (0.011) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 6,077.401 \\ 
Akaike Inf. Crit. & $-$12,132.800 \\ 
Bayesian Inf. Crit. & $-$12,071.340 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

### Maintenance phase

![(\#fig:rpg-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/rpg-sparklines-long-1.pdf) 



#### Density

![(\#fig:rpg-repmesl-density)Integrated metric of density by session.](main_files/figure-latex/rpg-repmesl-density-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    3.02    .388
## 2      fd  1 7.17 **    .007
## 3     vas  1  2.95 +    .086
## 4     bis  1    0.08    .783
## 5     age  1    0.36    .548
## 6     sex  1 7.63 **    .006
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Strength

![(\#fig:rpg-repmesl-strength)Integrated metric of strength by session.](main_files/figure-latex/rpg-repmesl-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    3.45    .327
## 2      fd  1 7.35 **    .007
## 3     vas  1    2.70    .100
## 4     bis  1    0.17    .682
## 5     age  1    0.40    .527
## 6     sex  1  4.73 *    .030
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Modularity

![(\#fig:rpg-repmesl-mod)Integrated metric of modularity by session.](main_files/figure-latex/rpg-repmesl-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      0.91    .823
## 2      fd  1 12.85 ***   <.001
## 3     vas  1      0.67    .412
## 4     bis  1    4.87 *    .027
## 5     age  1    4.84 *    .028
## 6     sex  1 13.82 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Number of hubs

![(\#fig:rpg-repmesl-hubs)Integrated metric of number of hubs by session.](main_files/figure-latex/rpg-repmesl-hubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df  Chisq p.value
## 1 session  3 7.28 +    .063
## 2      fd  1   0.04    .832
## 3     vas  1   2.28    .131
## 4     bis  1   0.24    .625
## 5     age  1   0.09    .759
## 6     sex  1   1.79    .181
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency

![(\#fig:rpg-repmesl-eglob)Integrated metric of global efficiency by session.](main_files/figure-latex/rpg-repmesl-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      2.72    .437
## 2      fd  1    6.54 *    .011
## 3     vas  1      1.07    .301
## 4     bis  1      0.00    .982
## 5     age  1      0.07    .798
## 6     sex  1 11.61 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency (weighted)

![(\#fig:rpg-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_files/figure-latex/rpg-repmesl-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    3.22    .359
## 2      fd  1 7.59 **    .006
## 3     vas  1    0.60    .437
## 4     bis  1    0.39    .531
## 5     age  1    0.21    .650
## 6     sex  1 9.75 **    .002
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency

![(\#fig:rpg-repmesl-eloc)Integrated metric of local efficiency by session.](main_files/figure-latex/rpg-repmesl-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df  Chisq p.value
## 1 session  3 6.52 +    .089
## 2      fd  1 3.55 +    .060
## 3     vas  1   1.08    .299
## 4     bis  1   0.54    .464
## 5     age  1   0.00    .963
## 6     sex  1 3.01 +    .083
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency (weighted)

![(\#fig:rpg-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_files/figure-latex/rpg-repmesl-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df  Chisq p.value
## 1 session  3 6.35 +    .096
## 2      fd  1 5.02 *    .025
## 3     vas  1   0.39    .530
## 4     bis  1   1.01    .314
## 5     age  1   0.14    .711
## 6     sex  1 4.94 *    .026
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model




## Power-264 (without Global Signal)





### Acute phase

![(\#fig:rpn-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/rpn-sparklines-acute-1.pdf) 



#### Density

![(\#fig:rpn-repmes-density)Integrated metric of density by group.](main_files/figure-latex/rpn-repmes-density-1.pdf) 

##### Likelihood Ratio Test of Fixed effects


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.88    .349
## 2         group  1      0.61    .435
## 3            fd  1 11.90 ***   <.001
## 4           vas  1      0.74    .390
## 5           bis  1      2.07    .150
## 6           age  1      0.95    .329
## 7           sex  1    4.29 *    .038
## 8 session:group  1      1.70    .192
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-density) Mixed Effects Model for Density.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & density \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.026 \\ 
  & (0.024) \\ 
  & \\ 
 groupSham & 0.012 \\ 
  & (0.028) \\ 
  & \\ 
 fd & 0.384$^{***}$ \\ 
  & (0.109) \\ 
  & \\ 
 sexF & $-$0.081$^{**}$ \\ 
  & (0.037) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.063$^{*}$ \\ 
  & (0.035) \\ 
  & \\ 
 Constant & 0.346$^{***}$ \\ 
  & (0.052) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 4,012.524 \\ 
Akaike Inf. Crit. & $-$8,003.047 \\ 
Bayesian Inf. Crit. & $-$7,941.581 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Strength

![(\#fig:rpn-repmes-strength)Integrated metric of strength by group.](main_files/figure-latex/rpn-repmes-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.83    .361
## 2         group  1      0.24    .627
## 3            fd  1 12.90 ***   <.001
## 4           vas  1      1.05    .306
## 5           bis  1      1.58    .208
## 6           age  1      1.24    .266
## 7           sex  1    3.65 +    .056
## 8 session:group  1      2.11    .146
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-strength) Mixed Effects Model for Strength.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & strength \\ 
\hline \\[-1.8ex] 
 sessionT1 & 3.925 \\ 
  & (3.355) \\ 
  & \\ 
 groupSham & 3.223 \\ 
  & (3.864) \\ 
  & \\ 
 fd & 55.535$^{***}$ \\ 
  & (15.101) \\ 
  & \\ 
 sexF & $-$10.013$^{**}$ \\ 
  & (5.040) \\ 
  & \\ 
 sessionT1:groupSham & $-$9.395$^{*}$ \\ 
  & (4.947) \\ 
  & \\ 
 Constant & 25.426$^{***}$ \\ 
  & (4.655) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & $-$4,142.405 \\ 
Akaike Inf. Crit. & 8,306.811 \\ 
Bayesian Inf. Crit. & 8,368.277 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Modularity

![(\#fig:rpn-repmes-mod)Integrated metric of modularity by group.](main_files/figure-latex/rpn-repmes-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      2.41    .120
## 2         group  1      0.52    .471
## 3            fd  1 12.23 ***   <.001
## 4           vas  1      0.52    .472
## 5           bis  1    5.67 *    .017
## 6           age  1      0.42    .518
## 7           sex  1   6.77 **    .009
## 8 session:group  1      0.19    .662
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-mod) mixed effects model for modularity.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & mod.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.002 \\ 
  & (0.018) \\ 
  & \\ 
 groupSham & 0.001 \\ 
  & (0.019) \\ 
  & \\ 
 fd & $-$0.253$^{***}$ \\ 
  & (0.076) \\ 
  & \\ 
 sexF & 0.066$^{***}$ \\ 
  & (0.024) \\ 
  & \\ 
 sessionT1:groupSham & 0.026 \\ 
  & (0.027) \\ 
  & \\ 
 Constant & 0.271$^{***}$ \\ 
  & (0.025) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 4,129.507 \\ 
Akaike Inf. Crit. & $-$8,237.015 \\ 
Bayesian Inf. Crit. & $-$8,175.549 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 


#### Number of hubs

![(\#fig:rpn-repmes-nhubs)Integrated metric of the number of hubs by group.](main_files/figure-latex/rpn-repmes-nhubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.11    .293
## 2         group  1    0.16    .691
## 3            fd  1 7.66 **    .006
## 4           vas  1    0.43    .514
## 5           bis  1    0.49    .482
## 6           age  1    2.61    .106
## 7           sex  1    0.00    .953
## 8 session:group  1  5.00 *    .025
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-nhubs) mixed effects model for number of hubs.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & num.hubs.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.526 \\ 
  & (0.973) \\ 
  & \\ 
 groupSham & 1.957$^{*}$ \\ 
  & (0.999) \\ 
  & \\ 
 fd & 9.221$^{***}$ \\ 
  & (3.580) \\ 
  & \\ 
 sexF & $-$0.390 \\ 
  & (0.973) \\ 
  & \\ 
 sessionT1:groupSham & $-$3.060$^{**}$ \\ 
  & (1.435) \\ 
  & \\ 
 Constant & 63.216$^{***}$ \\ 
  & (1.065) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & $-$5,172.866 \\ 
Akaike Inf. Crit. & 10,367.730 \\ 
Bayesian Inf. Crit. & 10,429.200 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency

![(\#fig:rpn-repmes-eglob)Integrated metric of global efficiency by group.](main_files/figure-latex/rpn-repmes-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.66    .417
## 2         group  1      0.81    .367
## 3            fd  1 13.93 ***   <.001
## 4           vas  1      0.57    .449
## 5           bis  1      2.09    .149
## 6           age  1      0.67    .414
## 7           sex  1    5.74 *    .017
## 8 session:group  1      1.69    .193
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-ge) mixed effects model for Global Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.016 \\ 
  & (0.015) \\ 
  & \\ 
 groupSham & 0.006 \\ 
  & (0.017) \\ 
  & \\ 
 fd & 0.252$^{***}$ \\ 
  & (0.066) \\ 
  & \\ 
 sexF & $-$0.055$^{**}$ \\ 
  & (0.022) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.038$^{*}$ \\ 
  & (0.022) \\ 
  & \\ 
 Constant & 0.631$^{***}$ \\ 
  & (0.033) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 4,741.636 \\ 
Akaike Inf. Crit. & $-$9,461.273 \\ 
Bayesian Inf. Crit. & $-$9,399.807 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency (weighted)

![(\#fig:rpn-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_files/figure-latex/rpn-repmes-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.70    .404
## 2         group  1      0.27    .600
## 3            fd  1 16.02 ***   <.001
## 4           vas  1      1.14    .287
## 5           bis  1      1.51    .219
## 6           age  1      0.79    .375
## 7           sex  1    5.33 *    .021
## 8 session:group  1      1.77    .184
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-gew) mixed effects model for Global Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.012 \\ 
  & (0.010) \\ 
  & \\ 
 groupSham & 0.008 \\ 
  & (0.011) \\ 
  & \\ 
 fd & 0.189$^{***}$ \\ 
  & (0.045) \\ 
  & \\ 
 sexF & $-$0.035$^{**}$ \\ 
  & (0.015) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.027$^{*}$ \\ 
  & (0.015) \\ 
  & \\ 
 Constant & 0.222$^{***}$ \\ 
  & (0.012) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 7,563.301 \\ 
Akaike Inf. Crit. & $-$15,104.600 \\ 
Bayesian Inf. Crit. & $-$15,043.140 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency

![(\#fig:rpn-repmes-eloc)Integrated metric of local efficiency by group.](main_files/figure-latex/rpn-repmes-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    0.41    .521
## 2         group  1    0.27    .602
## 3            fd  1 8.14 **    .004
## 4           vas  1    0.96    .328
## 5           bis  1    1.82    .177
## 6           age  1    0.66    .417
## 7           sex  1  3.45 +    .063
## 8 session:group  1    0.79    .375
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-eloc) mixed effects model for Local Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.009 \\ 
  & (0.009) \\ 
  & \\ 
 groupSham & 0.004 \\ 
  & (0.011) \\ 
  & \\ 
 fd & 0.120$^{***}$ \\ 
  & (0.041) \\ 
  & \\ 
 sexF & $-$0.027$^{*}$ \\ 
  & (0.014) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.018 \\ 
  & (0.013) \\ 
  & \\ 
 Constant & 0.798$^{***}$ \\ 
  & (0.014) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 5,737.665 \\ 
Akaike Inf. Crit. & $-$11,453.330 \\ 
Bayesian Inf. Crit. & $-$11,391.860 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency (weighted)

![(\#fig:rpn-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_files/figure-latex/rpn-repmes-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.23    .632
## 2         group  1      0.01    .924
## 3            fd  1 11.65 ***   <.001
## 4           vas  1      1.29    .257
## 5           bis  1      1.15    .283
## 6           age  1      0.57    .451
## 7           sex  1    4.19 *    .041
## 8 session:group  1      0.85    .356
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-elocw) mixed effects model for Local Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.011 \\ 
  & (0.010) \\ 
  & \\ 
 groupSham & 0.009 \\ 
  & (0.011) \\ 
  & \\ 
 fd & 0.162$^{***}$ \\ 
  & (0.045) \\ 
  & \\ 
 sexF & $-$0.030$^{**}$ \\ 
  & (0.014) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.020 \\ 
  & (0.015) \\ 
  & \\ 
 Constant & 0.288$^{***}$ \\ 
  & (0.014) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 6,666.545 \\ 
Akaike Inf. Crit. & $-$13,311.090 \\ 
Bayesian Inf. Crit. & $-$13,249.620 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

### Maintenance phase

![(\#fig:rpn-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/rpn-sparklines-long-1.pdf) 



#### Density

![(\#fig:rpn-repmesl-density)Integrated metric of density by session.](main_files/figure-latex/rpn-repmesl-density-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df    Chisq p.value
## 1 session  3     2.35    .503
## 2      fd  1   3.41 +    .065
## 3     vas  1   2.72 +    .099
## 4     bis  1  7.03 **    .008
## 5     age  1     0.06    .806
## 6     sex  1 10.74 **    .001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Strength

![(\#fig:rpn-repmesl-strength)Integrated metric of strength by session.](main_files/figure-latex/rpn-repmesl-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df    Chisq p.value
## 1 session  3     1.90    .593
## 2      fd  1   4.13 *    .042
## 3     vas  1   2.85 +    .092
## 4     bis  1   6.62 *    .010
## 5     age  1     0.14    .712
## 6     sex  1 10.52 **    .001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Modularity

![(\#fig:rpn-repmesl-mod)Integrated metric of modularity by session.](main_files/figure-latex/rpn-repmesl-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      5.64    .131
## 2      fd  1    4.92 *    .026
## 3     vas  1    5.51 *    .019
## 4     bis  1 10.84 ***   <.001
## 5     age  1    5.48 *    .019
## 6     sex  1 15.93 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Number of hubs

![(\#fig:rpn-repmesl-hubs)Integrated metric of number of hubs by session.](main_files/figure-latex/rpn-repmesl-hubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    1.85    .604
## 2      fd  1    0.34    .559
## 3     vas  1 7.21 **    .007
## 4     bis  1    1.77    .183
## 5     age  1  3.03 +    .082
## 6     sex  1    0.77    .381
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency

![(\#fig:rpn-repmesl-eglob)Integrated metric of global efficiency by session.](main_files/figure-latex/rpn-repmesl-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      3.11    .375
## 2      fd  1    4.62 *    .032
## 3     vas  1      1.46    .227
## 4     bis  1    3.55 +    .060
## 5     age  1      0.03    .867
## 6     sex  1 11.21 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency (weighted)

![(\#fig:rpn-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_files/figure-latex/rpn-repmesl-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      2.09    .554
## 2      fd  1    5.87 *    .015
## 3     vas  1      1.36    .243
## 4     bis  1      2.47    .116
## 5     age  1      0.10    .752
## 6     sex  1 11.67 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency

![(\#fig:rpn-repmesl-eloc)Integrated metric of local efficiency by session.](main_files/figure-latex/rpn-repmesl-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    3.06    .382
## 2      fd  1    1.54    .215
## 3     vas  1    1.01    .316
## 4     bis  1  4.16 *    .041
## 5     age  1    0.05    .828
## 6     sex  1 8.56 **    .003
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency (weighted)

![(\#fig:rpn-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_files/figure-latex/rpn-repmesl-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    1.45    .695
## 2      fd  1    1.79    .181
## 3     vas  1    0.52    .471
## 4     bis  1    1.35    .246
## 5     age  1    0.06    .810
## 6     sex  1 8.31 **    .004
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



## Gordon-333 (with Global Signal)





### Acute phase

![(\#fig:rgg-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/rgg-sparklines-acute-1.pdf) 



#### Density

![(\#fig:rgg-repmes-density)Integrated metric of density by group.](main_files/figure-latex/rgg-repmes-density-1.pdf) 

##### Likelihood Ratio Test of Fixed effects


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.38    .538
## 2         group  1      0.23    .630
## 3            fd  1 16.19 ***   <.001
## 4           vas  1      0.62    .430
## 5           bis  1      0.00    .951
## 6           age  1      1.42    .234
## 7           sex  1   7.44 **    .006
## 8 session:group  1      2.56    .109
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-density) Mixed Effects Model for Density.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & density \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.028 \\ 
  & (0.030) \\ 
  & \\ 
 groupSham & 0.029 \\ 
  & (0.026) \\ 
  & \\ 
 fd & 0.478$^{***}$ \\ 
  & (0.109) \\ 
  & \\ 
 sexF & $-$0.099$^{***}$ \\ 
  & (0.035) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.076$^{*}$ \\ 
  & (0.044) \\ 
  & \\ 
 Constant & 0.285$^{***}$ \\ 
  & (0.048) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 3,678.881 \\ 
Akaike Inf. Crit. & $-$7,335.762 \\ 
Bayesian Inf. Crit. & $-$7,274.296 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Strength

![(\#fig:rgg-repmes-strength)Integrated metric of strength by group.](main_files/figure-latex/rgg-repmes-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.03    .873
## 2         group  1      0.09    .766
## 3            fd  1 16.85 ***   <.001
## 4           vas  1      0.80    .371
## 5           bis  1      0.20    .652
## 6           age  1      1.54    .215
## 7           sex  1    5.82 *    .016
## 8 session:group  1      2.44    .118
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-strength) Mixed Effects Model for Strength.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & strength \\ 
\hline \\[-1.8ex] 
 sessionT1 & 5.881 \\ 
  & (5.044) \\ 
  & \\ 
 groupSham & 5.547 \\ 
  & (4.072) \\ 
  & \\ 
 fd & 77.563$^{***}$ \\ 
  & (17.469) \\ 
  & \\ 
 sexF & $-$13.668$^{**}$ \\ 
  & (5.639) \\ 
  & \\ 
 sessionT1:groupSham & $-$12.085 \\ 
  & (7.456) \\ 
  & \\ 
 Constant & 26.524$^{***}$ \\ 
  & (5.183) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & $-$4,973.383 \\ 
Akaike Inf. Crit. & 9,968.766 \\ 
Bayesian Inf. Crit. & 10,030.230 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Modularity

![(\#fig:rgg-repmes-mod)Integrated metric of modularity by group.](main_files/figure-latex/rgg-repmes-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      1.39    .239
## 2         group  1      0.16    .686
## 3            fd  1 16.39 ***   <.001
## 4           vas  1      0.40    .527
## 5           bis  1      0.45    .503
## 6           age  1      1.04    .308
## 7           sex  1   9.42 **    .002
## 8 session:group  1      1.76    .184
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-mod) mixed effects model for modularity.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & mod.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.010 \\ 
  & (0.024) \\ 
  & \\ 
 groupSham & $-$0.021 \\ 
  & (0.020) \\ 
  & \\ 
 fd & $-$0.372$^{***}$ \\ 
  & (0.084) \\ 
  & \\ 
 sexF & 0.084$^{***}$ \\ 
  & (0.026) \\ 
  & \\ 
 sessionT1:groupSham & 0.054 \\ 
  & (0.036) \\ 
  & \\ 
 Constant & 0.376$^{***}$ \\ 
  & (0.027) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 4,308.180 \\ 
Akaike Inf. Crit. & $-$8,594.361 \\ 
Bayesian Inf. Crit. & $-$8,532.895 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 


#### Number of hubs

![(\#fig:rgg-repmes-nhubs)Integrated metric of the number of hubs by group.](main_files/figure-latex/rgg-repmes-nhubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   0.01    .940
## 2         group  1   0.00    .948
## 3            fd  1   1.82    .177
## 4           vas  1   0.49    .484
## 5           bis  1   2.17    .141
## 6           age  1 3.00 +    .083
## 7           sex  1 3.47 +    .063
## 8 session:group  1 3.93 *    .047
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-nhubs) mixed effects model for number of hubs.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & num.hubs.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 1.324 \\ 
  & (1.053) \\ 
  & \\ 
 groupSham & 1.260 \\ 
  & (0.986) \\ 
  & \\ 
 fd & 5.174 \\ 
  & (4.028) \\ 
  & \\ 
 sexF & $-$1.825 \\ 
  & (1.201) \\ 
  & \\ 
 sessionT1:groupSham & $-$2.967$^{*}$ \\ 
  & (1.555) \\ 
  & \\ 
 Constant & 82.769$^{***}$ \\ 
  & (1.270) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & $-$5,740.450 \\ 
Akaike Inf. Crit. & 11,502.900 \\ 
Bayesian Inf. Crit. & 11,564.370 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency

![(\#fig:rgg-repmes-eglob)Integrated metric of global efficiency by group.](main_files/figure-latex/rgg-repmes-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.50    .480
## 2         group  1      0.47    .494
## 3            fd  1 18.06 ***   <.001
## 4           vas  1      0.68    .411
## 5           bis  1      0.00    .984
## 6           age  1      1.53    .217
## 7           sex  1  10.04 **    .002
## 8 session:group  1      2.59    .108
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-ge) mixed effects model for Global Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.017 \\ 
  & (0.019) \\ 
  & \\ 
 groupSham & 0.015 \\ 
  & (0.015) \\ 
  & \\ 
 fd & 0.303$^{***}$ \\ 
  & (0.065) \\ 
  & \\ 
 sexF & $-$0.067$^{***}$ \\ 
  & (0.020) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.047$^{*}$ \\ 
  & (0.028) \\ 
  & \\ 
 Constant & 0.601$^{***}$ \\ 
  & (0.030) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 5,289.933 \\ 
Akaike Inf. Crit. & $-$10,557.870 \\ 
Bayesian Inf. Crit. & $-$10,496.400 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency (weighted)

![(\#fig:rgg-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_files/figure-latex/rgg-repmes-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.06    .814
## 2         group  1      0.18    .669
## 3            fd  1 19.74 ***   <.001
## 4           vas  1      1.10    .294
## 5           bis  1      0.36    .550
## 6           age  1      1.35    .246
## 7           sex  1   8.95 **    .003
## 8 session:group  1      2.11    .146
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-gew) mixed effects model for Global Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.013 \\ 
  & (0.012) \\ 
  & \\ 
 groupSham & 0.011 \\ 
  & (0.010) \\ 
  & \\ 
 fd & 0.202$^{***}$ \\ 
  & (0.042) \\ 
  & \\ 
 sexF & $-$0.039$^{***}$ \\ 
  & (0.013) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.027 \\ 
  & (0.018) \\ 
  & \\ 
 Constant & 0.219$^{***}$ \\ 
  & (0.011) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 8,348.674 \\ 
Akaike Inf. Crit. & $-$16,675.350 \\ 
Bayesian Inf. Crit. & $-$16,613.880 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency

![(\#fig:rgg-repmes-eloc)Integrated metric of local efficiency by group.](main_files/figure-latex/rgg-repmes-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.02    .897
## 2         group  1      0.02    .888
## 3            fd  1 11.50 ***   <.001
## 4           vas  1      0.73    .392
## 5           bis  1      0.36    .551
## 6           age  1      1.25    .263
## 7           sex  1    5.14 *    .023
## 8 session:group  1      1.71    .192
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-eloc) mixed effects model for Local Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.009 \\ 
  & (0.010) \\ 
  & \\ 
 groupSham & 0.010 \\ 
  & (0.009) \\ 
  & \\ 
 fd & 0.132$^{***}$ \\ 
  & (0.037) \\ 
  & \\ 
 sexF & $-$0.026$^{**}$ \\ 
  & (0.012) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.019 \\ 
  & (0.015) \\ 
  & \\ 
 Constant & 0.783$^{***}$ \\ 
  & (0.012) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 5,106.987 \\ 
Akaike Inf. Crit. & $-$10,191.970 \\ 
Bayesian Inf. Crit. & $-$10,130.510 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency (weighted)

![(\#fig:rgg-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_files/figure-latex/rgg-repmes-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.16    .686
## 2         group  1      0.01    .930
## 3            fd  1 12.43 ***   <.001
## 4           vas  1      0.94    .333
## 5           bis  1      1.29    .255
## 6           age  1      0.62    .430
## 7           sex  1    5.21 *    .022
## 8 session:group  1      0.94    .332
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-elocw) mixed effects model for Local Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.010 \\ 
  & (0.010) \\ 
  & \\ 
 groupSham & 0.010 \\ 
  & (0.009) \\ 
  & \\ 
 fd & 0.140$^{***}$ \\ 
  & (0.037) \\ 
  & \\ 
 sexF & $-$0.025$^{**}$ \\ 
  & (0.012) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.014 \\ 
  & (0.015) \\ 
  & \\ 
 Constant & 0.302$^{***}$ \\ 
  & (0.013) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 6,382.960 \\ 
Akaike Inf. Crit. & $-$12,743.920 \\ 
Bayesian Inf. Crit. & $-$12,682.450 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

### Maintenance phase

![(\#fig:rgg-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/rgg-sparklines-long-1.pdf) 



#### Density

![(\#fig:rgg-repmesl-density)Integrated metric of density by session.](main_files/figure-latex/rgg-repmesl-density-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    2.84    .416
## 2      fd  1 8.44 **    .004
## 3     vas  1  4.65 *    .031
## 4     bis  1    0.53    .468
## 5     age  1    0.46    .499
## 6     sex  1 8.33 **    .004
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Strength

![(\#fig:rgg-repmesl-strength)Integrated metric of strength by session.](main_files/figure-latex/rgg-repmesl-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    2.57    .462
## 2      fd  1 6.76 **    .009
## 3     vas  1  3.90 *    .048
## 4     bis  1    0.01    .939
## 5     age  1    0.08    .777
## 6     sex  1  4.69 *    .030
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Modularity

![(\#fig:rgg-repmesl-mod)Integrated metric of modularity by session.](main_files/figure-latex/rgg-repmesl-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      0.36    .949
## 2      fd  1    4.45 *    .035
## 3     vas  1      1.63    .201
## 4     bis  1      0.88    .348
## 5     age  1      0.78    .376
## 6     sex  1 12.22 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Number of hubs

![(\#fig:rgg-repmesl-hubs)Integrated metric of number of hubs by session.](main_files/figure-latex/rgg-repmesl-hubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    6.21    .102
## 2      fd  1    1.04    .307
## 3     vas  1    0.35    .551
## 4     bis  1    0.26    .610
## 5     age  1    2.66    .103
## 6     sex  1 6.96 **    .008
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency

![(\#fig:rgg-repmesl-eglob)Integrated metric of global efficiency by session.](main_files/figure-latex/rgg-repmesl-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      2.23    .526
## 2      fd  1   6.99 **    .008
## 3     vas  1    2.90 +    .089
## 4     bis  1      0.40    .527
## 5     age  1      0.06    .811
## 6     sex  1 10.95 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency (weighted)

![(\#fig:rgg-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_files/figure-latex/rgg-repmesl-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    2.42    .489
## 2      fd  1  6.38 *    .012
## 3     vas  1    1.92    .166
## 4     bis  1    0.01    .908
## 5     age  1    0.01    .911
## 6     sex  1 7.82 **    .005
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency

![(\#fig:rgg-repmesl-eloc)Integrated metric of local efficiency by session.](main_files/figure-latex/rgg-repmesl-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df  Chisq p.value
## 1 session  3   2.71    .439
## 2      fd  1 3.62 +    .057
## 3     vas  1   2.42    .120
## 4     bis  1   0.13    .713
## 5     age  1   0.13    .722
## 6     sex  1   2.53    .112
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency (weighted)

![(\#fig:rgg-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_files/figure-latex/rgg-repmesl-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df  Chisq p.value
## 1 session  3   3.39    .336
## 2      fd  1 2.99 +    .084
## 3     vas  1   1.31    .253
## 4     bis  1   1.16    .282
## 5     age  1   0.07    .789
## 6     sex  1   2.41    .120
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



## Gordon-333 (without Global Signal)





### Acute phase

![(\#fig:rgn-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/rgn-sparklines-acute-1.pdf) 



#### Density

![(\#fig:rgn-repmes-density)Integrated metric of density by group.](main_files/figure-latex/rgn-repmes-density-1.pdf) 

##### Likelihood Ratio Test of Fixed effects


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.60    .207
## 2         group  1    0.97    .325
## 3            fd  1 8.27 **    .004
## 4           vas  1    0.28    .599
## 5           bis  1  3.50 +    .061
## 6           age  1    0.88    .349
## 7           sex  1  5.45 *    .020
## 8 session:group  1    1.48    .224
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-density) Mixed Effects Model for Density.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & density \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.023 \\ 
  & (0.030) \\ 
  & \\ 
 groupSham & 0.007 \\ 
  & (0.036) \\ 
  & \\ 
 fd & 0.392$^{***}$ \\ 
  & (0.139) \\ 
  & \\ 
 sexF & $-$0.115$^{**}$ \\ 
  & (0.047) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.075$^{*}$ \\ 
  & (0.044) \\ 
  & \\ 
 Constant & 0.477$^{***}$ \\ 
  & (0.055) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 3,474.742 \\ 
Akaike Inf. Crit. & $-$6,927.483 \\ 
Bayesian Inf. Crit. & $-$6,866.017 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Strength

![(\#fig:rgn-repmes-strength)Integrated metric of strength by group.](main_files/figure-latex/rgn-repmes-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.60    .205
## 2         group  1    0.38    .537
## 3            fd  1 9.56 **    .002
## 4           vas  1    0.55    .456
## 5           bis  1  2.86 +    .091
## 6           age  1    1.03    .309
## 7           sex  1  4.22 *    .040
## 8 session:group  1    1.91    .167
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-strength) Mixed Effects Model for Strength.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & strength \\ 
\hline \\[-1.8ex] 
 sessionT1 & 5.541 \\ 
  & (6.047) \\ 
  & \\ 
 groupSham & 4.553 \\ 
  & (7.524) \\ 
  & \\ 
 fd & 88.440$^{***}$ \\ 
  & (28.434) \\ 
  & \\ 
 sexF & $-$20.566$^{**}$ \\ 
  & (9.530) \\ 
  & \\ 
 sessionT1:groupSham & $-$16.715$^{*}$ \\ 
  & (8.909) \\ 
  & \\ 
 Constant & 54.151$^{***}$ \\ 
  & (8.324) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & $-$4,777.534 \\ 
Akaike Inf. Crit. & 9,577.067 \\ 
Bayesian Inf. Crit. & 9,638.533 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Modularity

![(\#fig:rgn-repmes-mod)Integrated metric of modularity by group.](main_files/figure-latex/rgn-repmes-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1  2.97 +    .085
## 2         group  1    0.84    .360
## 3            fd  1 8.49 **    .004
## 4           vas  1    0.10    .753
## 5           bis  1  5.59 *    .018
## 6           age  1    1.60    .206
## 7           sex  1 6.71 **    .010
## 8 session:group  1    0.91    .341
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-mod) mixed effects model for modularity.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & mod.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.003 \\ 
  & (0.019) \\ 
  & \\ 
 groupSham & $-$0.004 \\ 
  & (0.020) \\ 
  & \\ 
 fd & $-$0.216$^{***}$ \\ 
  & (0.081) \\ 
  & \\ 
 sexF & 0.070$^{***}$ \\ 
  & (0.026) \\ 
  & \\ 
 sessionT1:groupSham & 0.040 \\ 
  & (0.029) \\ 
  & \\ 
 Constant & 0.230$^{***}$ \\ 
  & (0.024) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 4,323.072 \\ 
Akaike Inf. Crit. & $-$8,624.144 \\ 
Bayesian Inf. Crit. & $-$8,562.678 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 


#### Number of hubs

![(\#fig:rgn-repmes-nhubs)Integrated metric of the number of hubs by group.](main_files/figure-latex/rgn-repmes-nhubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   0.00    .984
## 2         group  1   1.05    .304
## 3            fd  1 6.50 *    .011
## 4           vas  1   0.00    .982
## 5           bis  1   0.07    .786
## 6           age  1   0.41    .524
## 7           sex  1   0.20    .657
## 8 session:group  1   2.03    .154
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-nhubs) mixed effects model for number of hubs.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & num.hubs.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 1.528 \\ 
  & (1.336) \\ 
  & \\ 
 groupSham & 2.461$^{*}$ \\ 
  & (1.456) \\ 
  & \\ 
 fd & 14.668$^{***}$ \\ 
  & (5.549) \\ 
  & \\ 
 sexF & $-$0.583 \\ 
  & (1.637) \\ 
  & \\ 
 sessionT1:groupSham & $-$2.898 \\ 
  & (1.969) \\ 
  & \\ 
 Constant & 83.138$^{***}$ \\ 
  & (1.650) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & $-$5,764.835 \\ 
Akaike Inf. Crit. & 11,551.670 \\ 
Bayesian Inf. Crit. & 11,613.140 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency

![(\#fig:rgn-repmes-eglob)Integrated metric of global efficiency by group.](main_files/figure-latex/rgn-repmes-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.47    .226
## 2         group  1    1.28    .258
## 3            fd  1 9.01 **    .003
## 4           vas  1    0.28    .600
## 5           bis  1  3.68 +    .055
## 6           age  1    1.07    .302
## 7           sex  1  6.31 *    .012
## 8 session:group  1    1.52    .218
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-ge) mixed effects model for Global Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.013 \\ 
  & (0.017) \\ 
  & \\ 
 groupSham & 0.002 \\ 
  & (0.019) \\ 
  & \\ 
 fd & 0.220$^{***}$ \\ 
  & (0.075) \\ 
  & \\ 
 sexF & $-$0.066$^{***}$ \\ 
  & (0.025) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.042$^{*}$ \\ 
  & (0.024) \\ 
  & \\ 
 Constant & 0.716$^{***}$ \\ 
  & (0.030) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 4,558.388 \\ 
Akaike Inf. Crit. & $-$9,094.776 \\ 
Bayesian Inf. Crit. & $-$9,033.310 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency (weighted)

![(\#fig:rgn-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_files/figure-latex/rgn-repmes-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      1.35    .244
## 2         group  1      0.37    .546
## 3            fd  1 11.43 ***   <.001
## 4           vas  1      0.58    .447
## 5           bis  1    2.77 +    .096
## 6           age  1      1.05    .306
## 7           sex  1    5.13 *    .024
## 8 session:group  1      1.70    .192
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-gew) mixed effects model for Global Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.012 \\ 
  & (0.013) \\ 
  & \\ 
 groupSham & 0.010 \\ 
  & (0.016) \\ 
  & \\ 
 fd & 0.208$^{***}$ \\ 
  & (0.061) \\ 
  & \\ 
 sexF & $-$0.047$^{**}$ \\ 
  & (0.020) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.035$^{*}$ \\ 
  & (0.020) \\ 
  & \\ 
 Constant & 0.284$^{***}$ \\ 
  & (0.017) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 8,965.735 \\ 
Akaike Inf. Crit. & $-$17,909.470 \\ 
Bayesian Inf. Crit. & $-$17,848.000 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency

![(\#fig:rgn-repmes-eloc)Integrated metric of local efficiency by group.](main_files/figure-latex/rgn-repmes-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   0.94    .333
## 2         group  1   0.74    .390
## 3            fd  1 6.39 *    .011
## 4           vas  1   0.33    .563
## 5           bis  1 2.84 +    .092
## 6           age  1   0.88    .348
## 7           sex  1 4.41 *    .036
## 8 session:group  1   0.78    .377
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-eloc) mixed effects model for Local Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.007 \\ 
  & (0.010) \\ 
  & \\ 
 groupSham & 0.001 \\ 
  & (0.012) \\ 
  & \\ 
 fd & 0.111$^{**}$ \\ 
  & (0.044) \\ 
  & \\ 
 sexF & $-$0.033$^{**}$ \\ 
  & (0.015) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.019 \\ 
  & (0.014) \\ 
  & \\ 
 Constant & 0.845$^{***}$ \\ 
  & (0.015) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 5,786.915 \\ 
Akaike Inf. Crit. & $-$11,551.830 \\ 
Bayesian Inf. Crit. & $-$11,490.360 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency (weighted)

![(\#fig:rgn-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_files/figure-latex/rgn-repmes-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    0.75    .388
## 2         group  1    0.06    .813
## 3            fd  1 9.16 **    .002
## 4           vas  1    0.55    .458
## 5           bis  1    1.98    .159
## 6           age  1    0.73    .394
## 7           sex  1  3.74 +    .053
## 8 session:group  1    0.78    .378
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-elocw) mixed effects model for Local Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.008 \\ 
  & (0.011) \\ 
  & \\ 
 groupSham & 0.008 \\ 
  & (0.014) \\ 
  & \\ 
 fd & 0.164$^{***}$ \\ 
  & (0.052) \\ 
  & \\ 
 sexF & $-$0.034$^{**}$ \\ 
  & (0.017) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.022 \\ 
  & (0.017) \\ 
  & \\ 
 Constant & 0.352$^{***}$ \\ 
  & (0.016) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 6,368.903 \\ 
Akaike Inf. Crit. & $-$12,715.810 \\ 
Bayesian Inf. Crit. & $-$12,654.340 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

### Maintenance phase

![(\#fig:rgn-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/rgn-sparklines-long-1.pdf) 



#### Density

![(\#fig:rgn-repmesl-density)Integrated metric of density by session.](main_files/figure-latex/rgn-repmesl-density-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      3.36    .339
## 2      fd  1    2.99 +    .084
## 3     vas  1      1.92    .166
## 4     bis  1 11.67 ***   <.001
## 5     age  1      1.02    .313
## 6     sex  1 16.01 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Strength

![(\#fig:rgn-repmesl-strength)Integrated metric of strength by session.](main_files/figure-latex/rgn-repmesl-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      2.13    .545
## 2      fd  1      2.31    .129
## 3     vas  1    2.81 +    .093
## 4     bis  1 11.89 ***   <.001
## 5     age  1      0.18    .672
## 6     sex  1 13.45 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Modularity

![(\#fig:rgn-repmesl-mod)Integrated metric of modularity by session.](main_files/figure-latex/rgn-repmesl-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df    Chisq p.value
## 1 session  3     3.35    .340
## 2      fd  1   3.30 +    .069
## 3     vas  1     0.00   >.999
## 4     bis  1 10.07 **    .002
## 5     age  1     0.54    .463
## 6     sex  1   6.26 *    .012
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Number of hubs

![(\#fig:rgn-repmesl-hubs)Integrated metric of number of hubs by session.](main_files/figure-latex/rgn-repmesl-hubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    4.33    .228
## 2      fd  1    0.02    .874
## 3     vas  1  4.84 *    .028
## 4     bis  1    0.09    .768
## 5     age  1    0.11    .741
## 6     sex  1 8.40 **    .004
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency

![(\#fig:rgn-repmesl-eglob)Integrated metric of global efficiency by session.](main_files/figure-latex/rgn-repmesl-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      5.98    .113
## 2      fd  1   7.13 **    .008
## 3     vas  1    2.88 +    .090
## 4     bis  1   9.92 **    .002
## 5     age  1      2.59    .108
## 6     sex  1 13.38 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency (weighted)

![(\#fig:rgn-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_files/figure-latex/rgn-repmesl-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df    Chisq p.value
## 1 session  3     1.99    .574
## 2      fd  1   3.25 +    .072
## 3     vas  1     2.33    .127
## 4     bis  1  7.95 **    .005
## 5     age  1     0.07    .792
## 6     sex  1 10.72 **    .001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency

![(\#fig:rgn-repmesl-eloc)Integrated metric of local efficiency by session.](main_files/figure-latex/rgn-repmesl-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      2.33    .507
## 2      fd  1      0.47    .495
## 3     vas  1      1.62    .202
## 4     bis  1    6.34 *    .012
## 5     age  1      0.21    .645
## 6     sex  1 12.01 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency (weighted)

![(\#fig:rgn-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_files/figure-latex/rgn-repmesl-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    1.36    .714
## 2      fd  1    1.76    .185
## 3     vas  1    1.35    .245
## 4     bis  1  4.57 *    .033
## 5     age  1    0.00    .976
## 6     sex  1 9.87 **    .002
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



## Schaefer-100 (with Global Signal)





### Acute phase

![(\#fig:rs1g-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/rs1g-sparklines-acute-1.pdf) 



#### Density

![(\#fig:rs1g-repmes-density)Integrated metric of density by group.](main_files/figure-latex/rs1g-repmes-density-1.pdf) 

##### Likelihood Ratio Test of Fixed effects


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.91    .340
## 2         group  1      0.19    .664
## 3            fd  1 12.51 ***   <.001
## 4           vas  1      0.08    .775
## 5           bis  1      0.29    .587
## 6           age  1      0.34    .562
## 7           sex  1   7.87 **    .005
## 8 session:group  1      2.33    .127
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-density) Mixed Effects Model for Density.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & density \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.027 \\ 
  & (0.041) \\ 
  & \\ 
 groupSham & 0.035 \\ 
  & (0.040) \\ 
  & \\ 
 fd & 0.632$^{***}$ \\ 
  & (0.165) \\ 
  & \\ 
 sexF & $-$0.160$^{***}$ \\ 
  & (0.054) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.102$^{*}$ \\ 
  & (0.061) \\ 
  & \\ 
 Constant & 0.410$^{***}$ \\ 
  & (0.055) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 3,184.637 \\ 
Akaike Inf. Crit. & $-$6,347.273 \\ 
Bayesian Inf. Crit. & $-$6,285.807 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Strength

![(\#fig:rs1g-repmes-strength)Integrated metric of strength by group.](main_files/figure-latex/rs1g-repmes-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.21    .649
## 2         group  1      0.02    .886
## 3            fd  1 11.81 ***   <.001
## 4           vas  1      0.08    .772
## 5           bis  1      0.04    .833
## 6           age  1      0.54    .464
## 7           sex  1    5.38 *    .020
## 8 session:group  1    3.00 +    .083
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-strength) Mixed Effects Model for Strength.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & strength \\ 
\hline \\[-1.8ex] 
 sessionT1 & 2.691 \\ 
  & (2.423) \\ 
  & \\ 
 groupSham & 3.155 \\ 
  & (2.374) \\ 
  & \\ 
 fd & 35.828$^{***}$ \\ 
  & (9.719) \\ 
  & \\ 
 sexF & $-$7.901$^{**}$ \\ 
  & (3.283) \\ 
  & \\ 
 sessionT1:groupSham & $-$6.587$^{*}$ \\ 
  & (3.578) \\ 
  & \\ 
 Constant & 14.566$^{***}$ \\ 
  & (2.702) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & $-$2,931.827 \\ 
Akaike Inf. Crit. & 5,885.653 \\ 
Bayesian Inf. Crit. & 5,947.119 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Modularity

![(\#fig:rs1g-repmes-mod)Integrated metric of modularity by group.](main_files/figure-latex/rs1g-repmes-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      1.44    .231
## 2         group  1      0.27    .603
## 3            fd  1 14.29 ***   <.001
## 4           vas  1      0.26    .608
## 5           bis  1      0.94    .332
## 6           age  1      0.48    .488
## 7           sex  1  10.38 **    .001
## 8 session:group  1      2.20    .138
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-mod) mixed effects model for modularity.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & mod.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.016 \\ 
  & (0.027) \\ 
  & \\ 
 groupSham & $-$0.022 \\ 
  & (0.024) \\ 
  & \\ 
 fd & $-$0.420$^{***}$ \\ 
  & (0.102) \\ 
  & \\ 
 sexF & 0.110$^{***}$ \\ 
  & (0.032) \\ 
  & \\ 
 sessionT1:groupSham & 0.069$^{*}$ \\ 
  & (0.040) \\ 
  & \\ 
 Constant & 0.359$^{***}$ \\ 
  & (0.030) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 4,507.891 \\ 
Akaike Inf. Crit. & $-$8,993.782 \\ 
Bayesian Inf. Crit. & $-$8,932.316 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 


#### Number of hubs

![(\#fig:rs1g-repmes-nhubs)Integrated metric of the number of hubs by group.](main_files/figure-latex/rs1g-repmes-nhubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df Chisq p.value
## 1       session  1  0.55    .459
## 2         group  1  1.88    .170
## 3            fd  1  2.15    .143
## 4           vas  1  1.12    .290
## 5           bis  1  0.09    .760
## 6           age  1  1.02    .312
## 7           sex  1  0.59    .442
## 8 session:group  1  0.14    .709
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-nhubs) mixed effects model for number of hubs.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & num.hubs.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.351 \\ 
  & (0.666) \\ 
  & \\ 
 groupSham & 0.690 \\ 
  & (0.613) \\ 
  & \\ 
 fd & 3.204 \\ 
  & (2.133) \\ 
  & \\ 
 sexF & $-$0.539 \\ 
  & (0.556) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.232 \\ 
  & (0.982) \\ 
  & \\ 
 Constant & 24.828$^{***}$ \\ 
  & (0.662) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & $-$4,157.013 \\ 
Akaike Inf. Crit. & 8,336.025 \\ 
Bayesian Inf. Crit. & 8,397.491 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency

![(\#fig:rs1g-repmes-eglob)Integrated metric of global efficiency by group.](main_files/figure-latex/rs1g-repmes-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      1.04    .309
## 2         group  1      0.29    .593
## 3            fd  1 13.90 ***   <.001
## 4           vas  1      0.05    .821
## 5           bis  1      0.29    .590
## 6           age  1      0.28    .596
## 7           sex  1   9.42 **    .002
## 8 session:group  1      2.26    .133
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-ge) mixed effects model for Global Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.014 \\ 
  & (0.025) \\ 
  & \\ 
 groupSham & 0.018 \\ 
  & (0.023) \\ 
  & \\ 
 fd & 0.384$^{***}$ \\ 
  & (0.095) \\ 
  & \\ 
 sexF & $-$0.098$^{***}$ \\ 
  & (0.030) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.060 \\ 
  & (0.037) \\ 
  & \\ 
 Constant & 0.681$^{***}$ \\ 
  & (0.032) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 4,526.843 \\ 
Akaike Inf. Crit. & $-$9,031.686 \\ 
Bayesian Inf. Crit. & $-$8,970.220 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency (weighted)

![(\#fig:rs1g-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_files/figure-latex/rs1g-repmes-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.18    .675
## 2         group  1      0.06    .812
## 3            fd  1 12.95 ***   <.001
## 4           vas  1      0.07    .788
## 5           bis  1      0.00    .962
## 6           age  1      0.46    .499
## 7           sex  1   6.73 **    .009
## 8 session:group  1    2.85 +    .091
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-gew) mixed effects model for Global Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.020 \\ 
  & (0.019) \\ 
  & \\ 
 groupSham & 0.022 \\ 
  & (0.017) \\ 
  & \\ 
 fd & 0.279$^{***}$ \\ 
  & (0.072) \\ 
  & \\ 
 sexF & $-$0.064$^{***}$ \\ 
  & (0.024) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.049$^{*}$ \\ 
  & (0.028) \\ 
  & \\ 
 Constant & 0.280$^{***}$ \\ 
  & (0.019) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 9,003.502 \\ 
Akaike Inf. Crit. & $-$17,985.010 \\ 
Bayesian Inf. Crit. & $-$17,923.540 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency

![(\#fig:rs1g-repmes-eloc)Integrated metric of local efficiency by group.](main_files/figure-latex/rs1g-repmes-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    0.27    .605
## 2         group  1    0.00    .977
## 3            fd  1 8.65 **    .003
## 4           vas  1    0.01    .940
## 5           bis  1    0.29    .593
## 6           age  1    0.53    .465
## 7           sex  1  3.95 *    .047
## 8 session:group  1    2.13    .145
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-eloc) mixed effects model for Local Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.009 \\ 
  & (0.010) \\ 
  & \\ 
 groupSham & 0.012 \\ 
  & (0.011) \\ 
  & \\ 
 fd & 0.135$^{***}$ \\ 
  & (0.043) \\ 
  & \\ 
 sexF & $-$0.030$^{**}$ \\ 
  & (0.014) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.023 \\ 
  & (0.015) \\ 
  & \\ 
 Constant & 0.841$^{***}$ \\ 
  & (0.013) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 5,009.594 \\ 
Akaike Inf. Crit. & $-$9,997.188 \\ 
Bayesian Inf. Crit. & $-$9,935.722 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency (weighted)

![(\#fig:rs1g-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_files/figure-latex/rs1g-repmes-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    0.07    .795
## 2         group  1    0.02    .901
## 3            fd  1 8.49 **    .004
## 4           vas  1    0.00    .948
## 5           bis  1    0.06    .799
## 6           age  1    0.46    .496
## 7           sex  1  3.15 +    .076
## 8 session:group  1    2.40    .122
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-elocw) mixed effects model for Local Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.017 \\ 
  & (0.014) \\ 
  & \\ 
 groupSham & 0.019 \\ 
  & (0.013) \\ 
  & \\ 
 fd & 0.168$^{***}$ \\ 
  & (0.054) \\ 
  & \\ 
 sexF & $-$0.033$^{*}$ \\ 
  & (0.018) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.031 \\ 
  & (0.020) \\ 
  & \\ 
 Constant & 0.363$^{***}$ \\ 
  & (0.016) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 5,744.490 \\ 
Akaike Inf. Crit. & $-$11,466.980 \\ 
Bayesian Inf. Crit. & $-$11,405.510 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

### Maintenance phase

![(\#fig:rs1g-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/rs1g-sparklines-long-1.pdf) 



#### Density

![(\#fig:rs1g-repmesl-density)Integrated metric of density by session.](main_files/figure-latex/rs1g-repmesl-density-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    2.54    .468
## 2      fd  1  6.26 *    .012
## 3     vas  1 7.79 **    .005
## 4     bis  1    2.28    .131
## 5     age  1    1.07    .300
## 6     sex  1 8.76 **    .003
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Strength

![(\#fig:rs1g-repmesl-strength)Integrated metric of strength by session.](main_files/figure-latex/rs1g-repmesl-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df    Chisq p.value
## 1 session  3     3.95    .267
## 2      fd  1  9.33 **    .002
## 3     vas  1 10.54 **    .001
## 4     bis  1     0.78    .377
## 5     age  1     2.56    .109
## 6     sex  1  8.30 **    .004
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Modularity

![(\#fig:rs1g-repmesl-mod)Integrated metric of modularity by session.](main_files/figure-latex/rs1g-repmesl-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      0.37    .945
## 2      fd  1    4.94 *    .026
## 3     vas  1      2.26    .133
## 4     bis  1      1.70    .192
## 5     age  1      0.65    .420
## 6     sex  1 11.95 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Number of hubs

![(\#fig:rs1g-repmesl-hubs)Integrated metric of number of hubs by session.](main_files/figure-latex/rs1g-repmesl-hubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df  Chisq p.value
## 1 session  3   1.75    .626
## 2      fd  1   0.71    .401
## 3     vas  1   0.09    .759
## 4     bis  1   0.24    .626
## 5     age  1   0.65    .421
## 6     sex  1 4.44 *    .035
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency

![(\#fig:rs1g-repmesl-eglob)Integrated metric of global efficiency by session.](main_files/figure-latex/rs1g-repmesl-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df    Chisq p.value
## 1 session  3     2.23    .525
## 2      fd  1   6.32 *    .012
## 3     vas  1   6.43 *    .011
## 4     bis  1     2.13    .144
## 5     age  1     0.81    .369
## 6     sex  1 10.82 **    .001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency (weighted)

![(\#fig:rs1g-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_files/figure-latex/rs1g-repmesl-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      3.88    .275
## 2      fd  1   9.08 **    .003
## 3     vas  1   8.91 **    .003
## 4     bis  1      0.28    .598
## 5     age  1      1.76    .184
## 6     sex  1 11.06 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency

![(\#fig:rs1g-repmesl-eloc)Integrated metric of local efficiency by session.](main_files/figure-latex/rs1g-repmesl-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      4.08    .253
## 2      fd  1   8.37 **    .004
## 3     vas  1 11.64 ***   <.001
## 4     bis  1      1.44    .231
## 5     age  1    2.98 +    .084
## 6     sex  1   6.80 **    .009
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency (weighted)

![(\#fig:rs1g-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_files/figure-latex/rs1g-repmesl-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    4.71    .195
## 2      fd  1  4.37 *    .037
## 3     vas  1 9.66 **    .002
## 4     bis  1    1.19    .276
## 5     age  1    0.08    .783
## 6     sex  1 7.08 **    .008
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



## Schaefer-100 (without Global Signal)





### Acute phase

![(\#fig:rs1n-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/rs1n-sparklines-acute-1.pdf) 



#### Density

![(\#fig:rs1n-repmes-density)Integrated metric of density by group.](main_files/figure-latex/rs1n-repmes-density-1.pdf) 

##### Likelihood Ratio Test of Fixed effects


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.65    .200
## 2         group  1    0.83    .363
## 3            fd  1 7.85 **    .005
## 4           vas  1    0.00    .946
## 5           bis  1  4.88 *    .027
## 6           age  1    0.24    .623
## 7           sex  1 6.77 **    .009
## 8 session:group  1    1.25    .264
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-density) Mixed Effects Model for Density.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & density \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.018 \\ 
  & (0.035) \\ 
  & \\ 
 groupSham & 0.005 \\ 
  & (0.040) \\ 
  & \\ 
 fd & 0.405$^{***}$ \\ 
  & (0.156) \\ 
  & \\ 
 sexF & $-$0.138$^{***}$ \\ 
  & (0.051) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.079 \\ 
  & (0.051) \\ 
  & \\ 
 Constant & 0.685$^{***}$ \\ 
  & (0.051) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 2,568.305 \\ 
Akaike Inf. Crit. & $-$5,114.610 \\ 
Bayesian Inf. Crit. & $-$5,053.144 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Strength

![(\#fig:rs1n-repmes-strength)Integrated metric of strength by group.](main_files/figure-latex/rs1n-repmes-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.66    .197
## 2         group  1    0.36    .549
## 3            fd  1 8.62 **    .003
## 4           vas  1    0.06    .804
## 5           bis  1  4.57 *    .033
## 6           age  1    0.35    .554
## 7           sex  1  4.80 *    .028
## 8 session:group  1    1.90    .168
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-strength) Mixed Effects Model for Strength.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & strength \\ 
\hline \\[-1.8ex] 
 sessionT1 & 2.320 \\ 
  & (2.745) \\ 
  & \\ 
 groupSham & 1.807 \\ 
  & (3.455) \\ 
  & \\ 
 fd & 36.623$^{***}$ \\ 
  & (13.003) \\ 
  & \\ 
 sexF & $-$9.981$^{**}$ \\ 
  & (4.397) \\ 
  & \\ 
 sessionT1:groupSham & $-$7.603$^{*}$ \\ 
  & (4.043) \\ 
  & \\ 
 Constant & 29.950$^{***}$ \\ 
  & (3.662) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & $-$3,414.662 \\ 
Akaike Inf. Crit. & 6,851.324 \\ 
Bayesian Inf. Crit. & 6,912.790 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Modularity

![(\#fig:rs1n-repmes-mod)Integrated metric of modularity by group.](main_files/figure-latex/rs1n-repmes-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1  3.03 +    .082
## 2         group  1    0.76    .382
## 3            fd  1 8.38 **    .004
## 4           vas  1    0.05    .824
## 5           bis  1  6.50 *    .011
## 6           age  1    0.55    .459
## 7           sex  1 8.71 **    .003
## 8 session:group  1    0.96    .327
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-mod) mixed effects model for modularity.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & mod.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.004 \\ 
  & (0.019) \\ 
  & \\ 
 groupSham & $-$0.003 \\ 
  & (0.020) \\ 
  & \\ 
 fd & $-$0.207$^{***}$ \\ 
  & (0.079) \\ 
  & \\ 
 sexF & 0.078$^{***}$ \\ 
  & (0.026) \\ 
  & \\ 
 sessionT1:groupSham & 0.041 \\ 
  & (0.028) \\ 
  & \\ 
 Constant & 0.183$^{***}$ \\ 
  & (0.023) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 4,581.613 \\ 
Akaike Inf. Crit. & $-$9,141.226 \\ 
Bayesian Inf. Crit. & $-$9,079.760 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 


#### Number of hubs

![(\#fig:rs1n-repmes-nhubs)Integrated metric of the number of hubs by group.](main_files/figure-latex/rs1n-repmes-nhubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   0.40    .526
## 2         group  1   1.73    .188
## 3            fd  1 4.51 *    .034
## 4           vas  1   2.12    .145
## 5           bis  1   1.12    .291
## 6           age  1   2.28    .131
## 7           sex  1   1.38    .241
## 8 session:group  1   0.89    .346
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-nhubs) mixed effects model for number of hubs.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & num.hubs.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.643 \\ 
  & (0.635) \\ 
  & \\ 
 groupSham & 0.286 \\ 
  & (0.598) \\ 
  & \\ 
 fd & $-$4.304$^{*}$ \\ 
  & (2.253) \\ 
  & \\ 
 sexF & 0.720 \\ 
  & (0.617) \\ 
  & \\ 
 sessionT1:groupSham & 0.808 \\ 
  & (0.937) \\ 
  & \\ 
 Constant & 27.345$^{***}$ \\ 
  & (0.631) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & $-$4,582.898 \\ 
Akaike Inf. Crit. & 9,187.796 \\ 
Bayesian Inf. Crit. & 9,249.262 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency

![(\#fig:rs1n-repmes-eglob)Integrated metric of global efficiency by group.](main_files/figure-latex/rs1n-repmes-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.59    .207
## 2         group  1    0.82    .364
## 3            fd  1 8.15 **    .004
## 4           vas  1    0.01    .904
## 5           bis  1  4.99 *    .025
## 6           age  1    0.26    .609
## 7           sex  1 6.89 **    .009
## 8 session:group  1    1.20    .273
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-ge) mixed effects model for Global Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.009 \\ 
  & (0.018) \\ 
  & \\ 
 groupSham & 0.002 \\ 
  & (0.021) \\ 
  & \\ 
 fd & 0.214$^{***}$ \\ 
  & (0.081) \\ 
  & \\ 
 sexF & $-$0.072$^{***}$ \\ 
  & (0.026) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.041 \\ 
  & (0.027) \\ 
  & \\ 
 Constant & 0.838$^{***}$ \\ 
  & (0.027) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 3,789.176 \\ 
Akaike Inf. Crit. & $-$7,556.351 \\ 
Bayesian Inf. Crit. & $-$7,494.885 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency (weighted)

![(\#fig:rs1n-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_files/figure-latex/rs1n-repmes-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.48    .225
## 2         group  1    0.22    .636
## 3            fd  1 9.20 **    .002
## 4           vas  1    0.05    .830
## 5           bis  1  4.50 *    .034
## 6           age  1    0.34    .557
## 7           sex  1  4.60 *    .032
## 8 session:group  1    1.96    .162
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-gew) mixed effects model for Global Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.018 \\ 
  & (0.020) \\ 
  & \\ 
 groupSham & 0.016 \\ 
  & (0.025) \\ 
  & \\ 
 fd & 0.277$^{***}$ \\ 
  & (0.094) \\ 
  & \\ 
 sexF & $-$0.071$^{**}$ \\ 
  & (0.032) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.056$^{*}$ \\ 
  & (0.030) \\ 
  & \\ 
 Constant & 0.392$^{***}$ \\ 
  & (0.026) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 10,042.250 \\ 
Akaike Inf. Crit. & $-$20,062.500 \\ 
Bayesian Inf. Crit. & $-$20,001.030 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency

![(\#fig:rs1n-repmes-eloc)Integrated metric of local efficiency by group.](main_files/figure-latex/rs1n-repmes-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   1.20    .274
## 2         group  1   0.48    .487
## 3            fd  1 6.41 *    .011
## 4           vas  1   0.01    .919
## 5           bis  1 5.20 *    .023
## 6           age  1   0.43    .513
## 7           sex  1 5.15 *    .023
## 8 session:group  1   0.96    .328
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-eloc) mixed effects model for Local Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.005 \\ 
  & (0.010) \\ 
  & \\ 
 groupSham & 0.003 \\ 
  & (0.011) \\ 
  & \\ 
 fd & 0.102$^{**}$ \\ 
  & (0.044) \\ 
  & \\ 
 sexF & $-$0.034$^{**}$ \\ 
  & (0.014) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.020 \\ 
  & (0.014) \\ 
  & \\ 
 Constant & 0.910$^{***}$ \\ 
  & (0.014) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 5,436.704 \\ 
Akaike Inf. Crit. & $-$10,851.410 \\ 
Bayesian Inf. Crit. & $-$10,789.940 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency (weighted)

![(\#fig:rs1n-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_files/figure-latex/rs1n-repmes-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.00    .316
## 2         group  1    0.05    .823
## 3            fd  1 8.11 **    .004
## 4           vas  1    0.03    .861
## 5           bis  1  4.20 *    .040
## 6           age  1    0.38    .536
## 7           sex  1  3.56 +    .059
## 8 session:group  1    1.69    .194
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-elocw) mixed effects model for Local Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.016 \\ 
  & (0.016) \\ 
  & \\ 
 groupSham & 0.016 \\ 
  & (0.021) \\ 
  & \\ 
 fd & 0.216$^{***}$ \\ 
  & (0.077) \\ 
  & \\ 
 sexF & $-$0.051$^{**}$ \\ 
  & (0.026) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.043$^{*}$ \\ 
  & (0.024) \\ 
  & \\ 
 Constant & 0.436$^{***}$ \\ 
  & (0.022) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 5,667.681 \\ 
Akaike Inf. Crit. & $-$11,313.360 \\ 
Bayesian Inf. Crit. & $-$11,251.900 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

### Maintenance phase

![(\#fig:rs1n-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/rs1n-sparklines-long-1.pdf) 



#### Density

![(\#fig:rs1n-repmesl-density)Integrated metric of density by session.](main_files/figure-latex/rs1n-repmesl-density-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    4.50    .212
## 2      fd  1    0.03    .855
## 3     vas  1    0.23    .632
## 4     bis  1 7.70 **    .006
## 5     age  1    0.67    .414
## 6     sex  1  4.63 *    .031
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Strength

![(\#fig:rs1n-repmesl-strength)Integrated metric of strength by session.](main_files/figure-latex/rs1n-repmesl-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3   11.00 *    .012
## 2      fd  1    3.72 +    .054
## 3     vas  1    2.77 +    .096
## 4     bis  1 21.37 ***   <.001
## 5     age  1    2.72 +    .099
## 6     sex  1   9.07 **    .003
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Modularity

![(\#fig:rs1n-repmesl-mod)Integrated metric of modularity by session.](main_files/figure-latex/rs1n-repmesl-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      2.89    .408
## 2      fd  1    4.17 *    .041
## 3     vas  1    3.30 +    .069
## 4     bis  1   9.50 **    .002
## 5     age  1      0.15    .701
## 6     sex  1 23.96 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Number of hubs

![(\#fig:rs1n-repmesl-hubs)Integrated metric of number of hubs by session.](main_files/figure-latex/rs1n-repmesl-hubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df  Chisq p.value
## 1 session  3   2.53    .470
## 2      fd  1 5.50 *    .019
## 3     vas  1   0.08    .776
## 4     bis  1   1.82    .177
## 5     age  1   1.28    .257
## 6     sex  1   0.13    .713
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency

![(\#fig:rs1n-repmesl-eglob)Integrated metric of global efficiency by session.](main_files/figure-latex/rs1n-repmesl-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    4.46    .216
## 2      fd  1    0.01    .930
## 3     vas  1    0.27    .604
## 4     bis  1 7.08 **    .008
## 5     age  1    0.57    .450
## 6     sex  1  3.09 +    .079
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency (weighted)

![(\#fig:rs1n-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_files/figure-latex/rs1n-repmesl-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3   10.21 *    .017
## 2      fd  1    4.80 *    .028
## 3     vas  1    6.59 *    .010
## 4     bis  1 20.40 ***   <.001
## 5     age  1    2.77 +    .096
## 6     sex  1   7.63 **    .006
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency

![(\#fig:rs1n-repmesl-eloc)Integrated metric of local efficiency by session.](main_files/figure-latex/rs1n-repmesl-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      4.34    .227
## 2      fd  1      1.07    .302
## 3     vas  1      0.29    .593
## 4     bis  1 10.97 ***   <.001
## 5     age  1      0.66    .415
## 6     sex  1    6.04 *    .014
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency (weighted)

![(\#fig:rs1n-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_files/figure-latex/rs1n-repmesl-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      3.42    .331
## 2      fd  1      0.00   >.999
## 3     vas  1      1.89    .169
## 4     bis  1 15.23 ***   <.001
## 5     age  1      0.00   >.999
## 6     sex  1      0.00   >.999
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



## Schaefer-200 (with Global Signal)





### Acute phase

![(\#fig:rs2g-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/rs2g-sparklines-acute-1.pdf) 



#### Density

![(\#fig:rs2g-repmes-density)Integrated metric of density by group.](main_files/figure-latex/rs2g-repmes-density-1.pdf) 

##### Likelihood Ratio Test of Fixed effects


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.66    .415
## 2         group  1      0.21    .645
## 3            fd  1 12.74 ***   <.001
## 4           vas  1      0.14    .709
## 5           bis  1      0.13    .719
## 6           age  1      0.59    .441
## 7           sex  1   7.53 **    .006
## 8 session:group  1      2.45    .118
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-density) Mixed Effects Model for Density.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & density \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.028 \\ 
  & (0.037) \\ 
  & \\ 
 groupSham & 0.032 \\ 
  & (0.035) \\ 
  & \\ 
 fd & 0.566$^{***}$ \\ 
  & (0.146) \\ 
  & \\ 
 sexF & $-$0.139$^{***}$ \\ 
  & (0.048) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.092$^{*}$ \\ 
  & (0.055) \\ 
  & \\ 
 Constant & 0.369$^{***}$ \\ 
  & (0.052) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 3,415.984 \\ 
Akaike Inf. Crit. & $-$6,809.968 \\ 
Bayesian Inf. Crit. & $-$6,748.502 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Strength

![(\#fig:rs2g-repmes-strength)Integrated metric of strength by group.](main_files/figure-latex/rs2g-repmes-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.09    .767
## 2         group  1      0.05    .830
## 3            fd  1 12.46 ***   <.001
## 4           vas  1      0.15    .701
## 5           bis  1      0.00    .970
## 6           age  1      0.82    .365
## 7           sex  1    5.44 *    .020
## 8 session:group  1    2.74 +    .098
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-strength) Mixed Effects Model for Strength.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & strength \\ 
\hline \\[-1.8ex] 
 sessionT1 & 4.684 \\ 
  & (4.182) \\ 
  & \\ 
 groupSham & 4.964 \\ 
  & (3.862) \\ 
  & \\ 
 fd & 61.005$^{***}$ \\ 
  & (16.062) \\ 
  & \\ 
 sexF & $-$12.880$^{**}$ \\ 
  & (5.350) \\ 
  & \\ 
 sessionT1:groupSham & $-$10.642$^{*}$ \\ 
  & (6.177) \\ 
  & \\ 
 Constant & 24.779$^{***}$ \\ 
  & (4.517) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & $-$4,142.297 \\ 
Akaike Inf. Crit. & 8,306.594 \\ 
Bayesian Inf. Crit. & 8,368.060 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Modularity

![(\#fig:rs2g-repmes-mod)Integrated metric of modularity by group.](main_files/figure-latex/rs2g-repmes-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      1.24    .265
## 2         group  1      0.25    .618
## 3            fd  1 15.56 ***   <.001
## 4           vas  1      0.35    .553
## 5           bis  1      0.74    .390
## 6           age  1      0.62    .430
## 7           sex  1  10.60 **    .001
## 8 session:group  1      2.12    .146
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-mod) mixed effects model for modularity.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & mod.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.016 \\ 
  & (0.027) \\ 
  & \\ 
 groupSham & $-$0.022 \\ 
  & (0.022) \\ 
  & \\ 
 fd & $-$0.411$^{***}$ \\ 
  & (0.096) \\ 
  & \\ 
 sexF & 0.102$^{***}$ \\ 
  & (0.030) \\ 
  & \\ 
 sessionT1:groupSham & 0.065$^{*}$ \\ 
  & (0.039) \\ 
  & \\ 
 Constant & 0.369$^{***}$ \\ 
  & (0.028) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 4,528.941 \\ 
Akaike Inf. Crit. & $-$9,035.882 \\ 
Bayesian Inf. Crit. & $-$8,974.416 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 


#### Number of hubs

![(\#fig:rs2g-repmes-nhubs)Integrated metric of the number of hubs by group.](main_files/figure-latex/rs2g-repmes-nhubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df    Chisq p.value
## 1       session  1     0.05    .826
## 2         group  1     0.89    .345
## 3            fd  1     0.53    .466
## 4           vas  1     2.63    .105
## 5           bis  1     0.23    .632
## 6           age  1     0.23    .633
## 7           sex  1 10.15 **    .001
## 8 session:group  1     0.09    .770
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-nhubs) mixed effects model for number of hubs.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & num.hubs.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.767 \\ 
  & (1.081) \\ 
  & \\ 
 groupSham & 1.090 \\ 
  & (0.975) \\ 
  & \\ 
 fd & 2.647 \\ 
  & (3.965) \\ 
  & \\ 
 sexF & $-$3.540$^{***}$ \\ 
  & (1.153) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.711 \\ 
  & (1.595) \\ 
  & \\ 
 Constant & 50.839$^{***}$ \\ 
  & (1.185) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & $-$5,064.475 \\ 
Akaike Inf. Crit. & 10,150.950 \\ 
Bayesian Inf. Crit. & 10,212.420 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency

![(\#fig:rs2g-repmes-eglob)Integrated metric of global efficiency by group.](main_files/figure-latex/rs2g-repmes-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.75    .386
## 2         group  1      0.32    .572
## 3            fd  1 14.03 ***   <.001
## 4           vas  1      0.11    .745
## 5           bis  1      0.13    .723
## 6           age  1      0.51    .475
## 7           sex  1   9.00 **    .003
## 8 session:group  1      2.36    .124
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-ge) mixed effects model for Global Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.015 \\ 
  & (0.022) \\ 
  & \\ 
 groupSham & 0.017 \\ 
  & (0.020) \\ 
  & \\ 
 fd & 0.342$^{***}$ \\ 
  & (0.084) \\ 
  & \\ 
 sexF & $-$0.085$^{***}$ \\ 
  & (0.027) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.053$^{*}$ \\ 
  & (0.032) \\ 
  & \\ 
 Constant & 0.661$^{***}$ \\ 
  & (0.031) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 4,966.829 \\ 
Akaike Inf. Crit. & $-$9,911.658 \\ 
Bayesian Inf. Crit. & $-$9,850.192 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency (weighted)

![(\#fig:rs2g-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_files/figure-latex/rs2g-repmes-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.09    .765
## 2         group  1      0.10    .748
## 3            fd  1 13.88 ***   <.001
## 4           vas  1      0.15    .697
## 5           bis  1      0.06    .804
## 6           age  1      0.71    .399
## 7           sex  1   7.18 **    .007
## 8 session:group  1      2.47    .116
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-gew) mixed effects model for Global Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.016 \\ 
  & (0.016) \\ 
  & \\ 
 groupSham & 0.016 \\ 
  & (0.014) \\ 
  & \\ 
 fd & 0.238$^{***}$ \\ 
  & (0.059) \\ 
  & \\ 
 sexF & $-$0.053$^{***}$ \\ 
  & (0.019) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.038 \\ 
  & (0.024) \\ 
  & \\ 
 Constant & 0.266$^{***}$ \\ 
  & (0.016) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 9,282.295 \\ 
Akaike Inf. Crit. & $-$18,542.590 \\ 
Bayesian Inf. Crit. & $-$18,481.120 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency

![(\#fig:rs2g-repmes-eloc)Integrated metric of local efficiency by group.](main_files/figure-latex/rs2g-repmes-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    0.05    .816
## 2         group  1    0.00    .949
## 3            fd  1 8.52 **    .004
## 4           vas  1    0.00    .965
## 5           bis  1    0.01    .915
## 6           age  1    0.60    .440
## 7           sex  1  4.22 *    .040
## 8 session:group  1    1.96    .161
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-eloc) mixed effects model for Local Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.009 \\ 
  & (0.010) \\ 
  & \\ 
 groupSham & 0.011 \\ 
  & (0.010) \\ 
  & \\ 
 fd & 0.130$^{***}$ \\ 
  & (0.041) \\ 
  & \\ 
 sexF & $-$0.030$^{**}$ \\ 
  & (0.014) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.021 \\ 
  & (0.015) \\ 
  & \\ 
 Constant & 0.825$^{***}$ \\ 
  & (0.013) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 5,126.785 \\ 
Akaike Inf. Crit. & $-$10,231.570 \\ 
Bayesian Inf. Crit. & $-$10,170.100 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency (weighted)

![(\#fig:rs2g-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_files/figure-latex/rs2g-repmes-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    0.23    .629
## 2         group  1    0.02    .893
## 3            fd  1 8.45 **    .004
## 4           vas  1    0.01    .942
## 5           bis  1    0.60    .440
## 6           age  1    0.57    .450
## 7           sex  1  3.50 +    .061
## 8 session:group  1    1.70    .193
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-elocw) mixed effects model for Local Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.014 \\ 
  & (0.012) \\ 
  & \\ 
 groupSham & 0.014 \\ 
  & (0.011) \\ 
  & \\ 
 fd & 0.139$^{***}$ \\ 
  & (0.045) \\ 
  & \\ 
 sexF & $-$0.028$^{*}$ \\ 
  & (0.015) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.021 \\ 
  & (0.018) \\ 
  & \\ 
 Constant & 0.352$^{***}$ \\ 
  & (0.015) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 5,947.606 \\ 
Akaike Inf. Crit. & $-$11,873.210 \\ 
Bayesian Inf. Crit. & $-$11,811.750 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

### Maintenance phase

![(\#fig:rs2g-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/rs2g-sparklines-long-1.pdf) 



#### Density

![(\#fig:rs2g-repmesl-density)Integrated metric of density by session.](main_files/figure-latex/rs2g-repmesl-density-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    3.30    .347
## 2      fd  1 7.77 **    .005
## 3     vas  1 8.01 **    .005
## 4     bis  1    1.91    .167
## 5     age  1    1.55    .213
## 6     sex  1 9.12 **    .003
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Strength

![(\#fig:rs2g-repmesl-strength)Integrated metric of strength by session.](main_files/figure-latex/rs2g-repmesl-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    3.72    .293
## 2      fd  1 8.54 **    .003
## 3     vas  1 8.56 **    .003
## 4     bis  1    0.36    .550
## 5     age  1    1.67    .196
## 6     sex  1 7.44 **    .006
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Modularity

![(\#fig:rs2g-repmesl-mod)Integrated metric of modularity by session.](main_files/figure-latex/rs2g-repmesl-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df    Chisq p.value
## 1 session  3     0.67    .881
## 2      fd  1   5.21 *    .023
## 3     vas  1     2.03    .154
## 4     bis  1     1.95    .162
## 5     age  1     0.81    .369
## 6     sex  1 10.21 **    .001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Number of hubs

![(\#fig:rs2g-repmesl-hubs)Integrated metric of number of hubs by session.](main_files/figure-latex/rs2g-repmesl-hubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df    Chisq p.value
## 1 session  3     1.54    .674
## 2      fd  1     0.03    .865
## 3     vas  1     0.09    .770
## 4     bis  1     0.00    .994
## 5     age  1     0.08    .781
## 6     sex  1 10.75 **    .001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency

![(\#fig:rs2g-repmesl-eglob)Integrated metric of global efficiency by session.](main_files/figure-latex/rs2g-repmesl-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      2.76    .430
## 2      fd  1   7.31 **    .007
## 3     vas  1    6.58 *    .010
## 4     bis  1      1.70    .192
## 5     age  1      1.00    .318
## 6     sex  1 11.27 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency (weighted)

![(\#fig:rs2g-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_files/figure-latex/rs2g-repmesl-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    3.41    .333
## 2      fd  1 6.68 **    .010
## 3     vas  1  6.42 *    .011
## 4     bis  1    0.05    .821
## 5     age  1    0.53    .469
## 6     sex  1 9.91 **    .002
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency

![(\#fig:rs2g-repmesl-eloc)Integrated metric of local efficiency by session.](main_files/figure-latex/rs2g-repmesl-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df    Chisq p.value
## 1 session  3     4.95    .176
## 2      fd  1  9.05 **    .003
## 3     vas  1 10.57 **    .001
## 4     bis  1     0.99    .321
## 5     age  1     2.55    .110
## 6     sex  1  7.12 **    .008
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency (weighted)

![(\#fig:rs2g-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_files/figure-latex/rs2g-repmesl-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df  Chisq p.value
## 1 session  3   4.27    .234
## 2      fd  1   1.84    .175
## 3     vas  1 5.71 *    .017
## 4     bis  1   1.23    .268
## 5     age  1   0.33    .568
## 6     sex  1 4.00 *    .045
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



## Schaefer-200 (without Global Signal)





### Acute phase

![(\#fig:rs2n-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/rs2n-sparklines-acute-1.pdf) 



#### Density

![(\#fig:rs2n-repmes-density)Integrated metric of density by group.](main_files/figure-latex/rs2n-repmes-density-1.pdf) 

##### Likelihood Ratio Test of Fixed effects


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.34    .246
## 2         group  1    0.92    .336
## 3            fd  1 7.67 **    .006
## 4           vas  1    0.00    .984
## 5           bis  1  4.59 *    .032
## 6           age  1    0.33    .566
## 7           sex  1  6.49 *    .011
## 8 session:group  1    1.40    .237
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-density) Mixed Effects Model for Density.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & density \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.023 \\ 
  & (0.034) \\ 
  & \\ 
 groupSham & 0.004 \\ 
  & (0.040) \\ 
  & \\ 
 fd & 0.404$^{***}$ \\ 
  & (0.155) \\ 
  & \\ 
 sexF & $-$0.137$^{***}$ \\ 
  & (0.052) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.081 \\ 
  & (0.050) \\ 
  & \\ 
 Constant & 0.617$^{***}$ \\ 
  & (0.054) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 2,917.403 \\ 
Akaike Inf. Crit. & $-$5,812.805 \\ 
Bayesian Inf. Crit. & $-$5,751.339 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Strength

![(\#fig:rs2n-repmes-strength)Integrated metric of strength by group.](main_files/figure-latex/rs2n-repmes-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.42    .234
## 2         group  1    0.43    .514
## 3            fd  1 8.43 **    .004
## 4           vas  1    0.09    .761
## 5           bis  1  4.12 *    .042
## 6           age  1    0.48    .488
## 7           sex  1  4.74 *    .029
## 8 session:group  1    1.97    .161
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-strength) Mixed Effects Model for Strength.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & strength \\ 
\hline \\[-1.8ex] 
 sessionT1 & 4.525 \\ 
  & (4.865) \\ 
  & \\ 
 groupSham & 3.105 \\ 
  & (6.102) \\ 
  & \\ 
 fd & 65.070$^{***}$ \\ 
  & (23.005) \\ 
  & \\ 
 sexF & $-$17.625$^{**}$ \\ 
  & (7.770) \\ 
  & \\ 
 sessionT1:groupSham & $-$13.541$^{*}$ \\ 
  & (7.168) \\ 
  & \\ 
 Constant & 50.508$^{***}$ \\ 
  & (6.536) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & $-$4,265.593 \\ 
Akaike Inf. Crit. & 8,553.186 \\ 
Bayesian Inf. Crit. & 8,614.652 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Modularity

![(\#fig:rs2n-repmes-mod)Integrated metric of modularity by group.](main_files/figure-latex/rs2n-repmes-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1  2.73 +    .098
## 2         group  1    0.98    .321
## 3            fd  1 9.39 **    .002
## 4           vas  1    0.02    .880
## 5           bis  1 6.76 **    .009
## 6           age  1    0.97    .324
## 7           sex  1 9.44 **    .002
## 8 session:group  1    1.12    .289
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-mod) mixed effects model for modularity.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & mod.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.006 \\ 
  & (0.019) \\ 
  & \\ 
 groupSham & $-$0.003 \\ 
  & (0.019) \\ 
  & \\ 
 fd & $-$0.219$^{***}$ \\ 
  & (0.079) \\ 
  & \\ 
 sexF & 0.080$^{***}$ \\ 
  & (0.025) \\ 
  & \\ 
 sessionT1:groupSham & 0.043 \\ 
  & (0.028) \\ 
  & \\ 
 Constant & 0.202$^{***}$ \\ 
  & (0.023) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 4,529.066 \\ 
Akaike Inf. Crit. & $-$9,036.133 \\ 
Bayesian Inf. Crit. & $-$8,974.667 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Number of hubs

![(\#fig:rs2n-repmes-nhubs)Integrated metric of the number of hubs by group.](main_files/figure-latex/rs2n-repmes-nhubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df Chisq p.value
## 1       session  1  0.39    .531
## 2         group  1  0.77    .380
## 3            fd  1  0.16    .692
## 4           vas  1  0.01    .909
## 5           bis  1  0.01    .919
## 6           age  1  1.74    .188
## 7           sex  1  1.55    .213
## 8 session:group  1  0.83    .363
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-nhubs) mixed effects model for number of hubs.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & num.hubs.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.285 \\ 
  & (1.112) \\ 
  & \\ 
 groupSham & 0.088 \\ 
  & (1.119) \\ 
  & \\ 
 fd & 1.279 \\ 
  & (4.178) \\ 
  & \\ 
 sexF & 1.212 \\ 
  & (1.161) \\ 
  & \\ 
 sessionT1:groupSham & 1.522 \\ 
  & (1.639) \\ 
  & \\ 
 Constant & 53.476$^{***}$ \\ 
  & (1.211) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & $-$5,333.162 \\ 
Akaike Inf. Crit. & 10,688.320 \\ 
Bayesian Inf. Crit. & 10,749.790 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency

![(\#fig:rs2n-repmes-eglob)Integrated metric of global efficiency by group.](main_files/figure-latex/rs2n-repmes-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.27    .259
## 2         group  1    0.98    .322
## 3            fd  1 7.98 **    .005
## 4           vas  1    0.00    .972
## 5           bis  1  4.64 *    .031
## 6           age  1    0.35    .556
## 7           sex  1 6.67 **    .010
## 8 session:group  1    1.36    .244
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-ge) mixed effects model for Global Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.012 \\ 
  & (0.018) \\ 
  & \\ 
 groupSham & 0.002 \\ 
  & (0.021) \\ 
  & \\ 
 fd & 0.215$^{***}$ \\ 
  & (0.081) \\ 
  & \\ 
 sexF & $-$0.072$^{***}$ \\ 
  & (0.027) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.042 \\ 
  & (0.026) \\ 
  & \\ 
 Constant & 0.803$^{***}$ \\ 
  & (0.028) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 4,098.215 \\ 
Akaike Inf. Crit. & $-$8,174.430 \\ 
Bayesian Inf. Crit. & $-$8,112.964 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency (weighted)

![(\#fig:rs2n-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_files/figure-latex/rs2n-repmes-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.29    .256
## 2         group  1    0.32    .574
## 3            fd  1 9.06 **    .003
## 4           vas  1    0.07    .793
## 5           bis  1  3.87 *    .049
## 6           age  1    0.48    .488
## 7           sex  1  4.83 *    .028
## 8 session:group  1    1.96    .162
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-gew) mixed effects model for Global Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.016 \\ 
  & (0.017) \\ 
  & \\ 
 groupSham & 0.013 \\ 
  & (0.021) \\ 
  & \\ 
 fd & 0.240$^{***}$ \\ 
  & (0.081) \\ 
  & \\ 
 sexF & $-$0.061$^{**}$ \\ 
  & (0.027) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.048$^{*}$ \\ 
  & (0.026) \\ 
  & \\ 
 Constant & 0.359$^{***}$ \\ 
  & (0.022) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 10,048.390 \\ 
Akaike Inf. Crit. & $-$20,074.780 \\ 
Bayesian Inf. Crit. & $-$20,013.320 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency

![(\#fig:rs2n-repmes-eloc)Integrated metric of local efficiency by group.](main_files/figure-latex/rs2n-repmes-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   0.87    .351
## 2         group  1   0.56    .453
## 3            fd  1 6.20 *    .013
## 4           vas  1   0.01    .943
## 5           bis  1 4.49 *    .034
## 6           age  1   0.42    .517
## 7           sex  1 4.97 *    .026
## 8 session:group  1   1.07    .301
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-eloc) mixed effects model for Local Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.007 \\ 
  & (0.010) \\ 
  & \\ 
 groupSham & 0.002 \\ 
  & (0.012) \\ 
  & \\ 
 fd & 0.104$^{**}$ \\ 
  & (0.045) \\ 
  & \\ 
 sexF & $-$0.035$^{**}$ \\ 
  & (0.015) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.021 \\ 
  & (0.014) \\ 
  & \\ 
 Constant & 0.892$^{***}$ \\ 
  & (0.014) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 5,697.543 \\ 
Akaike Inf. Crit. & $-$11,373.090 \\ 
Bayesian Inf. Crit. & $-$11,311.620 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency (weighted)

![(\#fig:rs2n-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_files/figure-latex/rs2n-repmes-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    0.82    .366
## 2         group  1    0.06    .802
## 3            fd  1 7.54 **    .006
## 4           vas  1    0.05    .824
## 5           bis  1  3.29 +    .070
## 6           age  1    0.47    .492
## 7           sex  1  3.55 +    .059
## 8 session:group  1    1.49    .222
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-elocw) mixed effects model for Local Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.013 \\ 
  & (0.014) \\ 
  & \\ 
 groupSham & 0.013 \\ 
  & (0.017) \\ 
  & \\ 
 fd & 0.180$^{***}$ \\ 
  & (0.066) \\ 
  & \\ 
 sexF & $-$0.043$^{**}$ \\ 
  & (0.022) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.034 \\ 
  & (0.021) \\ 
  & \\ 
 Constant & 0.414$^{***}$ \\ 
  & (0.019) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 5,853.000 \\ 
Akaike Inf. Crit. & $-$11,684.000 \\ 
Bayesian Inf. Crit. & $-$11,622.530 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

### Maintenance phase

![(\#fig:rs2n-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/rs2n-sparklines-long-1.pdf) 



#### Density

![(\#fig:rs2n-repmesl-density)Integrated metric of density by session.](main_files/figure-latex/rs2n-repmesl-density-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      4.27    .234
## 2      fd  1      0.05    .824
## 3     vas  1      0.09    .762
## 4     bis  1   9.03 **    .003
## 5     age  1      0.44    .505
## 6     sex  1 11.76 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Strength

![(\#fig:rs2n-repmesl-strength)Integrated metric of strength by session.](main_files/figure-latex/rs2n-repmesl-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      3.63    .304
## 2      fd  1      0.59    .444
## 3     vas  1      1.27    .259
## 4     bis  1 13.54 ***   <.001
## 5     age  1      0.45    .504
## 6     sex  1 16.61 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Modularity

![(\#fig:rs2n-repmesl-mod)Integrated metric of modularity by session.](main_files/figure-latex/rs2n-repmesl-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      2.58    .462
## 2      fd  1    3.86 *    .050
## 3     vas  1      0.65    .420
## 4     bis  1  10.32 **    .001
## 5     age  1      0.22    .640
## 6     sex  1 19.62 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Number of hubs

![(\#fig:rs2n-repmesl-hubs)Integrated metric of number of hubs by session.](main_files/figure-latex/rs2n-repmesl-hubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df Chisq p.value
## 1 session  3  0.00   >.999
## 2      fd  1  0.00   >.999
## 3     vas  1  0.24    .627
## 4     bis  1  0.18    .672
## 5     age  1  0.00   >.999
## 6     sex  1  1.61    .205
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency

![(\#fig:rs2n-repmesl-eglob)Integrated metric of global efficiency by session.](main_files/figure-latex/rs2n-repmesl-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df    Chisq p.value
## 1 session  3     4.20    .241
## 2      fd  1     0.08    .772
## 3     vas  1     0.11    .741
## 4     bis  1  8.31 **    .004
## 5     age  1     0.39    .532
## 6     sex  1 10.41 **    .001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency (weighted)

![(\#fig:rs2n-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_files/figure-latex/rs2n-repmesl-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      3.34    .342
## 2      fd  1      1.27    .259
## 3     vas  1      2.24    .135
## 4     bis  1 12.10 ***   <.001
## 5     age  1      0.40    .530
## 6     sex  1 13.84 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency

![(\#fig:rs2n-repmesl-eloc)Integrated metric of local efficiency by session.](main_files/figure-latex/rs2n-repmesl-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      5.88    .117
## 2      fd  1      2.05    .152
## 3     vas  1      1.10    .295
## 4     bis  1 12.96 ***   <.001
## 5     age  1      1.26    .261
## 6     sex  1 13.43 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency (weighted)

![(\#fig:rs2n-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_files/figure-latex/rs2n-repmesl-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      2.46    .483
## 2      fd  1      1.34    .247
## 3     vas  1    3.29 +    .070
## 4     bis  1 10.98 ***   <.001
## 5     age  1      0.18    .668
## 6     sex  1 12.78 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



## Schaefer-400 (with Global Signal)





### Acute phase

![(\#fig:rs4g-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/rs4g-sparklines-acute-1.pdf) 



#### Density

![(\#fig:rs4g-repmes-density)Integrated metric of density by group.](main_files/figure-latex/rs4g-repmes-density-1.pdf) 

##### Likelihood Ratio Test of Fixed effects


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.44    .509
## 2         group  1      0.14    .712
## 3            fd  1 12.57 ***   <.001
## 4           vas  1      0.30    .582
## 5           bis  1      0.03    .863
## 6           age  1      0.79    .374
## 7           sex  1   6.78 **    .009
## 8 session:group  1      2.36    .124
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-density) Mixed Effects Model for Density.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & density \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.029 \\ 
  & (0.034) \\ 
  & \\ 
 groupSham & 0.033 \\ 
  & (0.032) \\ 
  & \\ 
 fd & 0.503$^{***}$ \\ 
  & (0.131) \\ 
  & \\ 
 sexF & $-$0.117$^{***}$ \\ 
  & (0.043) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.083$^{*}$ \\ 
  & (0.050) \\ 
  & \\ 
 Constant & 0.332$^{***}$ \\ 
  & (0.051) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 3,526.865 \\ 
Akaike Inf. Crit. & $-$7,031.731 \\ 
Bayesian Inf. Crit. & $-$6,970.265 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Strength

![(\#fig:rs4g-repmes-strength)Integrated metric of strength by group.](main_files/figure-latex/rs4g-repmes-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.03    .865
## 2         group  1      0.03    .857
## 3            fd  1 12.35 ***   <.001
## 4           vas  1      0.38    .535
## 5           bis  1      0.06    .809
## 6           age  1      1.01    .314
## 7           sex  1    5.05 *    .025
## 8 session:group  1      2.49    .115
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-strength) Mixed Effects Model for Strength.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & strength \\ 
\hline \\[-1.8ex] 
 sessionT1 & 8.511 \\ 
  & (7.320) \\ 
  & \\ 
 groupSham & 8.684 \\ 
  & (6.493) \\ 
  & \\ 
 fd & 102.089$^{***}$ \\ 
  & (27.291) \\ 
  & \\ 
 sexF & $-$20.547$^{**}$ \\ 
  & (8.983) \\ 
  & \\ 
 sessionT1:groupSham & $-$17.744 \\ 
  & (10.815) \\ 
  & \\ 
 Constant & 41.745$^{***}$ \\ 
  & (7.806) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & $-$5,440.909 \\ 
Akaike Inf. Crit. & 10,903.820 \\ 
Bayesian Inf. Crit. & 10,965.280 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Modularity

![(\#fig:rs4g-repmes-mod)Integrated metric of modularity by group.](main_files/figure-latex/rs4g-repmes-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      1.08    .298
## 2         group  1      0.14    .705
## 3            fd  1 14.88 ***   <.001
## 4           vas  1      0.62    .433
## 5           bis  1      0.62    .430
## 6           age  1      0.89    .346
## 7           sex  1   9.83 **    .002
## 8 session:group  1      1.78    .182
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-mod) mixed effects model for modularity.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & mod.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.015 \\ 
  & (0.025) \\ 
  & \\ 
 groupSham & $-$0.022 \\ 
  & (0.021) \\ 
  & \\ 
 fd & $-$0.369$^{***}$ \\ 
  & (0.089) \\ 
  & \\ 
 sexF & 0.092$^{***}$ \\ 
  & (0.028) \\ 
  & \\ 
 sessionT1:groupSham & 0.057 \\ 
  & (0.037) \\ 
  & \\ 
 Constant & 0.370$^{***}$ \\ 
  & (0.027) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 4,482.866 \\ 
Akaike Inf. Crit. & $-$8,943.733 \\ 
Bayesian Inf. Crit. & $-$8,882.267 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 


#### Number of hubs

![(\#fig:rs4g-repmes-nhubs)Integrated metric of the number of hubs by group.](main_files/figure-latex/rs4g-repmes-nhubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   0.02    .884
## 2         group  1   0.43    .510
## 3            fd  1   1.04    .308
## 4           vas  1   1.69    .194
## 5           bis  1 3.98 *    .046
## 6           age  1   0.51    .474
## 7           sex  1 3.35 +    .067
## 8 session:group  1   0.76    .382
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-nhubs) mixed effects model for number of hubs.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & num.hubs.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 1.250 \\ 
  & (1.877) \\ 
  & \\ 
 groupSham & 2.041 \\ 
  & (1.819) \\ 
  & \\ 
 fd & 7.534 \\ 
  & (7.088) \\ 
  & \\ 
 sexF & $-$2.982 \\ 
  & (2.018) \\ 
  & \\ 
 sessionT1:groupSham & $-$2.288 \\ 
  & (2.769) \\ 
  & \\ 
 Constant & 99.280$^{***}$ \\ 
  & (2.171) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & $-$5,878.722 \\ 
Akaike Inf. Crit. & 11,779.440 \\ 
Bayesian Inf. Crit. & 11,840.910 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency

![(\#fig:rs4g-repmes-eglob)Integrated metric of global efficiency by group.](main_files/figure-latex/rs4g-repmes-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.55    .460
## 2         group  1      0.23    .634
## 3            fd  1 13.99 ***   <.001
## 4           vas  1      0.28    .599
## 5           bis  1      0.04    .845
## 6           age  1      0.72    .397
## 7           sex  1   8.37 **    .004
## 8 session:group  1      2.28    .131
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-ge) mixed effects model for Global Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.015 \\ 
  & (0.020) \\ 
  & \\ 
 groupSham & 0.017 \\ 
  & (0.018) \\ 
  & \\ 
 fd & 0.304$^{***}$ \\ 
  & (0.075) \\ 
  & \\ 
 sexF & $-$0.073$^{***}$ \\ 
  & (0.024) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.048 \\ 
  & (0.029) \\ 
  & \\ 
 Constant & 0.644$^{***}$ \\ 
  & (0.030) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 5,325.809 \\ 
Akaike Inf. Crit. & $-$10,629.620 \\ 
Bayesian Inf. Crit. & $-$10,568.150 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency (weighted)

![(\#fig:rs4g-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_files/figure-latex/rs4g-repmes-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.04    .835
## 2         group  1      0.09    .766
## 3            fd  1 14.33 ***   <.001
## 4           vas  1      0.51    .476
## 5           bis  1      0.20    .653
## 6           age  1      0.90    .343
## 7           sex  1   7.07 **    .008
## 8 session:group  1      2.19    .139
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-gew) mixed effects model for Global Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.014 \\ 
  & (0.014) \\ 
  & \\ 
 groupSham & 0.014 \\ 
  & (0.012) \\ 
  & \\ 
 fd & 0.203$^{***}$ \\ 
  & (0.050) \\ 
  & \\ 
 sexF & $-$0.043$^{***}$ \\ 
  & (0.016) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.031 \\ 
  & (0.021) \\ 
  & \\ 
 Constant & 0.254$^{***}$ \\ 
  & (0.013) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 9,485.963 \\ 
Akaike Inf. Crit. & $-$18,949.930 \\ 
Bayesian Inf. Crit. & $-$18,888.460 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency

![(\#fig:rs4g-repmes-eloc)Integrated metric of local efficiency by group.](main_files/figure-latex/rs4g-repmes-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    0.05    .823
## 2         group  1    0.00    .969
## 3            fd  1 7.87 **    .005
## 4           vas  1    0.14    .711
## 5           bis  1    0.05    .818
## 6           age  1    0.71    .400
## 7           sex  1  4.10 *    .043
## 8 session:group  1    1.84    .175
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-eloc) mixed effects model for Local Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.009 \\ 
  & (0.010) \\ 
  & \\ 
 groupSham & 0.011 \\ 
  & (0.010) \\ 
  & \\ 
 fd & 0.121$^{***}$ \\ 
  & (0.041) \\ 
  & \\ 
 sexF & $-$0.028$^{**}$ \\ 
  & (0.013) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.021 \\ 
  & (0.015) \\ 
  & \\ 
 Constant & 0.808$^{***}$ \\ 
  & (0.013) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 5,171.994 \\ 
Akaike Inf. Crit. & $-$10,321.990 \\ 
Bayesian Inf. Crit. & $-$10,260.520 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency (weighted)

![(\#fig:rs4g-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_files/figure-latex/rs4g-repmes-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    0.21    .643
## 2         group  1    0.02    .888
## 3            fd  1 7.90 **    .005
## 4           vas  1    0.35    .556
## 5           bis  1    1.15    .283
## 6           age  1    0.67    .412
## 7           sex  1  3.43 +    .064
## 8 session:group  1    1.37    .241
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-elocw) mixed effects model for Local Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.012 \\ 
  & (0.011) \\ 
  & \\ 
 groupSham & 0.012 \\ 
  & (0.009) \\ 
  & \\ 
 fd & 0.116$^{***}$ \\ 
  & (0.040) \\ 
  & \\ 
 sexF & $-$0.023$^{*}$ \\ 
  & (0.013) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.017 \\ 
  & (0.016) \\ 
  & \\ 
 Constant & 0.338$^{***}$ \\ 
  & (0.014) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 6,089.236 \\ 
Akaike Inf. Crit. & $-$12,156.470 \\ 
Bayesian Inf. Crit. & $-$12,095.010 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

### Maintenance phase

![(\#fig:rs4g-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/rs4g-sparklines-long-1.pdf) 



#### Density

![(\#fig:rs4g-repmesl-density)Integrated metric of density by session.](main_files/figure-latex/rs4g-repmesl-density-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    3.44    .329
## 2      fd  1 7.62 **    .006
## 3     vas  1 7.50 **    .006
## 4     bis  1    1.48    .223
## 5     age  1    1.30    .255
## 6     sex  1 9.48 **    .002
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Strength

![(\#fig:rs4g-repmesl-strength)Integrated metric of strength by session.](main_files/figure-latex/rs4g-repmesl-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    3.33    .343
## 2      fd  1  6.38 *    .012
## 3     vas  1 7.03 **    .008
## 4     bis  1    0.12    .732
## 5     age  1    0.62    .432
## 6     sex  1  6.54 *    .011
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Modularity

![(\#fig:rs4g-repmesl-mod)Integrated metric of modularity by session.](main_files/figure-latex/rs4g-repmesl-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      0.69    .875
## 2      fd  1    4.89 *    .027
## 3     vas  1      1.84    .175
## 4     bis  1      1.95    .163
## 5     age  1      1.19    .276
## 6     sex  1 10.84 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Number of hubs

![(\#fig:rs4g-repmesl-hubs)Integrated metric of number of hubs by session.](main_files/figure-latex/rs4g-repmesl-hubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df Chisq p.value
## 1 session  3  0.18    .981
## 2      fd  1  1.04    .308
## 3     vas  1  0.23    .630
## 4     bis  1  0.06    .808
## 5     age  1  0.00    .986
## 6     sex  1  2.50    .113
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency

![(\#fig:rs4g-repmesl-eglob)Integrated metric of global efficiency by session.](main_files/figure-latex/rs4g-repmesl-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      2.93    .402
## 2      fd  1   6.99 **    .008
## 3     vas  1    6.21 *    .013
## 4     bis  1      1.41    .236
## 5     age  1      0.78    .378
## 6     sex  1 11.84 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency (weighted)

![(\#fig:rs4g-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_files/figure-latex/rs4g-repmesl-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    3.24    .356
## 2      fd  1  5.44 *    .020
## 3     vas  1  4.71 *    .030
## 4     bis  1    0.00    .991
## 5     age  1    0.15    .695
## 6     sex  1 9.30 **    .002
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency

![(\#fig:rs4g-repmesl-eloc)Integrated metric of local efficiency by session.](main_files/figure-latex/rs4g-repmesl-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    4.37    .224
## 2      fd  1  4.05 *    .044
## 3     vas  1 7.69 **    .006
## 4     bis  1    0.08    .774
## 5     age  1    0.18    .675
## 6     sex  1  6.30 *    .012
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency (weighted)

![(\#fig:rs4g-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_files/figure-latex/rs4g-repmesl-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df  Chisq p.value
## 1 session  3   4.21    .240
## 2      fd  1   0.85    .357
## 3     vas  1 3.45 +    .063
## 4     bis  1   2.28    .131
## 5     age  1   0.00   >.999
## 6     sex  1   2.07    .150
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



## Schaefer-400 (without Global Signal)





### Acute phase

![(\#fig:rs4n-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/rs4n-sparklines-acute-1.pdf) 



#### Density

![(\#fig:rs4n-repmes-density)Integrated metric of density by group.](main_files/figure-latex/rs4n-repmes-density-1.pdf) 

##### Likelihood Ratio Test of Fixed effects


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.29    .256
## 2         group  1    0.73    .393
## 3            fd  1 7.67 **    .006
## 4           vas  1    0.06    .802
## 5           bis  1  4.37 *    .037
## 6           age  1    0.49    .482
## 7           sex  1  5.68 *    .017
## 8 session:group  1    1.43    .231
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-density) Mixed Effects Model for Density.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & density \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.027 \\ 
  & (0.033) \\ 
  & \\ 
 groupSham & 0.009 \\ 
  & (0.040) \\ 
  & \\ 
 fd & 0.401$^{***}$ \\ 
  & (0.152) \\ 
  & \\ 
 sexF & $-$0.127$^{**}$ \\ 
  & (0.051) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.081$^{*}$ \\ 
  & (0.048) \\ 
  & \\ 
 Constant & 0.551$^{***}$ \\ 
  & (0.055) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 3,215.352 \\ 
Akaike Inf. Crit. & $-$6,408.703 \\ 
Bayesian Inf. Crit. & $-$6,347.237 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Strength

![(\#fig:rs4n-repmes-strength)Integrated metric of strength by group.](main_files/figure-latex/rs4n-repmes-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.32    .250
## 2         group  1    0.30    .585
## 3            fd  1 8.57 **    .003
## 4           vas  1    0.26    .609
## 5           bis  1  3.66 +    .056
## 6           age  1    0.68    .411
## 7           sex  1  4.30 *    .038
## 8 session:group  1    2.03    .154
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-strength) Mixed Effects Model for Strength.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & strength \\ 
\hline \\[-1.8ex] 
 sessionT1 & 8.902 \\ 
  & (8.666) \\ 
  & \\ 
 groupSham & 7.024 \\ 
  & (10.879) \\ 
  & \\ 
 fd & 117.972$^{***}$ \\ 
  & (40.982) \\ 
  & \\ 
 sexF & $-$29.921$^{**}$ \\ 
  & (13.818) \\ 
  & \\ 
 sessionT1:groupSham & $-$24.639$^{*}$ \\ 
  & (12.767) \\ 
  & \\ 
 Constant & 83.193$^{***}$ \\ 
  & (11.781) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & $-$5,298.354 \\ 
Akaike Inf. Crit. & 10,618.710 \\ 
Bayesian Inf. Crit. & 10,680.170 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Modularity

![(\#fig:rs4n-repmes-mod)Integrated metric of modularity by group.](main_files/figure-latex/rs4n-repmes-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    2.26    .133
## 2         group  1    0.83    .363
## 3            fd  1 8.69 **    .003
## 4           vas  1    0.06    .799
## 5           bis  1  6.34 *    .012
## 6           age  1    1.47    .225
## 7           sex  1 8.57 **    .003
## 8 session:group  1    1.05    .305
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-mod) mixed effects model for modularity.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & mod.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.008 \\ 
  & (0.019) \\ 
  & \\ 
 groupSham & $-$0.005 \\ 
  & (0.019) \\ 
  & \\ 
 fd & $-$0.211$^{***}$ \\ 
  & (0.079) \\ 
  & \\ 
 sexF & 0.078$^{***}$ \\ 
  & (0.025) \\ 
  & \\ 
 sessionT1:groupSham & 0.042 \\ 
  & (0.028) \\ 
  & \\ 
 Constant & 0.216$^{***}$ \\ 
  & (0.023) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 4,504.848 \\ 
Akaike Inf. Crit. & $-$8,987.695 \\ 
Bayesian Inf. Crit. & $-$8,926.229 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 


#### Number of hubs

![(\#fig:rs4n-repmes-nhubs)Integrated metric of the number of hubs by group.](main_files/figure-latex/rs4n-repmes-nhubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df Chisq p.value
## 1       session  1  0.15    .697
## 2         group  1  0.57    .449
## 3            fd  1  2.11    .146
## 4           vas  1  0.19    .664
## 5           bis  1  0.25    .619
## 6           age  1  0.03    .852
## 7           sex  1  0.00    .949
## 8 session:group  1  1.23    .268
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-nhubs) mixed effects model for number of hubs.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & num.hubs.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 1.621 \\ 
  & (2.012) \\ 
  & \\ 
 groupSham & 3.169 \\ 
  & (2.273) \\ 
  & \\ 
 fd & 12.274 \\ 
  & (8.559) \\ 
  & \\ 
 sexF & $-$0.148 \\ 
  & (2.549) \\ 
  & \\ 
 sessionT1:groupSham & $-$3.700 \\ 
  & (2.965) \\ 
  & \\ 
 Constant & 102.630$^{***}$ \\ 
  & (2.548) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & $-$6,098.918 \\ 
Akaike Inf. Crit. & 12,219.840 \\ 
Bayesian Inf. Crit. & 12,281.300 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency

![(\#fig:rs4n-repmes-eglob)Integrated metric of global efficiency by group.](main_files/figure-latex/rs4n-repmes-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.25    .263
## 2         group  1    0.79    .375
## 3            fd  1 8.20 **    .004
## 4           vas  1    0.04    .840
## 5           bis  1  4.51 *    .034
## 6           age  1    0.53    .466
## 7           sex  1  6.12 *    .013
## 8 session:group  1    1.38    .240
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-ge) mixed effects model for Global Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.014 \\ 
  & (0.017) \\ 
  & \\ 
 groupSham & 0.004 \\ 
  & (0.021) \\ 
  & \\ 
 fd & 0.217$^{***}$ \\ 
  & (0.079) \\ 
  & \\ 
 sexF & $-$0.068$^{***}$ \\ 
  & (0.026) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.042$^{*}$ \\ 
  & (0.025) \\ 
  & \\ 
 Constant & 0.769$^{***}$ \\ 
  & (0.029) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 4,405.786 \\ 
Akaike Inf. Crit. & $-$8,789.573 \\ 
Bayesian Inf. Crit. & $-$8,728.107 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency (weighted)

![(\#fig:rs4n-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_files/figure-latex/rs4n-repmes-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.19    .276
## 2         group  1    0.21    .647
## 3            fd  1 9.62 **    .002
## 4           vas  1    0.24    .626
## 5           bis  1  3.38 +    .066
## 6           age  1    0.67    .414
## 7           sex  1  4.63 *    .031
## 8 session:group  1    1.93    .165
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-gew) mixed effects model for Global Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.015 \\ 
  & (0.015) \\ 
  & \\ 
 groupSham & 0.013 \\ 
  & (0.018) \\ 
  & \\ 
 fd & 0.217$^{***}$ \\ 
  & (0.071) \\ 
  & \\ 
 sexF & $-$0.052$^{**}$ \\ 
  & (0.023) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.042$^{*}$ \\ 
  & (0.023) \\ 
  & \\ 
 Constant & 0.329$^{***}$ \\ 
  & (0.019) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 10,202.320 \\ 
Akaike Inf. Crit. & $-$20,382.640 \\ 
Bayesian Inf. Crit. & $-$20,321.180 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency

![(\#fig:rs4n-repmes-eloc)Integrated metric of local efficiency by group.](main_files/figure-latex/rs4n-repmes-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   0.86    .355
## 2         group  1   0.46    .499
## 3            fd  1 5.75 *    .016
## 4           vas  1   0.03    .864
## 5           bis  1 4.03 *    .045
## 6           age  1   0.56    .453
## 7           sex  1 4.50 *    .034
## 8 session:group  1   0.98    .322
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-eloc) mixed effects model for Local Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.008 \\ 
  & (0.010) \\ 
  & \\ 
 groupSham & 0.003 \\ 
  & (0.012) \\ 
  & \\ 
 fd & 0.106$^{**}$ \\ 
  & (0.046) \\ 
  & \\ 
 sexF & $-$0.035$^{**}$ \\ 
  & (0.015) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.021 \\ 
  & (0.015) \\ 
  & \\ 
 Constant & 0.873$^{***}$ \\ 
  & (0.015) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 5,824.070 \\ 
Akaike Inf. Crit. & $-$11,626.140 \\ 
Bayesian Inf. Crit. & $-$11,564.670 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency (weighted)

![(\#fig:rs4n-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_files/figure-latex/rs4n-repmes-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    0.74    .391
## 2         group  1    0.03    .870
## 3            fd  1 7.51 **    .006
## 4           vas  1    0.22    .641
## 5           bis  1    2.63    .105
## 6           age  1    0.60    .438
## 7           sex  1  3.36 +    .067
## 8 session:group  1    1.36    .244
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-elocw) mixed effects model for Local Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.012 \\ 
  & (0.013) \\ 
  & \\ 
 groupSham & 0.012 \\ 
  & (0.015) \\ 
  & \\ 
 fd & 0.161$^{***}$ \\ 
  & (0.058) \\ 
  & \\ 
 sexF & $-$0.037$^{*}$ \\ 
  & (0.019) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.030 \\ 
  & (0.019) \\ 
  & \\ 
 Constant & 0.389$^{***}$ \\ 
  & (0.017) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,974 \\ 
Log Likelihood & 6,093.822 \\ 
Akaike Inf. Crit. & $-$12,165.640 \\ 
Bayesian Inf. Crit. & $-$12,104.180 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

### Maintenance phase

![(\#fig:rs4n-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/rs4n-sparklines-long-1.pdf) 



#### Density

![(\#fig:rs4n-repmesl-density)Integrated metric of density by session.](main_files/figure-latex/rs4n-repmesl-density-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      3.97    .265
## 2      fd  1      0.34    .558
## 3     vas  1      0.69    .407
## 4     bis  1 10.93 ***   <.001
## 5     age  1      0.38    .537
## 6     sex  1 12.13 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Strength

![(\#fig:rs4n-repmesl-strength)Integrated metric of strength by session.](main_files/figure-latex/rs4n-repmesl-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      3.03    .387
## 2      fd  1      0.67    .411
## 3     vas  1      2.49    .115
## 4     bis  1 12.92 ***   <.001
## 5     age  1      0.32    .574
## 6     sex  1 13.22 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Modularity

![(\#fig:rs4n-repmesl-mod)Integrated metric of modularity by session.](main_files/figure-latex/rs4n-repmesl-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df    Chisq p.value
## 1 session  3     2.18    .537
## 2      fd  1   3.49 +    .062
## 3     vas  1     0.56    .454
## 4     bis  1 10.56 **    .001
## 5     age  1     0.19    .665
## 6     sex  1  9.71 **    .002
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Number of hubs

![(\#fig:rs4n-repmesl-hubs)Integrated metric of number of hubs by session.](main_files/figure-latex/rs4n-repmesl-hubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df  Chisq p.value
## 1 session  3 6.46 +    .091
## 2      fd  1   0.18    .669
## 3     vas  1   2.68    .101
## 4     bis  1   0.56    .454
## 5     age  1 3.40 +    .065
## 6     sex  1 4.58 *    .032
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency

![(\#fig:rs4n-repmesl-eglob)Integrated metric of global efficiency by session.](main_files/figure-latex/rs4n-repmesl-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    3.85    .278
## 2      fd  1    0.44    .508
## 3     vas  1    0.80    .372
## 4     bis  1 9.96 **    .002
## 5     age  1    0.30    .581
## 6     sex  1 8.81 **    .003
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency (weighted)

![(\#fig:rs4n-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_files/figure-latex/rs4n-repmesl-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df    Chisq p.value
## 1 session  3     2.75    .432
## 2      fd  1     1.32    .250
## 3     vas  1   3.04 +    .081
## 4     bis  1 10.28 **    .001
## 5     age  1     0.22    .642
## 6     sex  1 10.42 **    .001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency

![(\#fig:rs4n-repmesl-eloc)Integrated metric of local efficiency by session.](main_files/figure-latex/rs4n-repmesl-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df    Chisq p.value
## 1 session  3     3.29    .348
## 2      fd  1     0.03    .870
## 3     vas  1     1.33    .249
## 4     bis  1 10.42 **    .001
## 5     age  1     0.36    .551
## 6     sex  1 10.08 **    .001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency (weighted)

![(\#fig:rs4n-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_files/figure-latex/rs4n-repmesl-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df    Chisq p.value
## 1 session  3     2.21    .530
## 2      fd  1     1.03    .310
## 3     vas  1   3.08 +    .079
## 4     bis  1  7.48 **    .006
## 5     age  1     0.13    .714
## 6     sex  1 10.26 **    .001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



# Graphs: Density Thresholding

## Power-264 (with Global Signal)





### Acute phase

![(\#fig:dpg-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/dpg-sparklines-acute-1.pdf) 



#### Density

![(\#fig:dpg-repmes-density)Integrated metric of density by group.](main_files/figure-latex/dpg-repmes-density-1.pdf) 

##### Likelihood Ratio Test of Fixed effects


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      1.14    .286
## 2         group  1      0.68    .409
## 3            fd  1 14.69 ***   <.001
## 4           vas  1      0.26    .607
## 5           bis  1      0.40    .529
## 6           age  1      0.27    .603
## 7           sex  1   9.87 **    .002
## 8 session:group  1      1.00    .318
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-density) Mixed Effects Model for Density.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & density \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.002 \\ 
  & (0.008) \\ 
  & \\ 
 groupSham & 0.001 \\ 
  & (0.007) \\ 
  & \\ 
 fd & 0.127$^{***}$ \\ 
  & (0.031) \\ 
  & \\ 
 sexF & $-$0.032$^{***}$ \\ 
  & (0.010) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.014 \\ 
  & (0.012) \\ 
  & \\ 
 Constant & 0.410$^{***}$ \\ 
  & (0.046) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 2,832.761 \\ 
Akaike Inf. Crit. & $-$5,643.522 \\ 
Bayesian Inf. Crit. & $-$5,583.157 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Strength

![(\#fig:dpg-repmes-strength)Integrated metric of strength by group.](main_files/figure-latex/dpg-repmes-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.01    .912
## 2         group  1      0.13    .723
## 3            fd  1 20.87 ***   <.001
## 4           vas  1      1.34    .247
## 5           bis  1      0.38    .538
## 6           age  1      0.92    .336
## 7           sex  1   8.03 **    .005
## 8 session:group  1      1.85    .174
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-strength) Mixed Effects Model for Strength.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & strength \\ 
\hline \\[-1.8ex] 
 sessionT1 & 2.071 \\ 
  & (1.940) \\ 
  & \\ 
 groupSham & 1.696 \\ 
  & (1.509) \\ 
  & \\ 
 fd & 33.166$^{***}$ \\ 
  & (6.532) \\ 
  & \\ 
 sexF & $-$5.834$^{***}$ \\ 
  & (2.067) \\ 
  & \\ 
 sessionT1:groupSham & $-$4.064 \\ 
  & (2.869) \\ 
  & \\ 
 Constant & 20.462$^{***}$ \\ 
  & (2.520) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & $-$5,238.836 \\ 
Akaike Inf. Crit. & 10,499.670 \\ 
Bayesian Inf. Crit. & 10,560.040 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Modularity

![(\#fig:dpg-repmes-mod)Integrated metric of modularity by group.](main_files/figure-latex/dpg-repmes-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1    2.77 +    .096
## 2         group  1      0.34    .562
## 3            fd  1 12.75 ***   <.001
## 4           vas  1      0.60    .439
## 5           bis  1      2.54    .111
## 6           age  1      0.02    .902
## 7           sex  1    5.66 *    .017
## 8 session:group  1      0.52    .470
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-mod) mixed effects model for modularity.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & mod.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.001 \\ 
  & (0.013) \\ 
  & \\ 
 groupSham & $-$0.002 \\ 
  & (0.012) \\ 
  & \\ 
 fd & $-$0.184$^{***}$ \\ 
  & (0.051) \\ 
  & \\ 
 sexF & 0.038$^{**}$ \\ 
  & (0.016) \\ 
  & \\ 
 sessionT1:groupSham & 0.020 \\ 
  & (0.019) \\ 
  & \\ 
 Constant & 0.307$^{***}$ \\ 
  & (0.023) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,722.046 \\ 
Akaike Inf. Crit. & $-$9,422.092 \\ 
Bayesian Inf. Crit. & $-$9,361.727 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 


#### Number of hubs

![(\#fig:dpg-repmes-nhubs)Integrated metric of the number of hubs by group.](main_files/figure-latex/dpg-repmes-nhubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   1.04    .307
## 2         group  1   0.06    .813
## 3            fd  1   0.26    .613
## 4           vas  1   2.18    .140
## 5           bis  1   0.54    .462
## 6           age  1   0.17    .684
## 7           sex  1 4.05 *    .044
## 8 session:group  1   2.56    .110
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-nhubs) mixed effects model for number of hubs.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & num.hubs.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 1.385 \\ 
  & (1.046) \\ 
  & \\ 
 groupSham & 1.304 \\ 
  & (1.209) \\ 
  & \\ 
 fd & $-$1.555 \\ 
  & (4.426) \\ 
  & \\ 
 sexF & 2.225$^{*}$ \\ 
  & (1.296) \\ 
  & \\ 
 sessionT1:groupSham & $-$2.008 \\ 
  & (1.542) \\ 
  & \\ 
 Constant & 65.454$^{***}$ \\ 
  & (1.372) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & $-$4,934.417 \\ 
Akaike Inf. Crit. & 9,890.835 \\ 
Bayesian Inf. Crit. & 9,951.200 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency

![(\#fig:dpg-repmes-eglob)Integrated metric of global efficiency by group.](main_files/figure-latex/dpg-repmes-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    2.16    .141
## 2         group  1    1.66    .198
## 3            fd  1 9.13 **    .003
## 4           vas  1    0.07    .795
## 5           bis  1    1.15    .284
## 6           age  1    0.07    .798
## 7           sex  1 8.75 **    .003
## 8 session:group  1    1.44    .230
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-ge) mixed effects model for Global Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.001 \\ 
  & (0.004) \\ 
  & \\ 
 groupSham & $-$0.001 \\ 
  & (0.004) \\ 
  & \\ 
 fd & 0.046$^{***}$ \\ 
  & (0.015) \\ 
  & \\ 
 sexF & $-$0.015$^{***}$ \\ 
  & (0.005) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.008 \\ 
  & (0.005) \\ 
  & \\ 
 Constant & 0.681$^{***}$ \\ 
  & (0.031) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 3,765.004 \\ 
Akaike Inf. Crit. & $-$7,508.008 \\ 
Bayesian Inf. Crit. & $-$7,447.643 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency (weighted)

![(\#fig:dpg-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_files/figure-latex/dpg-repmes-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.03    .866
## 2         group  1      0.19    .667
## 3            fd  1 24.27 ***   <.001
## 4           vas  1      1.67    .196
## 5           bis  1      0.44    .505
## 6           age  1      0.42    .516
## 7           sex  1  10.11 **    .001
## 8 session:group  1      2.02    .156
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-gew) mixed effects model for Global Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.009 \\ 
  & (0.008) \\ 
  & \\ 
 groupSham & 0.007 \\ 
  & (0.006) \\ 
  & \\ 
 fd & 0.154$^{***}$ \\ 
  & (0.028) \\ 
  & \\ 
 sexF & $-$0.027$^{***}$ \\ 
  & (0.009) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.018 \\ 
  & (0.012) \\ 
  & \\ 
 Constant & 0.186$^{***}$ \\ 
  & (0.008) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 5,617.647 \\ 
Akaike Inf. Crit. & $-$11,213.300 \\ 
Bayesian Inf. Crit. & $-$11,152.930 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency

![(\#fig:dpg-repmes-eloc)Integrated metric of local efficiency by group.](main_files/figure-latex/dpg-repmes-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.10    .757
## 2         group  1      0.04    .851
## 3            fd  1 12.32 ***   <.001
## 4           vas  1      0.90    .343
## 5           bis  1      0.23    .632
## 6           age  1      0.17    .677
## 7           sex  1   8.86 **    .003
## 8 session:group  1      1.08    .298
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-eloc) mixed effects model for Local Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.004 \\ 
  & (0.006) \\ 
  & \\ 
 groupSham & 0.004 \\ 
  & (0.005) \\ 
  & \\ 
 fd & 0.084$^{***}$ \\ 
  & (0.022) \\ 
  & \\ 
 sexF & $-$0.020$^{***}$ \\ 
  & (0.007) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.010 \\ 
  & (0.009) \\ 
  & \\ 
 Constant & 0.787$^{***}$ \\ 
  & (0.012) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,548.884 \\ 
Akaike Inf. Crit. & $-$9,075.768 \\ 
Bayesian Inf. Crit. & $-$9,015.403 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency (weighted)

![(\#fig:dpg-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_files/figure-latex/dpg-repmes-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.00    .965
## 2         group  1      0.03    .856
## 3            fd  1 20.22 ***   <.001
## 4           vas  1      2.00    .157
## 5           bis  1      0.91    .341
## 6           age  1      0.47    .495
## 7           sex  1   8.39 **    .004
## 8 session:group  1      1.58    .209
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-elocw) mixed effects model for Local Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.012 \\ 
  & (0.012) \\ 
  & \\ 
 groupSham & 0.011 \\ 
  & (0.009) \\ 
  & \\ 
 fd & 0.195$^{***}$ \\ 
  & (0.039) \\ 
  & \\ 
 sexF & $-$0.034$^{***}$ \\ 
  & (0.012) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.022 \\ 
  & (0.017) \\ 
  & \\ 
 Constant & 0.219$^{***}$ \\ 
  & (0.012) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 5,217.482 \\ 
Akaike Inf. Crit. & $-$10,412.960 \\ 
Bayesian Inf. Crit. & $-$10,352.600 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

### Maintenance phase

![(\#fig:dpg-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/dpg-sparklines-long-1.pdf) 



#### Density

![(\#fig:dpg-repmesl-density)Integrated metric of density by session.](main_files/figure-latex/dpg-repmesl-density-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      3.46    .326
## 2      fd  1    6.02 *    .014
## 3     vas  1      2.13    .144
## 4     bis  1    3.18 +    .075
## 5     age  1      0.99    .320
## 6     sex  1 14.31 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Strength

![(\#fig:dpg-repmesl-strength)Integrated metric of strength by session.](main_files/figure-latex/dpg-repmesl-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    3.27    .351
## 2      fd  1 6.75 **    .009
## 3     vas  1    2.05    .152
## 4     bis  1    0.01    .933
## 5     age  1    0.30    .583
## 6     sex  1 6.94 **    .008
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Modularity

![(\#fig:dpg-repmesl-mod)Integrated metric of modularity by session.](main_files/figure-latex/dpg-repmesl-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    1.06    .786
## 2      fd  1  5.54 *    .019
## 3     vas  1    0.89    .347
## 4     bis  1 6.70 **    .010
## 5     age  1  2.77 +    .096
## 6     sex  1  5.41 *    .020
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Number of hubs

![(\#fig:dpg-repmesl-hubs)Integrated metric of number of hubs by session.](main_files/figure-latex/dpg-repmesl-hubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df  Chisq p.value
## 1 session  3 6.97 +    .073
## 2      fd  1 2.77 +    .096
## 3     vas  1   2.43    .119
## 4     bis  1   0.95    .329
## 5     age  1   1.33    .248
## 6     sex  1   0.03    .867
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency

![(\#fig:dpg-repmesl-eglob)Integrated metric of global efficiency by session.](main_files/figure-latex/dpg-repmesl-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    1.70    .636
## 2      fd  1    0.43    .512
## 3     vas  1    0.12    .727
## 4     bis  1    1.55    .213
## 5     age  1    0.17    .679
## 6     sex  1 8.76 **    .003
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency (weighted)

![(\#fig:dpg-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_files/figure-latex/dpg-repmesl-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    3.02    .388
## 2      fd  1 7.47 **    .006
## 3     vas  1    0.52    .472
## 4     bis  1    0.34    .561
## 5     age  1    0.26    .609
## 6     sex  1 9.35 **    .002
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency

![(\#fig:dpg-repmesl-eloc)Integrated metric of local efficiency by session.](main_files/figure-latex/dpg-repmesl-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df  Chisq p.value
## 1 session  3   6.01    .111
## 2      fd  1 3.36 +    .067
## 3     vas  1   0.77    .380
## 4     bis  1   0.03    .857
## 5     age  1   0.05    .818
## 6     sex  1 5.49 *    .019
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency (weighted)

![(\#fig:dpg-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_files/figure-latex/dpg-repmesl-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df  Chisq p.value
## 1 session  3   4.78    .188
## 2      fd  1 6.47 *    .011
## 3     vas  1   0.84    .360
## 4     bis  1   0.50    .477
## 5     age  1   0.24    .623
## 6     sex  1 5.59 *    .018
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model




## Power-264 (without Global Signal)





### Acute phase

![(\#fig:dpn-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/dpn-sparklines-acute-1.pdf) 



#### Density

![(\#fig:dpn-repmes-density)Integrated metric of density by group.](main_files/figure-latex/dpn-repmes-density-1.pdf) 

##### Likelihood Ratio Test of Fixed effects


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    0.77    .380
## 2         group  1    1.16    .281
## 3            fd  1 7.57 **    .006
## 4           vas  1    0.00    .997
## 5           bis  1  3.66 +    .056
## 6           age  1    0.34    .558
## 7           sex  1  4.57 *    .032
## 8 session:group  1    0.53    .467
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-density) Mixed Effects Model for Density.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & density \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.002 \\ 
  & (0.005) \\ 
  & \\ 
 groupSham & $-$0.001 \\ 
  & (0.005) \\ 
  & \\ 
 fd & 0.055$^{***}$ \\ 
  & (0.021) \\ 
  & \\ 
 sexF & $-$0.015$^{**}$ \\ 
  & (0.007) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.008 \\ 
  & (0.007) \\ 
  & \\ 
 Constant & 0.459$^{***}$ \\ 
  & (0.055) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 3,263.278 \\ 
Akaike Inf. Crit. & $-$6,504.557 \\ 
Bayesian Inf. Crit. & $-$6,444.192 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Strength

![(\#fig:dpn-repmes-strength)Integrated metric of strength by group.](main_files/figure-latex/dpn-repmes-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.89    .344
## 2         group  1      0.22    .642
## 3            fd  1 12.73 ***   <.001
## 4           vas  1      1.03    .311
## 5           bis  1      1.78    .183
## 6           age  1      0.96    .326
## 7           sex  1    4.28 *    .039
## 8 session:group  1      1.42    .233
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-strength) Mixed Effects Model for Strength.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & strength \\ 
\hline \\[-1.8ex] 
 sessionT1 & 1.993 \\ 
  & (2.063) \\ 
  & \\ 
 groupSham & 1.606 \\ 
  & (2.337) \\ 
  & \\ 
 fd & 33.917$^{***}$ \\ 
  & (9.174) \\ 
  & \\ 
 sexF & $-$6.506$^{**}$ \\ 
  & (3.003) \\ 
  & \\ 
 sessionT1:groupSham & $-$4.985 \\ 
  & (3.041) \\ 
  & \\ 
 Constant & 29.957$^{***}$ \\ 
  & (3.799) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & $-$5,691.621 \\ 
Akaike Inf. Crit. & 11,405.240 \\ 
Bayesian Inf. Crit. & 11,465.610 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Modularity

![(\#fig:dpn-repmes-mod)Integrated metric of modularity by group.](main_files/figure-latex/dpn-repmes-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1  3.39 +    .065
## 2         group  1    0.23    .632
## 3            fd  1 9.61 **    .002
## 4           vas  1    0.37    .542
## 5           bis  1  6.54 *    .011
## 6           age  1    0.15    .700
## 7           sex  1  5.06 *    .024
## 8 session:group  1    0.12    .731
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-mod) mixed effects model for modularity.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & mod.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.002 \\ 
  & (0.012) \\ 
  & \\ 
 groupSham & $-$0.001 \\ 
  & (0.012) \\ 
  & \\ 
 fd & $-$0.142$^{***}$ \\ 
  & (0.050) \\ 
  & \\ 
 sexF & 0.037$^{**}$ \\ 
  & (0.016) \\ 
  & \\ 
 sessionT1:groupSham & 0.015 \\ 
  & (0.018) \\ 
  & \\ 
 Constant & 0.244$^{***}$ \\ 
  & (0.023) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,470.068 \\ 
Akaike Inf. Crit. & $-$8,918.135 \\ 
Bayesian Inf. Crit. & $-$8,857.770 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 


#### Number of hubs

![(\#fig:dpn-repmes-nhubs)Integrated metric of the number of hubs by group.](main_files/figure-latex/dpn-repmes-nhubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   0.66    .417
## 2         group  1   0.51    .475
## 3            fd  1   1.03    .310
## 4           vas  1   0.95    .330
## 5           bis  1   0.98    .323
## 6           age  1   1.78    .182
## 7           sex  1   0.00    .948
## 8 session:group  1 4.83 *    .028
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-nhubs) mixed effects model for number of hubs.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & num.hubs.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.451 \\ 
  & (0.899) \\ 
  & \\ 
 groupSham & 1.940$^{*}$ \\ 
  & (1.013) \\ 
  & \\ 
 fd & 2.886 \\ 
  & (3.510) \\ 
  & \\ 
 sexF & $-$0.405 \\ 
  & (0.969) \\ 
  & \\ 
 sessionT1:groupSham & $-$2.665$^{**}$ \\ 
  & (1.324) \\ 
  & \\ 
 Constant & 64.578$^{***}$ \\ 
  & (1.096) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & $-$4,818.668 \\ 
Akaike Inf. Crit. & 9,659.337 \\ 
Bayesian Inf. Crit. & 9,719.702 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency

![(\#fig:dpn-repmes-eglob)Integrated metric of global efficiency by group.](main_files/figure-latex/dpn-repmes-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   0.00    .950
## 2         group  1 3.60 +    .058
## 3            fd  1   0.29    .588
## 4           vas  1   1.78    .182
## 5           bis  1   0.95    .329
## 6           age  1   2.01    .157
## 7           sex  1   2.31    .128
## 8 session:group  1   0.94    .332
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-ge) mixed effects model for Global Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.001 \\ 
  & (0.003) \\ 
  & \\ 
 groupSham & $-$0.004 \\ 
  & (0.003) \\ 
  & \\ 
 fd & 0.007 \\ 
  & (0.011) \\ 
  & \\ 
 sexF & $-$0.005 \\ 
  & (0.004) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.003 \\ 
  & (0.004) \\ 
  & \\ 
 Constant & 0.698$^{***}$ \\ 
  & (0.038) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 3,882.704 \\ 
Akaike Inf. Crit. & $-$7,743.408 \\ 
Bayesian Inf. Crit. & $-$7,683.043 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency (weighted)

![(\#fig:dpn-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_files/figure-latex/dpn-repmes-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.80    .370
## 2         group  1      0.39    .535
## 3            fd  1 16.11 ***   <.001
## 4           vas  1      1.13    .287
## 5           bis  1      1.59    .208
## 6           age  1      0.56    .456
## 7           sex  1    5.61 *    .018
## 8 session:group  1      1.68    .194
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-gew) mixed effects model for Global Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.009 \\ 
  & (0.008) \\ 
  & \\ 
 groupSham & 0.005 \\ 
  & (0.009) \\ 
  & \\ 
 fd & 0.152$^{***}$ \\ 
  & (0.036) \\ 
  & \\ 
 sexF & $-$0.029$^{**}$ \\ 
  & (0.012) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.021$^{*}$ \\ 
  & (0.012) \\ 
  & \\ 
 Constant & 0.224$^{***}$ \\ 
  & (0.011) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,800.354 \\ 
Akaike Inf. Crit. & $-$9,578.708 \\ 
Bayesian Inf. Crit. & $-$9,518.343 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency

![(\#fig:dpn-repmes-eloc)Integrated metric of local efficiency by group.](main_files/figure-latex/dpn-repmes-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   0.17    .679
## 2         group  1   0.24    .623
## 3            fd  1 5.69 *    .017
## 4           vas  1   0.40    .525
## 5           bis  1   2.38    .123
## 6           age  1   0.07    .784
## 7           sex  1 3.89 *    .048
## 8 session:group  1   0.11    .744
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-eloc) mixed effects model for Local Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.003 \\ 
  & (0.004) \\ 
  & \\ 
 groupSham & $-$0.0001 \\ 
  & (0.005) \\ 
  & \\ 
 fd & 0.044$^{**}$ \\ 
  & (0.018) \\ 
  & \\ 
 sexF & $-$0.012$^{**}$ \\ 
  & (0.006) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.005 \\ 
  & (0.006) \\ 
  & \\ 
 Constant & 0.822$^{***}$ \\ 
  & (0.014) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,493.082 \\ 
Akaike Inf. Crit. & $-$8,964.164 \\ 
Bayesian Inf. Crit. & $-$8,903.799 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency (weighted)

![(\#fig:dpn-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_files/figure-latex/dpn-repmes-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.58    .446
## 2         group  1      0.12    .727
## 3            fd  1 12.90 ***   <.001
## 4           vas  1      1.38    .240
## 5           bis  1      1.50    .221
## 6           age  1      0.56    .454
## 7           sex  1    4.55 *    .033
## 8 session:group  1      1.01    .314
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-elocw) mixed effects model for Local Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.011 \\ 
  & (0.012) \\ 
  & \\ 
 groupSham & 0.009 \\ 
  & (0.013) \\ 
  & \\ 
 fd & 0.195$^{***}$ \\ 
  & (0.052) \\ 
  & \\ 
 sexF & $-$0.036$^{**}$ \\ 
  & (0.017) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.025 \\ 
  & (0.017) \\ 
  & \\ 
 Constant & 0.273$^{***}$ \\ 
  & (0.015) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,696.422 \\ 
Akaike Inf. Crit. & $-$9,370.845 \\ 
Bayesian Inf. Crit. & $-$9,310.479 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

### Maintenance phase

![(\#fig:dpn-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/dpn-sparklines-long-1.pdf) 



#### Density

![(\#fig:dpn-repmesl-density)Integrated metric of density by session.](main_files/figure-latex/dpn-repmesl-density-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    5.14    .162
## 2      fd  1    1.09    .296
## 3     vas  1    0.91    .340
## 4     bis  1    1.87    .171
## 5     age  1    0.04    .838
## 6     sex  1 7.68 **    .006
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Strength

![(\#fig:dpn-repmesl-strength)Integrated metric of strength by session.](main_files/figure-latex/dpn-repmesl-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df    Chisq p.value
## 1 session  3     1.91    .591
## 2      fd  1   3.55 +    .060
## 3     vas  1     2.09    .149
## 4     bis  1   4.85 *    .028
## 5     age  1     0.10    .754
## 6     sex  1 10.58 **    .001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Modularity

![(\#fig:dpn-repmesl-mod)Integrated metric of modularity by session.](main_files/figure-latex/dpn-repmesl-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3 17.57 ***   <.001
## 2      fd  1   8.45 **    .004
## 3     vas  1      0.44    .508
## 4     bis  1 23.74 ***   <.001
## 5     age  1      1.04    .308
## 6     sex  1 22.21 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Number of hubs

![(\#fig:dpn-repmesl-hubs)Integrated metric of number of hubs by session.](main_files/figure-latex/dpn-repmesl-hubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df  Chisq p.value
## 1 session  3   3.18    .365
## 2      fd  1   0.01    .928
## 3     vas  1 4.10 *    .043
## 4     bis  1   0.26    .608
## 5     age  1 2.78 +    .096
## 6     sex  1   1.07    .302
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency

![(\#fig:dpn-repmesl-eglob)Integrated metric of global efficiency by session.](main_files/figure-latex/dpn-repmesl-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df Chisq p.value
## 1 session  3  1.18    .758
## 2      fd  1  0.02    .881
## 3     vas  1  0.00    .991
## 4     bis  1  0.10    .753
## 5     age  1  0.13    .723
## 6     sex  1  2.57    .109
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency (weighted)

![(\#fig:dpn-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_files/figure-latex/dpn-repmesl-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      2.20    .532
## 2      fd  1    6.28 *    .012
## 3     vas  1      1.13    .288
## 4     bis  1      1.99    .159
## 5     age  1      0.09    .764
## 6     sex  1 11.67 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency

![(\#fig:dpn-repmesl-eloc)Integrated metric of local efficiency by session.](main_files/figure-latex/dpn-repmesl-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    5.82    .121
## 2      fd  1    1.05    .306
## 3     vas  1    0.23    .633
## 4     bis  1    1.10    .295
## 5     age  1    0.12    .728
## 6     sex  1 7.67 **    .006
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency (weighted)

![(\#fig:dpn-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_files/figure-latex/dpn-repmesl-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    1.85    .604
## 2      fd  1  3.33 +    .068
## 3     vas  1    0.81    .369
## 4     bis  1    2.23    .136
## 5     age  1    0.06    .807
## 6     sex  1 9.15 **    .002
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



## Gordon-333 (with Global Signal)





### Acute phase

![(\#fig:sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/sparklines-acute-1.pdf) 



#### Density

![(\#fig:repmes-density)Integrated metric of density by group.](main_files/figure-latex/repmes-density-1.pdf) 

##### Likelihood Ratio Test of Fixed effects


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      2.55    .111
## 2         group  1      1.22    .269
## 3            fd  1 13.56 ***   <.001
## 4           vas  1      0.08    .771
## 5           bis  1      0.54    .461
## 6           age  1      0.46    .496
## 7           sex  1 11.60 ***   <.001
## 8 session:group  1      1.59    .207
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-density) Mixed Effects Model for Density.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & density \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.0002 \\ 
  & (0.010) \\ 
  & \\ 
 groupSham & 0.002 \\ 
  & (0.008) \\ 
  & \\ 
 fd & 0.136$^{***}$ \\ 
  & (0.034) \\ 
  & \\ 
 sexF & $-$0.037$^{***}$ \\ 
  & (0.010) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.020 \\ 
  & (0.015) \\ 
  & \\ 
 Constant & 0.426$^{***}$ \\ 
  & (0.050) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 2,581.233 \\ 
Akaike Inf. Crit. & $-$5,140.465 \\ 
Bayesian Inf. Crit. & $-$5,080.100 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Strength

![(\#fig:repmes-strength)Integrated metric of strength by group.](main_files/figure-latex/repmes-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.18    .672
## 2         group  1      0.11    .743
## 3            fd  1 16.48 ***   <.001
## 4           vas  1      0.82    .364
## 5           bis  1      0.19    .666
## 6           age  1      1.14    .287
## 7           sex  1   7.63 **    .006
## 8 session:group  1      1.92    .166
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-strength) Mixed Effects Model for Strength.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & strength \\ 
\hline \\[-1.8ex] 
 sessionT1 & 2.692 \\ 
  & (3.181) \\ 
  & \\ 
 groupSham & 2.946 \\ 
  & (2.627) \\ 
  & \\ 
 fd & 50.126$^{***}$ \\ 
  & (11.250) \\ 
  & \\ 
 sexF & $-$9.980$^{***}$ \\ 
  & (3.558) \\ 
  & \\ 
 sessionT1:groupSham & $-$6.769 \\ 
  & (4.700) \\ 
  & \\ 
 Constant & 33.715$^{***}$ \\ 
  & (4.331) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & $-$6,261.696 \\ 
Akaike Inf. Crit. & 12,545.390 \\ 
Bayesian Inf. Crit. & 12,605.760 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Modularity

![(\#fig:repmes-mod)Integrated metric of modularity by group.](main_files/figure-latex/repmes-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      2.34    .126
## 2         group  1      0.23    .631
## 3            fd  1 11.74 ***   <.001
## 4           vas  1      0.21    .648
## 5           bis  1      1.65    .199
## 6           age  1      0.69    .405
## 7           sex  1    6.56 *    .010
## 8 session:group  1      1.23    .268
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-mod) mixed effects model for modularity.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & mod.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.002 \\ 
  & (0.016) \\ 
  & \\ 
 groupSham & $-$0.010 \\ 
  & (0.014) \\ 
  & \\ 
 fd & $-$0.209$^{***}$ \\ 
  & (0.058) \\ 
  & \\ 
 sexF & 0.048$^{***}$ \\ 
  & (0.018) \\ 
  & \\ 
 sessionT1:groupSham & 0.032 \\ 
  & (0.024) \\ 
  & \\ 
 Constant & 0.326$^{***}$ \\ 
  & (0.026) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,256.246 \\ 
Akaike Inf. Crit. & $-$8,490.492 \\ 
Bayesian Inf. Crit. & $-$8,430.127 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 


#### Number of hubs

![(\#fig:repmes-nhubs)Integrated metric of the number of hubs by group.](main_files/figure-latex/repmes-nhubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df Chisq p.value
## 1       session  1  1.64    .200
## 2         group  1  0.30    .582
## 3            fd  1  1.56    .212
## 4           vas  1  0.02    .894
## 5           bis  1  0.82    .366
## 6           age  1  2.49    .115
## 7           sex  1  0.00    .961
## 8 session:group  1  0.12    .728
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-nhubs) mixed effects model for number of hubs.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & num.hubs.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 1.019 \\ 
  & (1.104) \\ 
  & \\ 
 groupSham & 0.495 \\ 
  & (1.145) \\ 
  & \\ 
 fd & $-$5.369 \\ 
  & (4.603) \\ 
  & \\ 
 sexF & 0.363 \\ 
  & (1.440) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.326 \\ 
  & (1.628) \\ 
  & \\ 
 Constant & 85.892$^{***}$ \\ 
  & (1.455) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & $-$5,310.530 \\ 
Akaike Inf. Crit. & 10,643.060 \\ 
Bayesian Inf. Crit. & 10,703.430 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency

![(\#fig:repmes-eglob)Integrated metric of global efficiency by group.](main_files/figure-latex/repmes-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1    5.15 *    .023
## 2         group  1    5.31 *    .021
## 3            fd  1 11.57 ***   <.001
## 4           vas  1      0.55    .459
## 5           bis  1      1.84    .175
## 6           age  1      1.06    .303
## 7           sex  1 11.95 ***   <.001
## 8 session:group  1    2.94 +    .087
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-ge) mixed effects model for Global Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.0004 \\ 
  & (0.004) \\ 
  & \\ 
 groupSham & $-$0.001 \\ 
  & (0.004) \\ 
  & \\ 
 fd & 0.056$^{***}$ \\ 
  & (0.017) \\ 
  & \\ 
 sexF & $-$0.018$^{***}$ \\ 
  & (0.005) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.013$^{**}$ \\ 
  & (0.006) \\ 
  & \\ 
 Constant & 0.685$^{***}$ \\ 
  & (0.034) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 3,589.575 \\ 
Akaike Inf. Crit. & $-$7,157.149 \\ 
Bayesian Inf. Crit. & $-$7,096.784 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency (weighted)

![(\#fig:repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_files/figure-latex/repmes-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.15    .702
## 2         group  1      0.24    .623
## 3            fd  1 19.72 ***   <.001
## 4           vas  1      1.17    .280
## 5           bis  1      0.26    .608
## 6           age  1      1.23    .267
## 7           sex  1   9.04 **    .003
## 8 session:group  1      2.11    .146
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-gew) mixed effects model for Global Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.010 \\ 
  & (0.010) \\ 
  & \\ 
 groupSham & 0.009 \\ 
  & (0.008) \\ 
  & \\ 
 fd & 0.175$^{***}$ \\ 
  & (0.036) \\ 
  & \\ 
 sexF & $-$0.034$^{***}$ \\ 
  & (0.011) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.023 \\ 
  & (0.015) \\ 
  & \\ 
 Constant & 0.221$^{***}$ \\ 
  & (0.010) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 5,158.361 \\ 
Akaike Inf. Crit. & $-$10,294.720 \\ 
Bayesian Inf. Crit. & $-$10,234.360 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency

![(\#fig:repmes-eloc)Integrated metric of local efficiency by group.](main_files/figure-latex/repmes-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.43    .512
## 2         group  1      0.19    .659
## 3            fd  1 11.59 ***   <.001
## 4           vas  1      0.37    .545
## 5           bis  1      0.14    .708
## 6           age  1      0.55    .458
## 7           sex  1   8.02 **    .005
## 8 session:group  1      1.04    .308
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-eloc) mixed effects model for Local Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.002 \\ 
  & (0.006) \\ 
  & \\ 
 groupSham & 0.003 \\ 
  & (0.005) \\ 
  & \\ 
 fd & 0.078$^{***}$ \\ 
  & (0.021) \\ 
  & \\ 
 sexF & $-$0.018$^{***}$ \\ 
  & (0.006) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.009 \\ 
  & (0.009) \\ 
  & \\ 
 Constant & 0.809$^{***}$ \\ 
  & (0.012) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,365.167 \\ 
Akaike Inf. Crit. & $-$8,708.334 \\ 
Bayesian Inf. Crit. & $-$8,647.969 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency (weighted)

![(\#fig:repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_files/figure-latex/repmes-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.00    .953
## 2         group  1      0.03    .866
## 3            fd  1 15.88 ***   <.001
## 4           vas  1      1.09    .297
## 5           bis  1      0.66    .417
## 6           age  1      0.89    .345
## 7           sex  1   6.96 **    .008
## 8 session:group  1      1.30    .254
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-elocw) mixed effects model for Local Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.012 \\ 
  & (0.014) \\ 
  & \\ 
 groupSham & 0.012 \\ 
  & (0.012) \\ 
  & \\ 
 fd & 0.214$^{***}$ \\ 
  & (0.049) \\ 
  & \\ 
 sexF & $-$0.040$^{***}$ \\ 
  & (0.015) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.024 \\ 
  & (0.020) \\ 
  & \\ 
 Constant & 0.274$^{***}$ \\ 
  & (0.016) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,815.335 \\ 
Akaike Inf. Crit. & $-$9,608.670 \\ 
Bayesian Inf. Crit. & $-$9,548.305 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

### Maintenance phase

![(\#fig:sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/sparklines-long-1.pdf) 



#### Density

![(\#fig:repmesl-density)Integrated metric of density by session.](main_files/figure-latex/repmesl-density-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      1.70    .636
## 2      fd  1    6.12 *    .013
## 3     vas  1      2.10    .147
## 4     bis  1    2.74 +    .098
## 5     age  1      0.23    .630
## 6     sex  1 17.00 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Strength

![(\#fig:repmesl-strength)Integrated metric of strength by session.](main_files/figure-latex/repmesl-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    2.33    .507
## 2      fd  1  5.72 *    .017
## 3     vas  1  3.02 +    .082
## 4     bis  1    0.06    .801
## 5     age  1    0.06    .810
## 6     sex  1 7.53 **    .006
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Modularity

![(\#fig:repmesl-mod)Integrated metric of modularity by session.](main_files/figure-latex/repmesl-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    0.28    .963
## 2      fd  1    2.49    .115
## 3     vas  1    1.56    .211
## 4     bis  1    1.65    .199
## 5     age  1    0.67    .415
## 6     sex  1 7.43 **    .006
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Number of hubs

![(\#fig:repmesl-hubs)Integrated metric of number of hubs by session.](main_files/figure-latex/repmesl-hubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df Chisq p.value
## 1 session  3  2.63    .452
## 2      fd  1  2.66    .103
## 3     vas  1  0.01    .934
## 4     bis  1  0.91    .340
## 5     age  1  0.38    .538
## 6     sex  1  0.50    .481
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency

![(\#fig:repmesl-eglob)Integrated metric of global efficiency by session.](main_files/figure-latex/repmesl-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      1.12    .772
## 2      fd  1      0.11    .744
## 3     vas  1      0.17    .678
## 4     bis  1      2.32    .127
## 5     age  1      1.27    .259
## 6     sex  1 19.81 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency (weighted)

![(\#fig:repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_files/figure-latex/repmesl-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    2.26    .520
## 2      fd  1 6.69 **    .010
## 3     vas  1    1.75    .186
## 4     bis  1    0.00    .956
## 5     age  1    0.01    .919
## 6     sex  1 8.03 **    .005
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency

![(\#fig:repmesl-eloc)Integrated metric of local efficiency by session.](main_files/figure-latex/repmesl-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    2.69    .442
## 2      fd  1    1.34    .248
## 3     vas  1    1.61    .205
## 4     bis  1    0.01    .923
## 5     age  1    0.04    .845
## 6     sex  1 8.27 **    .004
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency (weighted)

![(\#fig:repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_files/figure-latex/repmesl-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df  Chisq p.value
## 1 session  3   2.82    .420
## 2      fd  1 4.50 *    .034
## 3     vas  1   1.64    .200
## 4     bis  1   0.14    .712
## 5     age  1   0.02    .901
## 6     sex  1 4.33 *    .037
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



## Gordon-333 (without Global Signal)





### Acute phase

![(\#fig:dgn-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/dgn-sparklines-acute-1.pdf) 



#### Density

![(\#fig:dgn-repmes-density)Integrated metric of density by group.](main_files/figure-latex/dgn-repmes-density-1.pdf) 

##### Likelihood Ratio Test of Fixed effects


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   1.94    .164
## 2         group  1   1.41    .234
## 3            fd  1 4.79 *    .029
## 4           vas  1   0.08    .783
## 5           bis  1 6.01 *    .014
## 6           age  1   1.20    .272
## 7           sex  1 5.77 *    .016
## 8 session:group  1   0.71    .398
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-density) Mixed Effects Model for Density.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & density \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.001 \\ 
  & (0.004) \\ 
  & \\ 
 groupSham & $-$0.0004 \\ 
  & (0.004) \\ 
  & \\ 
 fd & 0.033$^{*}$ \\ 
  & (0.018) \\ 
  & \\ 
 sexF & $-$0.014$^{**}$ \\ 
  & (0.005) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.008 \\ 
  & (0.006) \\ 
  & \\ 
 Constant & 0.479$^{***}$ \\ 
  & (0.059) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 3,422.020 \\ 
Akaike Inf. Crit. & $-$6,822.041 \\ 
Bayesian Inf. Crit. & $-$6,761.675 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Strength

![(\#fig:dgn-repmes-strength)Integrated metric of strength by group.](main_files/figure-latex/dgn-repmes-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.49    .222
## 2         group  1    0.30    .581
## 3            fd  1 9.31 **    .002
## 4           vas  1    0.50    .481
## 5           bis  1    2.67    .102
## 6           age  1    0.83    .361
## 7           sex  1  4.84 *    .028
## 8 session:group  1    1.26    .261
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-strength) Mixed Effects Model for Strength.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & strength \\ 
\hline \\[-1.8ex] 
 sessionT1 & 2.338 \\ 
  & (3.297) \\ 
  & \\ 
 groupSham & 2.032 \\ 
  & (3.916) \\ 
  & \\ 
 fd & 46.780$^{***}$ \\ 
  & (15.060) \\ 
  & \\ 
 sexF & $-$11.482$^{**}$ \\ 
  & (4.933) \\ 
  & \\ 
 sessionT1:groupSham & $-$7.704 \\ 
  & (4.860) \\ 
  & \\ 
 Constant & 52.135$^{***}$ \\ 
  & (6.633) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & $-$6,707.646 \\ 
Akaike Inf. Crit. & 13,437.290 \\ 
Bayesian Inf. Crit. & 13,497.660 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Modularity

![(\#fig:dgn-repmes-mod)Integrated metric of modularity by group.](main_files/figure-latex/dgn-repmes-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1 3.79 +    .052
## 2         group  1   0.22    .639
## 3            fd  1 6.58 *    .010
## 4           vas  1   0.08    .784
## 5           bis  1 6.01 *    .014
## 6           age  1   1.59    .208
## 7           sex  1 5.20 *    .023
## 8 session:group  1   0.49    .482
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-mod) mixed effects model for modularity.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & mod.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.003 \\ 
  & (0.013) \\ 
  & \\ 
 groupSham & $-$0.006 \\ 
  & (0.013) \\ 
  & \\ 
 fd & $-$0.122$^{**}$ \\ 
  & (0.054) \\ 
  & \\ 
 sexF & 0.040$^{**}$ \\ 
  & (0.017) \\ 
  & \\ 
 sessionT1:groupSham & 0.022 \\ 
  & (0.020) \\ 
  & \\ 
 Constant & 0.243$^{***}$ \\ 
  & (0.026) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,180.418 \\ 
Akaike Inf. Crit. & $-$8,338.836 \\ 
Bayesian Inf. Crit. & $-$8,278.471 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 


#### Number of hubs

![(\#fig:dgn-repmes-nhubs)Integrated metric of the number of hubs by group.](main_files/figure-latex/dgn-repmes-nhubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   2.47    .116
## 2         group  1   2.26    .132
## 3            fd  1   1.08    .299
## 4           vas  1   0.35    .554
## 5           bis  1   1.12    .290
## 6           age  1 3.57 +    .059
## 7           sex  1   0.03    .855
## 8 session:group  1   0.12    .733
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-nhubs) mixed effects model for number of hubs.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & num.hubs.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.823 \\ 
  & (0.905) \\ 
  & \\ 
 groupSham & 1.070 \\ 
  & (1.010) \\ 
  & \\ 
 fd & 4.254 \\ 
  & (3.924) \\ 
  & \\ 
 sexF & 0.446 \\ 
  & (1.217) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.098 \\ 
  & (1.334) \\ 
  & \\ 
 Constant & 83.899$^{***}$ \\ 
  & (1.287) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & $-$5,380.267 \\ 
Akaike Inf. Crit. & 10,782.530 \\ 
Bayesian Inf. Crit. & 10,842.900 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency

![(\#fig:dgn-repmes-eglob)Integrated metric of global efficiency by group.](main_files/figure-latex/dgn-repmes-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    0.54    .461
## 2         group  1 6.72 **    .010
## 3            fd  1    0.01    .937
## 4           vas  1    0.00    .967
## 5           bis  1    1.79    .181
## 6           age  1    0.70    .404
## 7           sex  1    1.42    .234
## 8 session:group  1    0.74    .390
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-ge) mixed effects model for Global Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.001 \\ 
  & (0.003) \\ 
  & \\ 
 groupSham & $-$0.004 \\ 
  & (0.003) \\ 
  & \\ 
 fd & $-$0.001 \\ 
  & (0.011) \\ 
  & \\ 
 sexF & $-$0.004 \\ 
  & (0.003) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.004 \\ 
  & (0.004) \\ 
  & \\ 
 Constant & 0.704$^{***}$ \\ 
  & (0.041) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,072.821 \\ 
Akaike Inf. Crit. & $-$8,123.643 \\ 
Bayesian Inf. Crit. & $-$8,063.278 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency (weighted)

![(\#fig:dgn-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_files/figure-latex/dgn-repmes-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      1.36    .244
## 2         group  1      0.61    .436
## 3            fd  1 11.72 ***   <.001
## 4           vas  1      0.57    .449
## 5           bis  1    2.86 +    .091
## 6           age  1      0.91    .340
## 7           sex  1    5.79 *    .016
## 8 session:group  1      1.46    .227
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-gew) mixed effects model for Global Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.009 \\ 
  & (0.010) \\ 
  & \\ 
 groupSham & 0.005 \\ 
  & (0.012) \\ 
  & \\ 
 fd & 0.163$^{***}$ \\ 
  & (0.047) \\ 
  & \\ 
 sexF & $-$0.039$^{**}$ \\ 
  & (0.015) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.026$^{*}$ \\ 
  & (0.015) \\ 
  & \\ 
 Constant & 0.278$^{***}$ \\ 
  & (0.015) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,341.079 \\ 
Akaike Inf. Crit. & $-$8,660.157 \\ 
Bayesian Inf. Crit. & $-$8,599.792 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency

![(\#fig:dgn-repmes-eloc)Integrated metric of local efficiency by group.](main_files/figure-latex/dgn-repmes-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   0.25    .616
## 2         group  1   0.91    .339
## 3            fd  1 3.87 *    .049
## 4           vas  1   0.00    .952
## 5           bis  1 3.40 +    .065
## 6           age  1   0.84    .358
## 7           sex  1 2.96 +    .085
## 8 session:group  1   0.00    .986
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-eloc) mixed effects model for Local Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.001 \\ 
  & (0.004) \\ 
  & \\ 
 groupSham & $-$0.002 \\ 
  & (0.004) \\ 
  & \\ 
 fd & 0.027$^{*}$ \\ 
  & (0.015) \\ 
  & \\ 
 sexF & $-$0.009$^{*}$ \\ 
  & (0.005) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.002 \\ 
  & (0.005) \\ 
  & \\ 
 Constant & 0.844$^{***}$ \\ 
  & (0.015) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,623.669 \\ 
Akaike Inf. Crit. & $-$9,225.338 \\ 
Bayesian Inf. Crit. & $-$9,164.973 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency (weighted)

![(\#fig:dgn-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_files/figure-latex/dgn-repmes-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    0.98    .323
## 2         group  1    0.28    .597
## 3            fd  1 9.22 **    .002
## 4           vas  1    0.56    .456
## 5           bis  1    2.45    .118
## 6           age  1    0.67    .414
## 7           sex  1  4.52 *    .034
## 8 session:group  1    0.76    .385
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-elocw) mixed effects model for Local Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.010 \\ 
  & (0.014) \\ 
  & \\ 
 groupSham & 0.006 \\ 
  & (0.017) \\ 
  & \\ 
 fd & 0.200$^{***}$ \\ 
  & (0.064) \\ 
  & \\ 
 sexF & $-$0.047$^{**}$ \\ 
  & (0.021) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.027 \\ 
  & (0.021) \\ 
  & \\ 
 Constant & 0.351$^{***}$ \\ 
  & (0.019) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,219.144 \\ 
Akaike Inf. Crit. & $-$8,416.289 \\ 
Bayesian Inf. Crit. & $-$8,355.924 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

### Maintenance phase

![(\#fig:dgn-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/dgn-sparklines-long-1.pdf) 



#### Density

![(\#fig:dgn-repmesl-density)Integrated metric of density by session.](main_files/figure-latex/dgn-repmesl-density-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    3.48    .324
## 2      fd  1    0.01    .928
## 3     vas  1    1.13    .288
## 4     bis  1    1.59    .208
## 5     age  1    0.17    .678
## 6     sex  1 9.36 **    .002
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Strength

![(\#fig:dgn-repmesl-strength)Integrated metric of strength by session.](main_files/figure-latex/dgn-repmesl-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      2.21    .531
## 2      fd  1      1.65    .199
## 3     vas  1      2.20    .138
## 4     bis  1   7.30 **    .007
## 5     age  1      0.10    .746
## 6     sex  1 11.71 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Modularity

![(\#fig:dgn-repmesl-mod)Integrated metric of modularity by session.](main_files/figure-latex/dgn-repmesl-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df  Chisq p.value
## 1 session  3   0.00   >.999
## 2      fd  1 2.98 +    .084
## 3     vas  1   0.00   >.999
## 4     bis  1   0.00   >.999
## 5     age  1   0.14    .709
## 6     sex  1   0.43    .513
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Number of hubs

![(\#fig:dgn-repmesl-hubs)Integrated metric of number of hubs by session.](main_files/figure-latex/dgn-repmesl-hubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3 11.12 *    .011
## 2      fd  1    0.90    .342
## 3     vas  1    0.01    .927
## 4     bis  1  4.81 *    .028
## 5     age  1    0.01    .917
## 6     sex  1 7.80 **    .005
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency

![(\#fig:dgn-repmesl-eglob)Integrated metric of global efficiency by session.](main_files/figure-latex/dgn-repmesl-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df Chisq p.value
## 1 session  3  0.47    .926
## 2      fd  1  0.22    .642
## 3     vas  1  1.12    .289
## 4     bis  1  1.51    .219
## 5     age  1  0.27    .604
## 6     sex  1  2.46    .117
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency (weighted)

![(\#fig:dgn-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_files/figure-latex/dgn-repmesl-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      2.05    .561
## 2      fd  1    3.44 +    .064
## 3     vas  1      2.29    .130
## 4     bis  1   7.13 **    .008
## 5     age  1      0.05    .819
## 6     sex  1 12.24 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency

![(\#fig:dgn-repmesl-eloc)Integrated metric of local efficiency by session.](main_files/figure-latex/dgn-repmesl-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3  7.97 *    .047
## 2      fd  1    1.20    .273
## 3     vas  1  3.34 +    .068
## 4     bis  1  2.97 +    .085
## 5     age  1    0.35    .553
## 6     sex  1 7.79 **    .005
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency (weighted)

![(\#fig:dgn-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_files/figure-latex/dgn-repmesl-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    2.04    .564
## 2      fd  1    2.18    .140
## 3     vas  1    1.70    .192
## 4     bis  1  5.46 *    .019
## 5     age  1    0.01    .910
## 6     sex  1 9.92 **    .002
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



## Schaefer-100 (with Global Signal)





### Acute phase

![(\#fig:ds1g-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/ds1g-sparklines-acute-1.pdf) 



#### Density

![(\#fig:ds1g-repmes-density)Integrated metric of density by group.](main_files/figure-latex/ds1g-repmes-density-1.pdf) 

##### Likelihood Ratio Test of Fixed effects


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1    2.94 +    .086
## 2         group  1      1.54    .215
## 3            fd  1 14.42 ***   <.001
## 4           vas  1      0.00    .998
## 5           bis  1      0.81    .369
## 6           age  1      0.00    .970
## 7           sex  1 12.49 ***   <.001
## 8 session:group  1      1.36    .243
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-density) Mixed Effects Model for Density.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & density \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.003 \\ 
  & (0.012) \\ 
  & \\ 
 groupSham & $-$0.00004 \\ 
  & (0.010) \\ 
  & \\ 
 fd & 0.167$^{***}$ \\ 
  & (0.041) \\ 
  & \\ 
 sexF & $-$0.045$^{***}$ \\ 
  & (0.012) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.023 \\ 
  & (0.018) \\ 
  & \\ 
 Constant & 0.441$^{***}$ \\ 
  & (0.054) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 2,246.309 \\ 
Akaike Inf. Crit. & $-$4,470.618 \\ 
Bayesian Inf. Crit. & $-$4,410.252 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Strength

![(\#fig:ds1g-repmes-strength)Integrated metric of strength by group.](main_files/figure-latex/ds1g-repmes-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.40    .529
## 2         group  1      0.08    .781
## 3            fd  1 12.11 ***   <.001
## 4           vas  1      0.05    .818
## 5           bis  1      0.04    .836
## 6           age  1      0.35    .553
## 7           sex  1   7.30 **    .007
## 8 session:group  1      2.29    .130
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-strength) Mixed Effects Model for Strength.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & strength \\ 
\hline \\[-1.8ex] 
 sessionT1 & 1.030 \\ 
  & (1.319) \\ 
  & \\ 
 groupSham & 1.288 \\ 
  & (1.222) \\ 
  & \\ 
 fd & 19.248$^{***}$ \\ 
  & (5.102) \\ 
  & \\ 
 sexF & $-$4.692$^{***}$ \\ 
  & (1.654) \\ 
  & \\ 
 sessionT1:groupSham & $-$3.098 \\ 
  & (1.947) \\ 
  & \\ 
 Constant & 14.817$^{***}$ \\ 
  & (2.031) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & $-$5,026.004 \\ 
Akaike Inf. Crit. & 10,074.010 \\ 
Bayesian Inf. Crit. & 10,134.370 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Modularity

![(\#fig:ds1g-repmes-mod)Integrated metric of modularity by group.](main_files/figure-latex/ds1g-repmes-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      2.08    .150
## 2         group  1      0.24    .625
## 3            fd  1 11.04 ***   <.001
## 4           vas  1      0.55    .459
## 5           bis  1      1.63    .201
## 6           age  1      0.33    .563
## 7           sex  1   9.90 **    .002
## 8 session:group  1      1.23    .268
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-mod) mixed effects model for modularity.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & mod.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.004 \\ 
  & (0.017) \\ 
  & \\ 
 groupSham & $-$0.010 \\ 
  & (0.015) \\ 
  & \\ 
 fd & $-$0.218$^{***}$ \\ 
  & (0.062) \\ 
  & \\ 
 sexF & 0.063$^{***}$ \\ 
  & (0.019) \\ 
  & \\ 
 sessionT1:groupSham & 0.034 \\ 
  & (0.025) \\ 
  & \\ 
 Constant & 0.362$^{***}$ \\ 
  & (0.032) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 3,450.767 \\ 
Akaike Inf. Crit. & $-$6,879.533 \\ 
Bayesian Inf. Crit. & $-$6,819.168 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 


#### Number of hubs

![(\#fig:ds1g-repmes-nhubs)Integrated metric of the number of hubs by group.](main_files/figure-latex/ds1g-repmes-nhubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df Chisq p.value
## 1       session  1  0.29    .591
## 2         group  1  2.58    .108
## 3            fd  1  0.49    .485
## 4           vas  1  0.54    .463
## 5           bis  1  1.44    .230
## 6           age  1  0.81    .369
## 7           sex  1  0.05    .825
## 8 session:group  1  0.24    .623
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-nhubs) mixed effects model for number of hubs.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & num.hubs.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.240 \\ 
  & (0.523) \\ 
  & \\ 
 groupSham & 0.417 \\ 
  & (0.575) \\ 
  & \\ 
 fd & $-$1.286 \\ 
  & (2.060) \\ 
  & \\ 
 sexF & 0.035 \\ 
  & (0.576) \\ 
  & \\ 
 sessionT1:groupSham & 0.572 \\ 
  & (0.771) \\ 
  & \\ 
 Constant & 25.589$^{***}$ \\ 
  & (0.720) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & $-$3,845.673 \\ 
Akaike Inf. Crit. & 7,713.346 \\ 
Bayesian Inf. Crit. & 7,773.711 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency

![(\#fig:ds1g-repmes-eglob)Integrated metric of global efficiency by group.](main_files/figure-latex/ds1g-repmes-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1    5.45 *    .020
## 2         group  1    3.33 +    .068
## 3            fd  1 16.66 ***   <.001
## 4           vas  1      0.22    .638
## 5           bis  1      1.29    .257
## 6           age  1      0.00    .992
## 7           sex  1 14.24 ***   <.001
## 8 session:group  1      1.62    .203
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-ge) mixed effects model for Global Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.003 \\ 
  & (0.006) \\ 
  & \\ 
 groupSham & $-$0.002 \\ 
  & (0.005) \\ 
  & \\ 
 fd & 0.089$^{***}$ \\ 
  & (0.021) \\ 
  & \\ 
 sexF & $-$0.024$^{***}$ \\ 
  & (0.006) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.013 \\ 
  & (0.009) \\ 
  & \\ 
 Constant & 0.684$^{***}$ \\ 
  & (0.042) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 3,363.197 \\ 
Akaike Inf. Crit. & $-$6,704.395 \\ 
Bayesian Inf. Crit. & $-$6,644.030 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency (weighted)

![(\#fig:ds1g-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_files/figure-latex/ds1g-repmes-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.41    .523
## 2         group  1      0.10    .754
## 3            fd  1 13.20 ***   <.001
## 4           vas  1      0.09    .766
## 5           bis  1      0.02    .892
## 6           age  1      0.32    .573
## 7           sex  1   7.46 **    .006
## 8 session:group  1      2.60    .107
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-gew) mixed effects model for Global Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.013 \\ 
  & (0.015) \\ 
  & \\ 
 groupSham & 0.015 \\ 
  & (0.014) \\ 
  & \\ 
 fd & 0.227$^{***}$ \\ 
  & (0.057) \\ 
  & \\ 
 sexF & $-$0.053$^{***}$ \\ 
  & (0.019) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.037$^{*}$ \\ 
  & (0.022) \\ 
  & \\ 
 Constant & 0.273$^{***}$ \\ 
  & (0.018) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,023.172 \\ 
Akaike Inf. Crit. & $-$8,024.344 \\ 
Bayesian Inf. Crit. & $-$7,963.979 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency

![(\#fig:ds1g-repmes-eloc)Integrated metric of local efficiency by group.](main_files/figure-latex/ds1g-repmes-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    0.36    .548
## 2         group  1    0.06    .804
## 3            fd  1 8.10 **    .004
## 4           vas  1    0.51    .473
## 5           bis  1    0.41    .524
## 6           age  1    0.08    .776
## 7           sex  1  4.92 *    .026
## 8 session:group  1    1.08    .299
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-eloc) mixed effects model for Local Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.001 \\ 
  & (0.005) \\ 
  & \\ 
 groupSham & 0.003 \\ 
  & (0.005) \\ 
  & \\ 
 fd & 0.055$^{***}$ \\ 
  & (0.019) \\ 
  & \\ 
 sexF & $-$0.013$^{**}$ \\ 
  & (0.006) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.008 \\ 
  & (0.008) \\ 
  & \\ 
 Constant & 0.848$^{***}$ \\ 
  & (0.010) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,148.832 \\ 
Akaike Inf. Crit. & $-$8,275.664 \\ 
Bayesian Inf. Crit. & $-$8,215.299 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency (weighted)

![(\#fig:ds1g-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_files/figure-latex/ds1g-repmes-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    0.06    .803
## 2         group  1    0.01    .941
## 3            fd  1 9.95 **    .002
## 4           vas  1    0.01    .930
## 5           bis  1    0.00    .966
## 6           age  1    0.25    .619
## 7           sex  1  5.17 *    .023
## 8 session:group  1    2.11    .146
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-elocw) mixed effects model for Local Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.016 \\ 
  & (0.017) \\ 
  & \\ 
 groupSham & 0.019 \\ 
  & (0.017) \\ 
  & \\ 
 fd & 0.235$^{***}$ \\ 
  & (0.070) \\ 
  & \\ 
 sexF & $-$0.053$^{**}$ \\ 
  & (0.023) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.038 \\ 
  & (0.026) \\ 
  & \\ 
 Constant & 0.352$^{***}$ \\ 
  & (0.021) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 3,777.738 \\ 
Akaike Inf. Crit. & $-$7,533.476 \\ 
Bayesian Inf. Crit. & $-$7,473.111 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

### Maintenance phase

![(\#fig:ds1g-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/ds1g-sparklines-long-1.pdf) 



#### Density

![(\#fig:ds1g-repmesl-density)Integrated metric of density by session.](main_files/figure-latex/ds1g-repmesl-density-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      1.01    .798
## 2      fd  1      0.09    .767
## 3     vas  1      0.90    .342
## 4     bis  1      0.00   >.999
## 5     age  1      0.00   >.999
## 6     sex  1 29.35 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Strength

![(\#fig:ds1g-repmesl-strength)Integrated metric of strength by session.](main_files/figure-latex/ds1g-repmesl-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      3.31    .346
## 2      fd  1   7.44 **    .006
## 3     vas  1   8.01 **    .005
## 4     bis  1      0.85    .357
## 5     age  1      1.73    .188
## 6     sex  1 13.26 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Modularity

![(\#fig:ds1g-repmesl-mod)Integrated metric of modularity by session.](main_files/figure-latex/ds1g-repmesl-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      0.21    .977
## 2      fd  1    3.56 +    .059
## 3     vas  1      0.41    .520
## 4     bis  1      1.64    .200
## 5     age  1      1.14    .286
## 6     sex  1 11.13 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Number of hubs

![(\#fig:ds1g-repmesl-hubs)Integrated metric of number of hubs by session.](main_files/figure-latex/ds1g-repmesl-hubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df  Chisq p.value
## 1 session  3   5.56    .135
## 2      fd  1   0.09    .770
## 3     vas  1   0.05    .818
## 4     bis  1   2.31    .129
## 5     age  1 3.06 +    .080
## 6     sex  1   1.91    .167
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency

![(\#fig:ds1g-repmesl-eglob)Integrated metric of global efficiency by session.](main_files/figure-latex/ds1g-repmesl-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      0.00   >.999
## 2      fd  1    4.47 *    .035
## 3     vas  1      0.00   >.999
## 4     bis  1      0.00   >.999
## 5     age  1      0.00   >.999
## 6     sex  1 35.20 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency (weighted)

![(\#fig:ds1g-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_files/figure-latex/ds1g-repmesl-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      4.04    .257
## 2      fd  1   9.38 **    .002
## 3     vas  1   7.91 **    .005
## 4     bis  1      0.30    .584
## 5     age  1      1.63    .202
## 6     sex  1 11.19 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency

![(\#fig:ds1g-repmesl-eloc)Integrated metric of local efficiency by session.](main_files/figure-latex/ds1g-repmesl-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      1.34    .720
## 2      fd  1      1.56    .212
## 3     vas  1    6.00 *    .014
## 4     bis  1      2.30    .129
## 5     age  1      0.78    .377
## 6     sex  1 13.82 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency (weighted)

![(\#fig:ds1g-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_files/figure-latex/ds1g-repmesl-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      4.50    .212
## 2      fd  1   6.78 **    .009
## 3     vas  1   9.23 **    .002
## 4     bis  1      0.01    .942
## 5     age  1      0.22    .641
## 6     sex  1 11.78 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



## Schaefer-100 (without Global Signal)





### Acute phase

![(\#fig:ds1n-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/ds1n-sparklines-acute-1.pdf) 



#### Density

![(\#fig:ds1n-repmes-density)Integrated metric of density by group.](main_files/figure-latex/ds1n-repmes-density-1.pdf) 

##### Likelihood Ratio Test of Fixed effects


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1  2.71 +    .100
## 2         group  1    0.49    .483
## 3            fd  1  6.20 *    .013
## 4           vas  1    0.02    .875
## 5           bis  1 6.92 **    .009
## 6           age  1    1.56    .211
## 7           sex  1  3.04 +    .081
## 8 session:group  1    0.27    .602
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-density) Mixed Effects Model for Density.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & density \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.001 \\ 
  & (0.003) \\ 
  & \\ 
 groupSham & 0.0003 \\ 
  & (0.003) \\ 
  & \\ 
 fd & 0.021$^{**}$ \\ 
  & (0.010) \\ 
  & \\ 
 sexF & $-$0.006$^{*}$ \\ 
  & (0.003) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.003 \\ 
  & (0.004) \\ 
  & \\ 
 Constant & 0.492$^{***}$ \\ 
  & (0.063) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,208.842 \\ 
Akaike Inf. Crit. & $-$8,395.683 \\ 
Bayesian Inf. Crit. & $-$8,335.318 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Strength

![(\#fig:ds1n-repmes-strength)Integrated metric of strength by group.](main_files/figure-latex/ds1n-repmes-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.39    .238
## 2         group  1    0.19    .666
## 3            fd  1 8.35 **    .004
## 4           vas  1    0.01    .917
## 5           bis  1  4.40 *    .036
## 6           age  1    0.31    .575
## 7           sex  1  4.93 *    .026
## 8 session:group  1    1.39    .239
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-strength) Mixed Effects Model for Strength.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & strength \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.828 \\ 
  & (1.199) \\ 
  & \\ 
 groupSham & 0.804 \\ 
  & (1.425) \\ 
  & \\ 
 fd & 15.296$^{***}$ \\ 
  & (5.482) \\ 
  & \\ 
 sexF & $-$4.224$^{**}$ \\ 
  & (1.799) \\ 
  & \\ 
 sessionT1:groupSham & $-$2.879 \\ 
  & (1.768) \\ 
  & \\ 
 Constant & 22.851$^{***}$ \\ 
  & (2.920) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & $-$5,141.226 \\ 
Akaike Inf. Crit. & 10,304.450 \\ 
Bayesian Inf. Crit. & 10,364.820 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Modularity

![(\#fig:ds1n-repmes-mod)Integrated metric of modularity by group.](main_files/figure-latex/ds1n-repmes-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1  3.58 +    .059
## 2         group  1    0.02    .877
## 3            fd  1  4.68 *    .030
## 4           vas  1    0.60    .437
## 5           bis  1  5.18 *    .023
## 6           age  1    0.42    .519
## 7           sex  1 7.41 **    .006
## 8 session:group  1    0.09    .768
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-mod) mixed effects model for modularity.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & mod.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.004 \\ 
  & (0.011) \\ 
  & \\ 
 groupSham & $-$0.004 \\ 
  & (0.011) \\ 
  & \\ 
 fd & $-$0.086$^{*}$ \\ 
  & (0.046) \\ 
  & \\ 
 sexF & 0.042$^{***}$ \\ 
  & (0.015) \\ 
  & \\ 
 sessionT1:groupSham & 0.014 \\ 
  & (0.017) \\ 
  & \\ 
 Constant & 0.266$^{***}$ \\ 
  & (0.033) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 3,934.229 \\ 
Akaike Inf. Crit. & $-$7,846.459 \\ 
Bayesian Inf. Crit. & $-$7,786.094 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 


#### Number of hubs

![(\#fig:ds1n-repmes-nhubs)Integrated metric of the number of hubs by group.](main_files/figure-latex/ds1n-repmes-nhubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df Chisq p.value
## 1       session  1  1.92    .166
## 2         group  1  2.31    .129
## 3            fd  1  2.47    .116
## 4           vas  1  1.87    .172
## 5           bis  1  1.72    .190
## 6           age  1  0.54    .464
## 7           sex  1  0.35    .552
## 8 session:group  1  0.63    .426
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-nhubs) mixed effects model for number of hubs.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & num.hubs.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.604 \\ 
  & (0.383) \\ 
  & \\ 
 groupSham & 0.294 \\ 
  & (0.387) \\ 
  & \\ 
 fd & $-$2.142 \\ 
  & (1.504) \\ 
  & \\ 
 sexF & 0.286 \\ 
  & (0.436) \\ 
  & \\ 
 sessionT1:groupSham & 0.438 \\ 
  & (0.564) \\ 
  & \\ 
 Constant & 25.819$^{***}$ \\ 
  & (0.605) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & $-$3,979.601 \\ 
Akaike Inf. Crit. & 7,981.202 \\ 
Bayesian Inf. Crit. & 8,041.567 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency

![(\#fig:ds1n-repmes-eglob)Integrated metric of global efficiency by group.](main_files/figure-latex/ds1n-repmes-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   1.42    .233
## 2         group  1 5.65 *    .017
## 3            fd  1   1.63    .202
## 4           vas  1   0.02    .900
## 5           bis  1   1.17    .280
## 6           age  1   0.01    .937
## 7           sex  1   2.42    .120
## 8 session:group  1   0.07    .796
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-ge) mixed effects model for Global Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.001 \\ 
  & (0.002) \\ 
  & \\ 
 groupSham & $-$0.004$^{*}$ \\ 
  & (0.002) \\ 
  & \\ 
 fd & 0.011 \\ 
  & (0.009) \\ 
  & \\ 
 sexF & $-$0.004 \\ 
  & (0.003) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.001 \\ 
  & (0.003) \\ 
  & \\ 
 Constant & 0.707$^{***}$ \\ 
  & (0.047) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,604.409 \\ 
Akaike Inf. Crit. & $-$9,186.818 \\ 
Bayesian Inf. Crit. & $-$9,126.452 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency (weighted)

![(\#fig:ds1n-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_files/figure-latex/ds1n-repmes-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.48    .224
## 2         group  1    0.42    .515
## 3            fd  1 8.99 **    .003
## 4           vas  1    0.03    .856
## 5           bis  1  4.39 *    .036
## 6           age  1    0.23    .632
## 7           sex  1  5.40 *    .020
## 8 session:group  1    1.53    .215
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-gew) mixed effects model for Global Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.010 \\ 
  & (0.014) \\ 
  & \\ 
 groupSham & 0.007 \\ 
  & (0.017) \\ 
  & \\ 
 fd & 0.190$^{***}$ \\ 
  & (0.065) \\ 
  & \\ 
 sexF & $-$0.053$^{**}$ \\ 
  & (0.022) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.035$^{*}$ \\ 
  & (0.021) \\ 
  & \\ 
 Constant & 0.364$^{***}$ \\ 
  & (0.024) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 3,540.021 \\ 
Akaike Inf. Crit. & $-$7,058.043 \\ 
Bayesian Inf. Crit. & $-$6,997.678 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency

![(\#fig:ds1n-repmes-eloc)Integrated metric of local efficiency by group.](main_files/figure-latex/ds1n-repmes-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   0.28    .597
## 2         group  1   0.87    .350
## 3            fd  1   1.44    .230
## 4           vas  1   0.34    .558
## 5           bis  1 5.64 *    .018
## 6           age  1   1.20    .274
## 7           sex  1   0.33    .567
## 8 session:group  1   0.10    .757
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-eloc) mixed effects model for Local Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.0004 \\ 
  & (0.002) \\ 
  & \\ 
 groupSham & 0.002 \\ 
  & (0.003) \\ 
  & \\ 
 fd & 0.009 \\ 
  & (0.010) \\ 
  & \\ 
 sexF & $-$0.002 \\ 
  & (0.003) \\ 
  & \\ 
 sessionT1:groupSham & 0.0001 \\ 
  & (0.004) \\ 
  & \\ 
 Constant & 0.874$^{***}$ \\ 
  & (0.012) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,818.358 \\ 
Akaike Inf. Crit. & $-$9,614.717 \\ 
Bayesian Inf. Crit. & $-$9,554.352 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency (weighted)

![(\#fig:ds1n-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_files/figure-latex/ds1n-repmes-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    0.99    .319
## 2         group  1    0.15    .703
## 3            fd  1 7.89 **    .005
## 4           vas  1    0.01    .931
## 5           bis  1  4.30 *    .038
## 6           age  1    0.15    .696
## 7           sex  1  4.38 *    .036
## 8 session:group  1    1.25    .264
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-elocw) mixed effects model for Local Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.013 \\ 
  & (0.017) \\ 
  & \\ 
 groupSham & 0.011 \\ 
  & (0.021) \\ 
  & \\ 
 fd & 0.212$^{***}$ \\ 
  & (0.078) \\ 
  & \\ 
 sexF & $-$0.056$^{**}$ \\ 
  & (0.026) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.039 \\ 
  & (0.025) \\ 
  & \\ 
 Constant & 0.455$^{***}$ \\ 
  & (0.023) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 3,346.698 \\ 
Akaike Inf. Crit. & $-$6,671.397 \\ 
Bayesian Inf. Crit. & $-$6,611.032 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

### Maintenance phase

![(\#fig:ds1n-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/ds1n-sparklines-long-1.pdf) 



#### Density

![(\#fig:ds1n-repmesl-density)Integrated metric of density by session.](main_files/figure-latex/ds1n-repmesl-density-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3 22.86 ***   <.001
## 2      fd  1      0.00    .974
## 3     vas  1      1.04    .307
## 4     bis  1      2.00    .157
## 5     age  1      0.23    .635
## 6     sex  1 18.00 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Strength

![(\#fig:ds1n-repmesl-strength)Integrated metric of strength by session.](main_files/figure-latex/ds1n-repmesl-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df    Chisq p.value
## 1 session  3     3.88    .275
## 2      fd  1     0.31    .577
## 3     vas  1     1.98    .160
## 4     bis  1 10.68 **    .001
## 5     age  1     0.47    .493
## 6     sex  1 10.80 **    .001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Modularity

![(\#fig:ds1n-repmesl-mod)Integrated metric of modularity by session.](main_files/figure-latex/ds1n-repmesl-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    0.63    .890
## 2      fd  1    0.01    .919
## 3     vas  1    0.38    .538
## 4     bis  1  3.09 +    .079
## 5     age  1  3.35 +    .067
## 6     sex  1 7.66 **    .006
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Number of hubs

![(\#fig:ds1n-repmesl-hubs)Integrated metric of number of hubs by session.](main_files/figure-latex/ds1n-repmesl-hubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df  Chisq p.value
## 1 session  3 7.91 *    .048
## 2      fd  1   2.63    .105
## 3     vas  1   0.36    .548
## 4     bis  1 2.85 +    .092
## 5     age  1   0.01    .910
## 6     sex  1   0.64    .423
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency

![(\#fig:ds1n-repmesl-eglob)Integrated metric of global efficiency by session.](main_files/figure-latex/ds1n-repmesl-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df Chisq p.value
## 1 session  3  0.37    .946
## 2      fd  1  0.00   >.999
## 3     vas  1  0.00   >.999
## 4     bis  1  0.00   >.999
## 5     age  1  0.00   >.999
## 6     sex  1  0.00   >.999
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency (weighted)

![(\#fig:ds1n-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_files/figure-latex/ds1n-repmesl-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      4.25    .236
## 2      fd  1      0.29    .593
## 3     vas  1      1.28    .257
## 4     bis  1 11.51 ***   <.001
## 5     age  1      0.48    .490
## 6     sex  1 11.01 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency

![(\#fig:ds1n-repmesl-eloc)Integrated metric of local efficiency by session.](main_files/figure-latex/ds1n-repmesl-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df  Chisq p.value
## 1 session  3   1.88    .599
## 2      fd  1 6.26 *    .012
## 3     vas  1   1.02    .312
## 4     bis  1 5.23 *    .022
## 5     age  1 6.30 *    .012
## 6     sex  1   1.26    .262
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency (weighted)

![(\#fig:ds1n-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_files/figure-latex/ds1n-repmesl-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    3.02    .389
## 2      fd  1    0.61    .434
## 3     vas  1    2.68    .102
## 4     bis  1 8.65 **    .003
## 5     age  1    0.32    .574
## 6     sex  1 7.57 **    .006
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



## Schaefer-200 (with Global Signal)





### Acute phase

![(\#fig:ds2g-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/ds2g-sparklines-acute-1.pdf) 



#### Density

![(\#fig:ds2g-repmes-density)Integrated metric of density by group.](main_files/figure-latex/ds2g-repmes-density-1.pdf) 

##### Likelihood Ratio Test of Fixed effects


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1    2.71 +    .100
## 2         group  1      1.62    .203
## 3            fd  1 14.49 ***   <.001
## 4           vas  1      0.00    .962
## 5           bis  1      1.00    .318
## 6           age  1      0.04    .833
## 7           sex  1 13.56 ***   <.001
## 8 session:group  1      1.36    .244
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-density) Mixed Effects Model for Density.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & density \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.002 \\ 
  & (0.011) \\ 
  & \\ 
 groupSham & $-$0.0004 \\ 
  & (0.009) \\ 
  & \\ 
 fd & 0.154$^{***}$ \\ 
  & (0.038) \\ 
  & \\ 
 sexF & $-$0.044$^{***}$ \\ 
  & (0.011) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.021 \\ 
  & (0.016) \\ 
  & \\ 
 Constant & 0.438$^{***}$ \\ 
  & (0.053) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 2,341.846 \\ 
Akaike Inf. Crit. & $-$4,661.691 \\ 
Bayesian Inf. Crit. & $-$4,601.326 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Strength

![(\#fig:ds2g-repmes-strength)Integrated metric of strength by group.](main_files/figure-latex/ds2g-repmes-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.24    .624
## 2         group  1      0.10    .755
## 3            fd  1 12.49 ***   <.001
## 4           vas  1      0.12    .732
## 5           bis  1      0.00    .958
## 6           age  1      0.57    .452
## 7           sex  1   7.35 **    .007
## 8 session:group  1      2.10    .148
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-strength) Mixed Effects Model for Strength.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & strength \\ 
\hline \\[-1.8ex] 
 sessionT1 & 1.913 \\ 
  & (2.398) \\ 
  & \\ 
 groupSham & 2.192 \\ 
  & (2.141) \\ 
  & \\ 
 fd & 34.669$^{***}$ \\ 
  & (9.017) \\ 
  & \\ 
 sexF & $-$8.237$^{***}$ \\ 
  & (2.912) \\ 
  & \\ 
 sessionT1:groupSham & $-$5.296 \\ 
  & (3.543) \\ 
  & \\ 
 Constant & 26.779$^{***}$ \\ 
  & (3.548) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & $-$5,986.628 \\ 
Akaike Inf. Crit. & 11,995.260 \\ 
Bayesian Inf. Crit. & 12,055.620 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Modularity

![(\#fig:ds2g-repmes-mod)Integrated metric of modularity by group.](main_files/figure-latex/ds2g-repmes-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      1.59    .207
## 2         group  1      0.22    .637
## 3            fd  1 12.92 ***   <.001
## 4           vas  1      0.58    .446
## 5           bis  1      1.53    .216
## 6           age  1      0.35    .552
## 7           sex  1  10.30 **    .001
## 8 session:group  1      1.26    .262
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-mod) mixed effects model for modularity.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & mod.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.007 \\ 
  & (0.017) \\ 
  & \\ 
 groupSham & $-$0.011 \\ 
  & (0.014) \\ 
  & \\ 
 fd & $-$0.234$^{***}$ \\ 
  & (0.061) \\ 
  & \\ 
 sexF & 0.062$^{***}$ \\ 
  & (0.019) \\ 
  & \\ 
 sessionT1:groupSham & 0.035 \\ 
  & (0.026) \\ 
  & \\ 
 Constant & 0.355$^{***}$ \\ 
  & (0.029) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 3,700.761 \\ 
Akaike Inf. Crit. & $-$7,379.522 \\ 
Bayesian Inf. Crit. & $-$7,319.157 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 


#### Number of hubs

![(\#fig:ds2g-repmes-nhubs)Integrated metric of the number of hubs by group.](main_files/figure-latex/ds2g-repmes-nhubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   1.11    .292
## 2         group  1   0.76    .383
## 3            fd  1 3.15 +    .076
## 4           vas  1   1.17    .279
## 5           bis  1   1.23    .268
## 6           age  1   1.87    .171
## 7           sex  1 3.29 +    .070
## 8 session:group  1   1.43    .232
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-nhubs) mixed effects model for number of hubs.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & num.hubs.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.046 \\ 
  & (0.899) \\ 
  & \\ 
 groupSham & $-$0.272 \\ 
  & (0.871) \\ 
  & \\ 
 fd & $-$5.932$^{*}$ \\ 
  & (3.507) \\ 
  & \\ 
 sexF & $-$1.504 \\ 
  & (1.041) \\ 
  & \\ 
 sessionT1:groupSham & 1.579 \\ 
  & (1.326) \\ 
  & \\ 
 Constant & 52.632$^{***}$ \\ 
  & (1.174) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & $-$4,652.590 \\ 
Akaike Inf. Crit. & 9,327.179 \\ 
Bayesian Inf. Crit. & 9,387.544 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency

![(\#fig:ds2g-repmes-eglob)Integrated metric of global efficiency by group.](main_files/figure-latex/ds2g-repmes-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1    5.19 *    .023
## 2         group  1    4.38 *    .036
## 3            fd  1 16.34 ***   <.001
## 4           vas  1      0.10    .751
## 5           bis  1      1.99    .158
## 6           age  1      0.04    .836
## 7           sex  1 14.64 ***   <.001
## 8 session:group  1      1.68    .194
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-ge) mixed effects model for Global Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.002 \\ 
  & (0.005) \\ 
  & \\ 
 groupSham & $-$0.003 \\ 
  & (0.005) \\ 
  & \\ 
 fd & 0.078$^{***}$ \\ 
  & (0.019) \\ 
  & \\ 
 sexF & $-$0.022$^{***}$ \\ 
  & (0.006) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.011 \\ 
  & (0.007) \\ 
  & \\ 
 Constant & 0.691$^{***}$ \\ 
  & (0.038) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 3,445.160 \\ 
Akaike Inf. Crit. & $-$6,868.321 \\ 
Bayesian Inf. Crit. & $-$6,807.956 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency (weighted)

![(\#fig:ds2g-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_files/figure-latex/ds2g-repmes-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.25    .615
## 2         group  1      0.17    .680
## 3            fd  1 13.81 ***   <.001
## 4           vas  1      0.17    .679
## 5           bis  1      0.02    .882
## 6           age  1      0.58    .446
## 7           sex  1   7.67 **    .006
## 8 session:group  1      2.31    .129
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-gew) mixed effects model for Global Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.011 \\ 
  & (0.013) \\ 
  & \\ 
 groupSham & 0.012 \\ 
  & (0.012) \\ 
  & \\ 
 fd & 0.200$^{***}$ \\ 
  & (0.049) \\ 
  & \\ 
 sexF & $-$0.045$^{***}$ \\ 
  & (0.016) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.030 \\ 
  & (0.019) \\ 
  & \\ 
 Constant & 0.264$^{***}$ \\ 
  & (0.015) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,430.370 \\ 
Akaike Inf. Crit. & $-$8,838.739 \\ 
Bayesian Inf. Crit. & $-$8,778.374 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency

![(\#fig:ds2g-repmes-eloc)Integrated metric of local efficiency by group.](main_files/figure-latex/ds2g-repmes-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    0.25    .616
## 2         group  1    0.16    .689
## 3            fd  1 7.62 **    .006
## 4           vas  1    0.48    .490
## 5           bis  1    0.06    .807
## 6           age  1    0.09    .764
## 7           sex  1  6.24 *    .013
## 8 session:group  1    1.08    .299
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-eloc) mixed effects model for Local Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.001 \\ 
  & (0.005) \\ 
  & \\ 
 groupSham & 0.002 \\ 
  & (0.005) \\ 
  & \\ 
 fd & 0.057$^{***}$ \\ 
  & (0.020) \\ 
  & \\ 
 sexF & $-$0.016$^{***}$ \\ 
  & (0.006) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.008 \\ 
  & (0.008) \\ 
  & \\ 
 Constant & 0.839$^{***}$ \\ 
  & (0.011) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,256.790 \\ 
Akaike Inf. Crit. & $-$8,491.580 \\ 
Bayesian Inf. Crit. & $-$8,431.215 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency (weighted)

![(\#fig:ds2g-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_files/figure-latex/ds2g-repmes-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df    Chisq p.value
## 1       session  1     0.01    .915
## 2         group  1     0.01    .903
## 3            fd  1 10.32 **    .001
## 4           vas  1     0.04    .837
## 5           bis  1     0.14    .712
## 6           age  1     0.57    .451
## 7           sex  1   5.71 *    .017
## 8 session:group  1     1.88    .171
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-elocw) mixed effects model for Local Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.014 \\ 
  & (0.016) \\ 
  & \\ 
 groupSham & 0.016 \\ 
  & (0.015) \\ 
  & \\ 
 fd & 0.214$^{***}$ \\ 
  & (0.062) \\ 
  & \\ 
 sexF & $-$0.049$^{**}$ \\ 
  & (0.020) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.032 \\ 
  & (0.024) \\ 
  & \\ 
 Constant & 0.337$^{***}$ \\ 
  & (0.020) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,152.968 \\ 
Akaike Inf. Crit. & $-$8,283.935 \\ 
Bayesian Inf. Crit. & $-$8,223.570 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

### Maintenance phase

![(\#fig:ds2g-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/ds2g-sparklines-long-1.pdf) 



#### Density

![(\#fig:ds2g-repmesl-density)Integrated metric of density by session.](main_files/figure-latex/ds2g-repmesl-density-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      1.44    .696
## 2      fd  1      2.69    .101
## 3     vas  1      2.19    .139
## 4     bis  1      2.59    .107
## 5     age  1      0.00   >.999
## 6     sex  1 23.43 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Strength

![(\#fig:ds2g-repmesl-strength)Integrated metric of strength by session.](main_files/figure-latex/ds2g-repmesl-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      3.13    .372
## 2      fd  1    5.97 *    .015
## 3     vas  1    6.48 *    .011
## 4     bis  1      0.47    .491
## 5     age  1      0.86    .352
## 6     sex  1 11.57 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Modularity

![(\#fig:ds2g-repmesl-mod)Integrated metric of modularity by session.](main_files/figure-latex/ds2g-repmesl-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    0.75    .863
## 2      fd  1  4.22 *    .040
## 3     vas  1    0.59    .441
## 4     bis  1    2.45    .117
## 5     age  1    1.33    .250
## 6     sex  1 8.01 **    .005
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Number of hubs

![(\#fig:ds2g-repmesl-hubs)Integrated metric of number of hubs by session.](main_files/figure-latex/ds2g-repmesl-hubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      0.15    .985
## 2      fd  1   8.28 **    .004
## 3     vas  1      0.00   >.999
## 4     bis  1      0.39    .534
## 5     age  1      0.30    .586
## 6     sex  1 18.76 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency

![(\#fig:ds2g-repmesl-eglob)Integrated metric of global efficiency by session.](main_files/figure-latex/ds2g-repmesl-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      2.47    .481
## 2      fd  1    5.45 *    .020
## 3     vas  1    3.03 +    .082
## 4     bis  1    4.36 *    .037
## 5     age  1      1.78    .182
## 6     sex  1 36.11 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency (weighted)

![(\#fig:ds2g-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_files/figure-latex/ds2g-repmesl-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df    Chisq p.value
## 1 session  3     3.25    .354
## 2      fd  1  6.84 **    .009
## 3     vas  1   5.89 *    .015
## 4     bis  1     0.07    .797
## 5     age  1     0.43    .510
## 6     sex  1 10.10 **    .001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency

![(\#fig:ds2g-repmesl-eloc)Integrated metric of local efficiency by session.](main_files/figure-latex/ds2g-repmesl-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      3.63    .305
## 2      fd  1      1.37    .241
## 3     vas  1    6.53 *    .011
## 4     bis  1      1.90    .168
## 5     age  1      0.70    .401
## 6     sex  1 14.51 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency (weighted)

![(\#fig:ds2g-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_files/figure-latex/ds2g-repmesl-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    4.10    .251
## 2      fd  1  3.48 +    .062
## 3     vas  1  5.89 *    .015
## 4     bis  1    0.03    .859
## 5     age  1    0.00    .954
## 6     sex  1 8.59 **    .003
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



## Schaefer-200 (without Global Signal)





### Acute phase

![(\#fig:ds2n-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/ds2n-sparklines-acute-1.pdf) 



#### Density

![(\#fig:ds2n-repmes-density)Integrated metric of density by group.](main_files/figure-latex/ds2n-repmes-density-1.pdf) 

##### Likelihood Ratio Test of Fixed effects


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    2.44    .118
## 2         group  1    0.72    .397
## 3            fd  1 6.77 **    .009
## 4           vas  1    0.12    .728
## 5           bis  1 7.92 **    .005
## 6           age  1    1.33    .249
## 7           sex  1  5.81 *    .016
## 8 session:group  1    0.38    .538
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-density) Mixed Effects Model for Density.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & density \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.0004 \\ 
  & (0.003) \\ 
  & \\ 
 groupSham & 0.0002 \\ 
  & (0.003) \\ 
  & \\ 
 fd & 0.026$^{**}$ \\ 
  & (0.012) \\ 
  & \\ 
 sexF & $-$0.009$^{**}$ \\ 
  & (0.004) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.004 \\ 
  & (0.005) \\ 
  & \\ 
 Constant & 0.489$^{***}$ \\ 
  & (0.062) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 3,910.826 \\ 
Akaike Inf. Crit. & $-$7,799.652 \\ 
Bayesian Inf. Crit. & $-$7,739.287 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Strength

![(\#fig:ds2n-repmes-strength)Integrated metric of strength by group.](main_files/figure-latex/ds2n-repmes-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.24    .266
## 2         group  1    0.27    .602
## 3            fd  1 8.06 **    .005
## 4           vas  1    0.03    .865
## 5           bis  1  3.77 +    .052
## 6           age  1    0.41    .524
## 7           sex  1  5.10 *    .024
## 8 session:group  1    1.41    .236
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-strength) Mixed Effects Model for Strength.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & strength \\ 
\hline \\[-1.8ex] 
 sessionT1 & 1.671 \\ 
  & (2.300) \\ 
  & \\ 
 groupSham & 1.385 \\ 
  & (2.710) \\ 
  & \\ 
 fd & 29.143$^{***}$ \\ 
  & (10.462) \\ 
  & \\ 
 sexF & $-$8.187$^{**}$ \\ 
  & (3.426) \\ 
  & \\ 
 sessionT1:groupSham & $-$5.479 \\ 
  & (3.390) \\ 
  & \\ 
 Constant & 41.324$^{***}$ \\ 
  & (5.215) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & $-$6,222.758 \\ 
Akaike Inf. Crit. & 12,467.520 \\ 
Bayesian Inf. Crit. & 12,527.880 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Modularity

![(\#fig:ds2n-repmes-mod)Integrated metric of modularity by group.](main_files/figure-latex/ds2n-repmes-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1  3.23 +    .072
## 2         group  1    0.19    .659
## 3            fd  1 7.22 **    .007
## 4           vas  1    0.36    .551
## 5           bis  1  6.40 *    .011
## 6           age  1    1.06    .304
## 7           sex  1 8.90 **    .003
## 8 session:group  1    0.30    .584
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-mod) mixed effects model for modularity.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & mod.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.001 \\ 
  & (0.013) \\ 
  & \\ 
 groupSham & $-$0.004 \\ 
  & (0.012) \\ 
  & \\ 
 fd & $-$0.116$^{**}$ \\ 
  & (0.049) \\ 
  & \\ 
 sexF & 0.047$^{***}$ \\ 
  & (0.015) \\ 
  & \\ 
 sessionT1:groupSham & 0.019 \\ 
  & (0.019) \\ 
  & \\ 
 Constant & 0.260$^{***}$ \\ 
  & (0.030) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,057.543 \\ 
Akaike Inf. Crit. & $-$8,093.087 \\ 
Bayesian Inf. Crit. & $-$8,032.722 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Number of hubs

![(\#fig:ds2n-repmes-nhubs)Integrated metric of the number of hubs by group.](main_files/figure-latex/ds2n-repmes-nhubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   0.01    .927
## 2         group  1   1.79    .181
## 3            fd  1   2.53    .112
## 4           vas  1   0.08    .782
## 5           bis  1   0.92    .337
## 6           age  1   0.08    .778
## 7           sex  1   2.25    .133
## 8 session:group  1 2.82 +    .093
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-nhubs) mixed effects model for number of hubs.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & num.hubs.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.975 \\ 
  & (0.714) \\ 
  & \\ 
 groupSham & $-$0.097 \\ 
  & (0.803) \\ 
  & \\ 
 fd & $-$4.568 \\ 
  & (2.978) \\ 
  & \\ 
 sexF & 1.310 \\ 
  & (0.868) \\ 
  & \\ 
 sessionT1:groupSham & 1.902$^{*}$ \\ 
  & (1.052) \\ 
  & \\ 
 Constant & 52.495$^{***}$ \\ 
  & (1.078) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & $-$4,674.642 \\ 
Akaike Inf. Crit. & 9,371.284 \\ 
Bayesian Inf. Crit. & 9,431.650 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency

![(\#fig:ds2n-repmes-eglob)Integrated metric of global efficiency by group.](main_files/figure-latex/ds2n-repmes-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    0.77    .379
## 2         group  1 7.14 **    .008
## 3            fd  1    0.87    .351
## 4           vas  1    0.00    .994
## 5           bis  1    1.18    .278
## 6           age  1    0.08    .784
## 7           sex  1    1.48    .224
## 8 session:group  1    0.13    .714
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-ge) mixed effects model for Global Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.0002 \\ 
  & (0.002) \\ 
  & \\ 
 groupSham & $-$0.005$^{*}$ \\ 
  & (0.002) \\ 
  & \\ 
 fd & 0.008 \\ 
  & (0.009) \\ 
  & \\ 
 sexF & $-$0.004 \\ 
  & (0.003) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.002 \\ 
  & (0.003) \\ 
  & \\ 
 Constant & 0.712$^{***}$ \\ 
  & (0.044) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,469.012 \\ 
Akaike Inf. Crit. & $-$8,916.024 \\ 
Bayesian Inf. Crit. & $-$8,855.659 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency (weighted)

![(\#fig:ds2n-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_files/figure-latex/ds2n-repmes-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.34    .248
## 2         group  1    0.61    .435
## 3            fd  1 8.77 **    .003
## 4           vas  1    0.06    .814
## 5           bis  1  3.92 *    .048
## 6           age  1    0.36    .546
## 7           sex  1  5.45 *    .020
## 8 session:group  1    1.62    .204
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-gew) mixed effects model for Global Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.010 \\ 
  & (0.013) \\ 
  & \\ 
 groupSham & 0.005 \\ 
  & (0.015) \\ 
  & \\ 
 fd & 0.172$^{***}$ \\ 
  & (0.059) \\ 
  & \\ 
 sexF & $-$0.048$^{**}$ \\ 
  & (0.020) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.032$^{*}$ \\ 
  & (0.019) \\ 
  & \\ 
 Constant & 0.343$^{***}$ \\ 
  & (0.020) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 3,796.940 \\ 
Akaike Inf. Crit. & $-$7,571.881 \\ 
Bayesian Inf. Crit. & $-$7,511.516 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency

![(\#fig:ds2n-repmes-eloc)Integrated metric of local efficiency by group.](main_files/figure-latex/ds2n-repmes-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    0.21    .649
## 2         group  1    0.05    .822
## 3            fd  1    1.28    .259
## 4           vas  1    1.24    .265
## 5           bis  1 7.52 **    .006
## 6           age  1    0.52    .471
## 7           sex  1    0.47    .492
## 8 session:group  1    0.01    .915
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-eloc) mixed effects model for Local Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.0003 \\ 
  & (0.003) \\ 
  & \\ 
 groupSham & $-$0.0001 \\ 
  & (0.003) \\ 
  & \\ 
 fd & 0.009 \\ 
  & (0.011) \\ 
  & \\ 
 sexF & $-$0.003 \\ 
  & (0.003) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.002 \\ 
  & (0.004) \\ 
  & \\ 
 Constant & 0.868$^{***}$ \\ 
  & (0.013) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,858.912 \\ 
Akaike Inf. Crit. & $-$9,695.824 \\ 
Bayesian Inf. Crit. & $-$9,635.459 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency (weighted)

![(\#fig:ds2n-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_files/figure-latex/ds2n-repmes-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    0.83    .362
## 2         group  1    0.24    .625
## 3            fd  1 6.89 **    .009
## 4           vas  1    0.02    .887
## 5           bis  1  3.66 +    .056
## 6           age  1    0.28    .598
## 7           sex  1  4.37 *    .037
## 8 session:group  1    1.12    .290
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-elocw) mixed effects model for Local Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.012 \\ 
  & (0.016) \\ 
  & \\ 
 groupSham & 0.008 \\ 
  & (0.019) \\ 
  & \\ 
 fd & 0.192$^{***}$ \\ 
  & (0.074) \\ 
  & \\ 
 sexF & $-$0.054$^{**}$ \\ 
  & (0.024) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.035 \\ 
  & (0.024) \\ 
  & \\ 
 Constant & 0.434$^{***}$ \\ 
  & (0.022) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 3,638.380 \\ 
Akaike Inf. Crit. & $-$7,254.760 \\ 
Bayesian Inf. Crit. & $-$7,194.395 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

### Maintenance phase

![(\#fig:ds2n-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/ds2n-sparklines-long-1.pdf) 



#### Density

![(\#fig:ds2n-repmesl-density)Integrated metric of density by session.](main_files/figure-latex/ds2n-repmesl-density-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      1.41    .704
## 2      fd  1      0.00    .949
## 3     vas  1      1.62    .203
## 4     bis  1 20.54 ***   <.001
## 5     age  1 16.94 ***   <.001
## 6     sex  1 12.97 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Strength

![(\#fig:ds2n-repmesl-strength)Integrated metric of strength by session.](main_files/figure-latex/ds2n-repmesl-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      3.02    .388
## 2      fd  1      0.29    .589
## 3     vas  1      2.13    .144
## 4     bis  1   8.49 **    .004
## 5     age  1      0.30    .582
## 6     sex  1 12.52 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Modularity

![(\#fig:ds2n-repmesl-mod)Integrated metric of modularity by session.](main_files/figure-latex/ds2n-repmesl-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df  Chisq p.value
## 1 session  3   0.90    .826
## 2      fd  1   0.06    .809
## 3     vas  1   0.24    .624
## 4     bis  1 4.65 *    .031
## 5     age  1   1.72    .189
## 6     sex  1 5.11 *    .024
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Number of hubs

![(\#fig:ds2n-repmesl-hubs)Integrated metric of number of hubs by session.](main_files/figure-latex/ds2n-repmesl-hubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3    8.74 *    .033
## 2      fd  1 15.95 ***   <.001
## 3     vas  1      0.27    .602
## 4     bis  1   8.65 **    .003
## 5     age  1      0.01    .923
## 6     sex  1      1.33    .248
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency

![(\#fig:ds2n-repmesl-eglob)Integrated metric of global efficiency by session.](main_files/figure-latex/ds2n-repmesl-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    1.30    .730
## 2      fd  1  3.24 +    .072
## 3     vas  1    0.29    .588
## 4     bis  1  2.87 +    .090
## 5     age  1 6.88 **    .009
## 6     sex  1  3.84 +    .050
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency (weighted)

![(\#fig:ds2n-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_files/figure-latex/ds2n-repmesl-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      3.39    .335
## 2      fd  1      1.38    .241
## 3     vas  1      2.23    .135
## 4     bis  1   9.43 **    .002
## 5     age  1      0.23    .633
## 6     sex  1 13.15 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency

![(\#fig:ds2n-repmesl-eloc)Integrated metric of local efficiency by session.](main_files/figure-latex/ds2n-repmesl-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3  8.32 *    .040
## 2      fd  1  3.46 +    .063
## 3     vas  1  4.83 *    .028
## 4     bis  1 9.74 **    .002
## 5     age  1    0.49    .482
## 6     sex  1 8.10 **    .004
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency (weighted)

![(\#fig:ds2n-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_files/figure-latex/ds2n-repmesl-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    2.96    .399
## 2      fd  1    0.83    .363
## 3     vas  1  2.83 +    .093
## 4     bis  1 8.06 **    .005
## 5     age  1    0.12    .726
## 6     sex  1 9.19 **    .002
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



## Schaefer-400 (with Global Signal)





### Acute phase

![(\#fig:ds4g-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/ds4g-sparklines-acute-1.pdf) 



#### Density

![(\#fig:ds4g-repmes-density)Integrated metric of density by group.](main_files/figure-latex/ds4g-repmes-density-1.pdf) 

##### Likelihood Ratio Test of Fixed effects


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      2.39    .122
## 2         group  1      1.25    .264
## 3            fd  1 14.04 ***   <.001
## 4           vas  1      0.00    .951
## 5           bis  1      0.91    .341
## 6           age  1      0.08    .773
## 7           sex  1 11.99 ***   <.001
## 8 session:group  1      1.37    .242
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-density) Mixed Effects Model for Density.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & density \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.001 \\ 
  & (0.010) \\ 
  & \\ 
 groupSham & 0.001 \\ 
  & (0.009) \\ 
  & \\ 
 fd & 0.147$^{***}$ \\ 
  & (0.037) \\ 
  & \\ 
 sexF & $-$0.040$^{***}$ \\ 
  & (0.011) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.020 \\ 
  & (0.015) \\ 
  & \\ 
 Constant & 0.433$^{***}$ \\ 
  & (0.052) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 2,432.916 \\ 
Akaike Inf. Crit. & $-$4,843.832 \\ 
Bayesian Inf. Crit. & $-$4,783.467 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Strength

![(\#fig:ds4g-repmes-strength)Integrated metric of strength by group.](main_files/figure-latex/ds4g-repmes-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.17    .682
## 2         group  1      0.07    .795
## 3            fd  1 12.32 ***   <.001
## 4           vas  1      0.37    .541
## 5           bis  1      0.05    .826
## 6           age  1      0.71    .399
## 7           sex  1   6.74 **    .009
## 8 session:group  1      1.93    .165
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-strength) Mixed Effects Model for Strength.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & strength \\ 
\hline \\[-1.8ex] 
 sessionT1 & 3.679 \\ 
  & (4.362) \\ 
  & \\ 
 groupSham & 4.143 \\ 
  & (3.837) \\ 
  & \\ 
 fd & 61.385$^{***}$ \\ 
  & (16.218) \\ 
  & \\ 
 sexF & $-$13.879$^{***}$ \\ 
  & (5.204) \\ 
  & \\ 
 sessionT1:groupSham & $-$9.308 \\ 
  & (6.445) \\ 
  & \\ 
 Constant & 47.944$^{***}$ \\ 
  & (6.257) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & $-$6,958.399 \\ 
Akaike Inf. Crit. & 13,938.800 \\ 
Bayesian Inf. Crit. & 13,999.160 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Modularity

![(\#fig:ds4g-repmes-mod)Integrated metric of modularity by group.](main_files/figure-latex/ds4g-repmes-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      1.45    .228
## 2         group  1      0.15    .696
## 3            fd  1 12.57 ***   <.001
## 4           vas  1      0.76    .383
## 5           bis  1      1.75    .186
## 6           age  1      0.65    .421
## 7           sex  1   9.14 **    .003
## 8 session:group  1      1.10    .295
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-mod) mixed effects model for modularity.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & mod.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.007 \\ 
  & (0.017) \\ 
  & \\ 
 groupSham & $-$0.011 \\ 
  & (0.014) \\ 
  & \\ 
 fd & $-$0.215$^{***}$ \\ 
  & (0.059) \\ 
  & \\ 
 sexF & 0.057$^{***}$ \\ 
  & (0.018) \\ 
  & \\ 
 sessionT1:groupSham & 0.032 \\ 
  & (0.024) \\ 
  & \\ 
 Constant & 0.343$^{***}$ \\ 
  & (0.027) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,001.057 \\ 
Akaike Inf. Crit. & $-$7,980.115 \\ 
Bayesian Inf. Crit. & $-$7,919.750 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 


#### Number of hubs

![(\#fig:ds4g-repmes-nhubs)Integrated metric of the number of hubs by group.](main_files/figure-latex/ds4g-repmes-nhubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   1.20    .274
## 2         group  1   1.06    .302
## 3            fd  1 2.98 +    .084
## 4           vas  1   0.22    .637
## 5           bis  1 5.30 *    .021
## 6           age  1   2.16    .142
## 7           sex  1   0.41    .523
## 8 session:group  1   0.13    .721
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-nhubs) mixed effects model for number of hubs.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & num.hubs.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.182 \\ 
  & (1.496) \\ 
  & \\ 
 groupSham & 0.434 \\ 
  & (1.633) \\ 
  & \\ 
 fd & $-$8.855 \\ 
  & (6.253) \\ 
  & \\ 
 sexF & $-$0.569 \\ 
  & (1.858) \\ 
  & \\ 
 sessionT1:groupSham & 1.310 \\ 
  & (2.205) \\ 
  & \\ 
 Constant & 103.369$^{***}$ \\ 
  & (2.063) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & $-$5,492.952 \\ 
Akaike Inf. Crit. & 11,007.910 \\ 
Bayesian Inf. Crit. & 11,068.270 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency

![(\#fig:ds4g-repmes-eglob)Integrated metric of global efficiency by group.](main_files/figure-latex/ds4g-repmes-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1    4.19 *    .041
## 2         group  1    3.46 +    .063
## 3            fd  1 16.27 ***   <.001
## 4           vas  1      0.05    .820
## 5           bis  1      2.18    .140
## 6           age  1      0.09    .768
## 7           sex  1 13.67 ***   <.001
## 8 session:group  1      1.74    .187
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-ge) mixed effects model for Global Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.001 \\ 
  & (0.005) \\ 
  & \\ 
 groupSham & $-$0.002 \\ 
  & (0.004) \\ 
  & \\ 
 fd & 0.074$^{***}$ \\ 
  & (0.018) \\ 
  & \\ 
 sexF & $-$0.020$^{***}$ \\ 
  & (0.005) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.011 \\ 
  & (0.007) \\ 
  & \\ 
 Constant & 0.696$^{***}$ \\ 
  & (0.035) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 3,535.919 \\ 
Akaike Inf. Crit. & $-$7,049.838 \\ 
Bayesian Inf. Crit. & $-$6,989.473 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency (weighted)

![(\#fig:ds4g-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_files/figure-latex/ds4g-repmes-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df     Chisq p.value
## 1       session  1      0.13    .722
## 2         group  1      0.13    .724
## 3            fd  1 14.36 ***   <.001
## 4           vas  1      0.54    .462
## 5           bis  1      0.14    .712
## 6           age  1      0.78    .376
## 7           sex  1   7.43 **    .006
## 8 session:group  1      2.07    .150
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-gew) mixed effects model for Global Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.011 \\ 
  & (0.012) \\ 
  & \\ 
 groupSham & 0.011 \\ 
  & (0.010) \\ 
  & \\ 
 fd & 0.176$^{***}$ \\ 
  & (0.043) \\ 
  & \\ 
 sexF & $-$0.038$^{***}$ \\ 
  & (0.014) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.026 \\ 
  & (0.017) \\ 
  & \\ 
 Constant & 0.253$^{***}$ \\ 
  & (0.012) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,914.383 \\ 
Akaike Inf. Crit. & $-$9,806.767 \\ 
Bayesian Inf. Crit. & $-$9,746.402 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency

![(\#fig:ds4g-repmes-eloc)Integrated metric of local efficiency by group.](main_files/figure-latex/ds4g-repmes-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    0.28    .595
## 2         group  1    0.11    .735
## 3            fd  1 8.15 **    .004
## 4           vas  1    0.03    .873
## 5           bis  1    0.01    .927
## 6           age  1    0.27    .606
## 7           sex  1 6.83 **    .009
## 8 session:group  1    1.12    .289
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-eloc) mixed effects model for Local Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.002 \\ 
  & (0.006) \\ 
  & \\ 
 groupSham & 0.003 \\ 
  & (0.005) \\ 
  & \\ 
 fd & 0.063$^{***}$ \\ 
  & (0.021) \\ 
  & \\ 
 sexF & $-$0.017$^{***}$ \\ 
  & (0.006) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.009 \\ 
  & (0.009) \\ 
  & \\ 
 Constant & 0.827$^{***}$ \\ 
  & (0.011) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,354.260 \\ 
Akaike Inf. Crit. & $-$8,686.520 \\ 
Bayesian Inf. Crit. & $-$8,626.155 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency (weighted)

![(\#fig:ds4g-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_files/figure-latex/ds4g-repmes-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df    Chisq p.value
## 1       session  1     0.00    .960
## 2         group  1     0.01    .925
## 3            fd  1 10.68 **    .001
## 4           vas  1     0.43    .512
## 5           bis  1     0.43    .512
## 6           age  1     0.70    .402
## 7           sex  1   5.52 *    .019
## 8 session:group  1     1.58    .209
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-elocw) mixed effects model for Local Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.014 \\ 
  & (0.015) \\ 
  & \\ 
 groupSham & 0.015 \\ 
  & (0.013) \\ 
  & \\ 
 fd & 0.196$^{***}$ \\ 
  & (0.057) \\ 
  & \\ 
 sexF & $-$0.042$^{**}$ \\ 
  & (0.018) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.028 \\ 
  & (0.022) \\ 
  & \\ 
 Constant & 0.317$^{***}$ \\ 
  & (0.018) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,567.506 \\ 
Akaike Inf. Crit. & $-$9,113.011 \\ 
Bayesian Inf. Crit. & $-$9,052.646 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

### Maintenance phase

![(\#fig:ds4g-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/ds4g-sparklines-long-1.pdf) 



#### Density

![(\#fig:ds4g-repmesl-density)Integrated metric of density by session.](main_files/figure-latex/ds4g-repmesl-density-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      1.47    .688
## 2      fd  1    5.42 *    .020
## 3     vas  1      2.37    .123
## 4     bis  1    2.74 +    .098
## 5     age  1      0.00   >.999
## 6     sex  1 28.16 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Strength

![(\#fig:ds4g-repmesl-strength)Integrated metric of strength by session.](main_files/figure-latex/ds4g-repmesl-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df    Chisq p.value
## 1 session  3     3.04    .385
## 2      fd  1   4.77 *    .029
## 3     vas  1   5.54 *    .019
## 4     bis  1     0.24    .625
## 5     age  1     0.41    .522
## 6     sex  1 10.10 **    .001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Modularity

![(\#fig:ds4g-repmesl-mod)Integrated metric of modularity by session.](main_files/figure-latex/ds4g-repmesl-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    0.61    .894
## 2      fd  1  3.86 *    .049
## 3     vas  1    0.72    .397
## 4     bis  1  2.84 +    .092
## 5     age  1    1.53    .216
## 6     sex  1 8.49 **    .004
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Number of hubs

![(\#fig:ds4g-repmesl-hubs)Integrated metric of number of hubs by session.](main_files/figure-latex/ds4g-repmesl-hubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df Chisq p.value
## 1 session  3  1.17    .761
## 2      fd  1  0.00    .948
## 3     vas  1  0.63    .428
## 4     bis  1  1.83    .176
## 5     age  1  0.27    .604
## 6     sex  1  0.73    .392
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency

![(\#fig:ds4g-repmesl-eglob)Integrated metric of global efficiency by session.](main_files/figure-latex/ds4g-repmesl-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      1.84    .606
## 2      fd  1    3.61 +    .058
## 3     vas  1      2.07    .150
## 4     bis  1    3.91 *    .048
## 5     age  1      0.71    .401
## 6     sex  1 32.16 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency (weighted)

![(\#fig:ds4g-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_files/figure-latex/ds4g-repmesl-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    3.02    .389
## 2      fd  1  5.62 *    .018
## 3     vas  1  4.24 *    .040
## 4     bis  1    0.01    .936
## 5     age  1    0.11    .739
## 6     sex  1 9.47 **    .002
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency

![(\#fig:ds4g-repmesl-eloc)Integrated metric of local efficiency by session.](main_files/figure-latex/ds4g-repmesl-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      3.63    .305
## 2      fd  1      0.52    .470
## 3     vas  1    5.15 *    .023
## 4     bis  1      0.56    .456
## 5     age  1      0.14    .710
## 6     sex  1 13.16 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency (weighted)

![(\#fig:ds4g-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_files/figure-latex/ds4g-repmesl-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    3.98    .263
## 2      fd  1    2.56    .110
## 3     vas  1  3.89 *    .048
## 4     bis  1    0.28    .599
## 5     age  1    0.02    .886
## 6     sex  1 7.09 **    .008
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



## Schaefer-400 (without Global Signal)





### Acute phase

![(\#fig:ds4n-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/ds4n-sparklines-acute-1.pdf) 



#### Density

![(\#fig:ds4n-repmes-density)Integrated metric of density by group.](main_files/figure-latex/ds4n-repmes-density-1.pdf) 

##### Likelihood Ratio Test of Fixed effects


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.88    .171
## 2         group  1    0.55    .460
## 3            fd  1 6.66 **    .010
## 4           vas  1    0.20    .659
## 5           bis  1 6.80 **    .009
## 6           age  1    0.81    .370
## 7           sex  1  6.15 *    .013
## 8 session:group  1    0.40    .529
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-density) Mixed Effects Model for Density.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & density \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.0001 \\ 
  & (0.004) \\ 
  & \\ 
 groupSham & 0.0002 \\ 
  & (0.004) \\ 
  & \\ 
 fd & 0.031$^{**}$ \\ 
  & (0.014) \\ 
  & \\ 
 sexF & $-$0.011$^{**}$ \\ 
  & (0.004) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.005 \\ 
  & (0.005) \\ 
  & \\ 
 Constant & 0.485$^{***}$ \\ 
  & (0.061) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 3,656.116 \\ 
Akaike Inf. Crit. & $-$7,290.231 \\ 
Bayesian Inf. Crit. & $-$7,229.866 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Strength

![(\#fig:ds4n-repmes-strength)Integrated metric of strength by group.](main_files/figure-latex/ds4n-repmes-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.17    .280
## 2         group  1    0.20    .654
## 3            fd  1 8.14 **    .004
## 4           vas  1    0.18    .673
## 5           bis  1  3.38 +    .066
## 6           age  1    0.55    .459
## 7           sex  1  4.74 *    .029
## 8 session:group  1    1.39    .238
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-strength) Mixed Effects Model for Strength.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & strength \\ 
\hline \\[-1.8ex] 
 sessionT1 & 3.573 \\ 
  & (4.359) \\ 
  & \\ 
 groupSham & 3.105 \\ 
  & (5.178) \\ 
  & \\ 
 fd & 56.321$^{***}$ \\ 
  & (19.913) \\ 
  & \\ 
 sexF & $-$15.009$^{**}$ \\ 
  & (6.523) \\ 
  & \\ 
 sessionT1:groupSham & $-$10.514 \\ 
  & (6.425) \\ 
  & \\ 
 Constant & 73.224$^{***}$ \\ 
  & (9.317) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & $-$7,293.459 \\ 
Akaike Inf. Crit. & 14,608.920 \\ 
Bayesian Inf. Crit. & 14,669.280 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Modularity

![(\#fig:ds4n-repmes-mod)Integrated metric of modularity by group.](main_files/figure-latex/ds4n-repmes-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1  2.76 +    .097
## 2         group  1    0.20    .655
## 3            fd  1 6.90 **    .009
## 4           vas  1    0.39    .532
## 5           bis  1  6.31 *    .012
## 6           age  1    1.49    .222
## 7           sex  1 8.64 **    .003
## 8 session:group  1    0.45    .503
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-mod) mixed effects model for modularity.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & mod.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.002 \\ 
  & (0.013) \\ 
  & \\ 
 groupSham & $-$0.006 \\ 
  & (0.012) \\ 
  & \\ 
 fd & $-$0.113$^{**}$ \\ 
  & (0.049) \\ 
  & \\ 
 sexF & 0.048$^{***}$ \\ 
  & (0.016) \\ 
  & \\ 
 sessionT1:groupSham & 0.021 \\ 
  & (0.019) \\ 
  & \\ 
 Constant & 0.253$^{***}$ \\ 
  & (0.028) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,294.843 \\ 
Akaike Inf. Crit. & $-$8,567.686 \\ 
Bayesian Inf. Crit. & $-$8,507.321 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 


#### Number of hubs

![(\#fig:ds4n-repmes-nhubs)Integrated metric of the number of hubs by group.](main_files/figure-latex/ds4n-repmes-nhubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df Chisq p.value
## 1       session  1  0.12    .733
## 2         group  1  1.89    .169
## 3            fd  1  0.71    .399
## 4           vas  1  0.03    .856
## 5           bis  1  1.27    .260
## 6           age  1  0.27    .604
## 7           sex  1  0.30    .581
## 8 session:group  1  0.00    .994
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-nhubs) mixed effects model for number of hubs.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & num.hubs.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.697 \\ 
  & (1.371) \\ 
  & \\ 
 groupSham & 1.463 \\ 
  & (1.618) \\ 
  & \\ 
 fd & $-$4.407 \\ 
  & (5.864) \\ 
  & \\ 
 sexF & 1.138 \\ 
  & (1.723) \\ 
  & \\ 
 sessionT1:groupSham & 0.246 \\ 
  & (2.020) \\ 
  & \\ 
 Constant & 103.120$^{***}$ \\ 
  & (1.991) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & $-$5,642.085 \\ 
Akaike Inf. Crit. & 11,306.170 \\ 
Bayesian Inf. Crit. & 11,366.540 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency

![(\#fig:ds4n-repmes-eglob)Integrated metric of global efficiency by group.](main_files/figure-latex/ds4n-repmes-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   0.85    .358
## 2         group  1 5.85 *    .016
## 3            fd  1   2.24    .135
## 4           vas  1   0.00    .952
## 5           bis  1   2.20    .138
## 6           age  1   0.39    .532
## 7           sex  1 3.27 +    .071
## 8 session:group  1   0.15    .699
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-ge) mixed effects model for Global Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global \\ 
\hline \\[-1.8ex] 
 sessionT1 & $-$0.0001 \\ 
  & (0.002) \\ 
  & \\ 
 groupSham & $-$0.003 \\ 
  & (0.002) \\ 
  & \\ 
 fd & 0.012 \\ 
  & (0.009) \\ 
  & \\ 
 sexF & $-$0.005$^{*}$ \\ 
  & (0.003) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.002 \\ 
  & (0.003) \\ 
  & \\ 
 Constant & 0.716$^{***}$ \\ 
  & (0.041) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,407.766 \\ 
Akaike Inf. Crit. & $-$8,793.533 \\ 
Bayesian Inf. Crit. & $-$8,733.168 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Global efficiency (weighted)

![(\#fig:ds4n-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_files/figure-latex/ds4n-repmes-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session * group + fd + vas + bis + age + sex + 
## Model:     (1 + session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    1.17    .280
## 2         group  1    0.40    .529
## 3            fd  1 9.50 **    .002
## 4           vas  1    0.23    .634
## 5           bis  1  3.42 +    .064
## 6           age  1    0.57    .452
## 7           sex  1  5.31 *    .021
## 8 session:group  1    1.61    .205
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-gew) mixed effects model for Global Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.global.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.011 \\ 
  & (0.012) \\ 
  & \\ 
 groupSham & 0.007 \\ 
  & (0.014) \\ 
  & \\ 
 fd & 0.165$^{***}$ \\ 
  & (0.054) \\ 
  & \\ 
 sexF & $-$0.043$^{**}$ \\ 
  & (0.018) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.030$^{*}$ \\ 
  & (0.017) \\ 
  & \\ 
 Constant & 0.320$^{***}$ \\ 
  & (0.017) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,151.764 \\ 
Akaike Inf. Crit. & $-$8,281.528 \\ 
Bayesian Inf. Crit. & $-$8,221.163 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency

![(\#fig:ds4n-repmes-eloc)Integrated metric of local efficiency by group.](main_files/figure-latex/ds4n-repmes-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df  Chisq p.value
## 1       session  1   0.10    .753
## 2         group  1   0.13    .718
## 3            fd  1   2.44    .118
## 4           vas  1   0.34    .562
## 5           bis  1 4.65 *    .031
## 6           age  1   0.90    .342
## 7           sex  1   2.20    .138
## 8 session:group  1   0.02    .887
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-eloc) mixed effects model for Local Efficiency.} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.001 \\ 
  & (0.003) \\ 
  & \\ 
 groupSham & $-$0.0001 \\ 
  & (0.003) \\ 
  & \\ 
 fd & 0.018 \\ 
  & (0.014) \\ 
  & \\ 
 sexF & $-$0.007$^{*}$ \\ 
  & (0.004) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.002 \\ 
  & (0.005) \\ 
  & \\ 
 Constant & 0.859$^{***}$ \\ 
  & (0.014) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 5,020.246 \\ 
Akaike Inf. Crit. & $-$10,018.490 \\ 
Bayesian Inf. Crit. & $-$9,958.127 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Local efficiency (weighted)

![(\#fig:ds4n-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_files/figure-latex/ds4n-repmes-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 9 (g)lmer() models:
## [.........]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session * group + fd + vas + bis + age + sex + (1 + 
## Model:     session | participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 14
##          Effect df   Chisq p.value
## 1       session  1    0.82    .367
## 2         group  1    0.16    .693
## 3            fd  1 7.56 **    .006
## 4           vas  1    0.19    .662
## 5           bis  1  3.09 +    .079
## 6           age  1    0.47    .491
## 7           sex  1  4.28 *    .038
## 8 session:group  1    1.06    .304
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


\begin{table}[!htbp] \centering 
  \caption{(\#tab:lmer-elocw) mixed effects model for Local Efficiency (weighted).} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & E.local.wt \\ 
\hline \\[-1.8ex] 
 sessionT1 & 0.013 \\ 
  & (0.015) \\ 
  & \\ 
 groupSham & 0.010 \\ 
  & (0.018) \\ 
  & \\ 
 fd & 0.193$^{***}$ \\ 
  & (0.070) \\ 
  & \\ 
 sexF & $-$0.050$^{**}$ \\ 
  & (0.023) \\ 
  & \\ 
 sessionT1:groupSham & $-$0.033 \\ 
  & (0.023) \\ 
  & \\ 
 Constant & 0.402$^{***}$ \\ 
  & (0.021) \\ 
  & \\ 
\hline \\[-1.8ex] 
Observations & 1,786 \\ 
Log Likelihood & 4,033.840 \\ 
Akaike Inf. Crit. & $-$8,045.680 \\ 
Bayesian Inf. Crit. & $-$7,985.315 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

### Maintenance phase

![(\#fig:ds4n-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_files/figure-latex/ds4n-sparklines-long-1.pdf) 



#### Density

![(\#fig:ds4n-repmesl-density)Integrated metric of density by session.](main_files/figure-latex/ds4n-repmesl-density-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: density ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      1.70    .638
## 2      fd  1      0.02    .877
## 3     vas  1    3.84 +    .050
## 4     bis  1      1.34    .248
## 5     age  1      1.60    .206
## 6     sex  1 25.97 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Strength

![(\#fig:ds4n-repmesl-strength)Integrated metric of strength by session.](main_files/figure-latex/ds4n-repmesl-strength-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: strength ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      2.69    .441
## 2      fd  1      0.33    .563
## 3     vas  1      2.62    .106
## 4     bis  1   7.89 **    .005
## 5     age  1      0.24    .627
## 6     sex  1 10.89 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Modularity

![(\#fig:ds4n-repmesl-mod)Integrated metric of modularity by session.](main_files/figure-latex/ds4n-repmesl-mod-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: mod.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df  Chisq p.value
## 1 session  3   0.62    .891
## 2      fd  1   0.00   >.999
## 3     vas  1   0.06    .805
## 4     bis  1 2.72 +    .099
## 5     age  1   1.48    .224
## 6     sex  1 5.53 *    .019
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Number of hubs

![(\#fig:ds4n-repmesl-hubs)Integrated metric of number of hubs by session.](main_files/figure-latex/ds4n-repmesl-hubs-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: num.hubs.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3  8.58 *    .035
## 2      fd  1  3.18 +    .074
## 3     vas  1  4.11 *    .043
## 4     bis  1 9.24 **    .002
## 5     age  1    0.49    .484
## 6     sex  1    2.62    .105
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency

![(\#fig:ds4n-repmesl-eglob)Integrated metric of global efficiency by session.](main_files/figure-latex/ds4n-repmesl-eglob-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df    Chisq p.value
## 1 session  3     0.18    .980
## 2      fd  1     2.37    .123
## 3     vas  1     1.34    .247
## 4     bis  1   2.88 +    .090
## 5     age  1     0.72    .396
## 6     sex  1 10.78 **    .001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Global efficiency (weighted)

![(\#fig:ds4n-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_files/figure-latex/ds4n-repmesl-eglobw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.global.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df     Chisq p.value
## 1 session  3      2.85    .415
## 2      fd  1      1.55    .214
## 3     vas  1    2.83 +    .092
## 4     bis  1   8.79 **    .003
## 5     age  1      0.12    .734
## 6     sex  1 10.85 ***   <.001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency

![(\#fig:ds4n-repmesl-eloc)Integrated metric of local efficiency by session.](main_files/figure-latex/ds4n-repmesl-eloc-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df    Chisq p.value
## 1 session  3   6.89 +    .075
## 2      fd  1     0.46    .497
## 3     vas  1   5.31 *    .021
## 4     bis  1   4.55 *    .033
## 5     age  1     0.20    .655
## 6     sex  1 10.08 **    .001
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model



#### Local efficiency (weighted)

![(\#fig:ds4n-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_files/figure-latex/ds4n-repmesl-elocw-1.pdf) 

##### Likelihood Ratio Test


```
## Fitting 7 (g)lmer() models:
## [.......]
## Mixed Model Anova Table (Type 3 tests, LRT-method)
## 
## Model: E.local.wt ~ session + fd + vas + bis + age + sex + (1 + session | 
## Model:     participant_id) + (1 | t)
## Data: dt.mod
## Df full model: 21
##    Effect df   Chisq p.value
## 1 session  3    2.79    .425
## 2      fd  1    0.92    .337
## 3     vas  1    2.65    .104
## 4     bis  1  6.45 *    .011
## 5     age  1    0.10    .749
## 6     sex  1 9.10 **    .003
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '+' 0.1 ' ' 1
```

##### Mixed Effect Model


