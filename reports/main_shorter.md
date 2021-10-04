---
title: "Functional Connectivity Networks' Topology Changes after rTMS in Cocaine Addiction 2.0"
subtitle: "Electric Boogaloo"
author: "Sofia Fernandez"
date: '17 September, 2021'
output:
  bookdown::pdf_document2:
    toc: true
    fig_caption: true
    keep_md: true
    # includes:
    #     in_header: my_header.tex
editor_options: 
  markdown: 
    wrap: 72
---



# Introduction

In this report I present and analyse the data of the ADDIMEX_TMS
project. For the project, participants diagnosed with Cocaine Use
Disorder (CUD) volunteered to take part into a double-blind randomized
clinical trial (Active/Sham) exploring the efficacy of rTMS diminishing
the clinical symptoms of addiction.

Participants were randomly assigned to receive two daily sessions of
either active or sham rTMS over the left-DLPFC for two weeks (10
weekdays). This consisted in the **closed-label** phase of the study.
After the last day of treatment the group assignment was revealed. To
those of the sham arm we offered to retake 20 more sessions of real rTMS
under the same parameters as the active group.

We acquired both clinical and MRI data at Baseline (T0), two weeks (T1),
three (T2) and six (T3) months. For this **longitudinal phase** only the
participants who started with active stimulation were included in the
analysis.

Here I explore the brain functional connectivity of the participants in
the form of global networks constructed from the BOLD signal of their
MRI data. Different metrics of topology are calculated and compared at
the different time-points to see how they are affected by the treatment
in the closed-label, and how they evolve over time in the Longitudinal
phase.


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

![(\#fig:acute-clin)Clinical scores by experimental group in the acute phase. A) Craving scores by VAS & B) Impulsivity by BIS-11.](main_shorter_files/figure-latex/acute-clin-1.pdf) 

### Maintenance phase
To explore the longitudinal changes observed by the rTMS treatment.
The labels for the maintenance phase are the same for both arms.

Main clinical data for all participants with this recording are summarized in
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

![(\#fig:long-clin)Clinical scores across all stages: A) Craving scores by VAS & B) Impulsivity by BIS-11.](main_shorter_files/figure-latex/long-clin-1.pdf) 

# Graphs: Raw Thresholding

## Power-264 (with Global Signal)





### Acute phase

![(\#fig:rpg-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_shorter_files/figure-latex/rpg-sparklines-acute-1.pdf) 



#### Density

![(\#fig:rpg-repmes-density)Integrated metric of density by group.](main_shorter_files/figure-latex/rpg-repmes-density-1.pdf) 

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

![(\#fig:rpg-repmes-strength)Integrated metric of strength by group.](main_shorter_files/figure-latex/rpg-repmes-strength-1.pdf) 

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

![(\#fig:rpg-repmes-mod)Integrated metric of modularity by group.](main_shorter_files/figure-latex/rpg-repmes-mod-1.pdf) 

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

![(\#fig:rpg-repmes-nhubs)Integrated metric of the number of hubs by group.](main_shorter_files/figure-latex/rpg-repmes-nhubs-1.pdf) 

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

![(\#fig:rpg-repmes-eglob)Integrated metric of global efficiency by group.](main_shorter_files/figure-latex/rpg-repmes-eglob-1.pdf) 

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

![(\#fig:rpg-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_shorter_files/figure-latex/rpg-repmes-eglobw-1.pdf) 

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

![(\#fig:rpg-repmes-eloc)Integrated metric of local efficiency by group.](main_shorter_files/figure-latex/rpg-repmes-eloc-1.pdf) 

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

![(\#fig:rpg-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_shorter_files/figure-latex/rpg-repmes-elocw-1.pdf) 

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

![(\#fig:rpg-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_shorter_files/figure-latex/rpg-sparklines-long-1.pdf) 



#### Density

![(\#fig:rpg-repmesl-density)Integrated metric of density by session.](main_shorter_files/figure-latex/rpg-repmesl-density-1.pdf) 

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

![(\#fig:rpg-repmesl-strength)Integrated metric of strength by session.](main_shorter_files/figure-latex/rpg-repmesl-strength-1.pdf) 

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

![(\#fig:rpg-repmesl-mod)Integrated metric of modularity by session.](main_shorter_files/figure-latex/rpg-repmesl-mod-1.pdf) 

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

![(\#fig:rpg-repmesl-hubs)Integrated metric of number of hubs by session.](main_shorter_files/figure-latex/rpg-repmesl-hubs-1.pdf) 

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

![(\#fig:rpg-repmesl-eglob)Integrated metric of global efficiency by session.](main_shorter_files/figure-latex/rpg-repmesl-eglob-1.pdf) 

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

![(\#fig:rpg-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_shorter_files/figure-latex/rpg-repmesl-eglobw-1.pdf) 

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

![(\#fig:rpg-repmesl-eloc)Integrated metric of local efficiency by session.](main_shorter_files/figure-latex/rpg-repmesl-eloc-1.pdf) 

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

![(\#fig:rpg-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_shorter_files/figure-latex/rpg-repmesl-elocw-1.pdf) 

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

![(\#fig:rpn-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_shorter_files/figure-latex/rpn-sparklines-acute-1.pdf) 



#### Density

![(\#fig:rpn-repmes-density)Integrated metric of density by group.](main_shorter_files/figure-latex/rpn-repmes-density-1.pdf) 

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

![(\#fig:rpn-repmes-strength)Integrated metric of strength by group.](main_shorter_files/figure-latex/rpn-repmes-strength-1.pdf) 

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

![(\#fig:rpn-repmes-mod)Integrated metric of modularity by group.](main_shorter_files/figure-latex/rpn-repmes-mod-1.pdf) 

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

![(\#fig:rpn-repmes-nhubs)Integrated metric of the number of hubs by group.](main_shorter_files/figure-latex/rpn-repmes-nhubs-1.pdf) 

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

![(\#fig:rpn-repmes-eglob)Integrated metric of global efficiency by group.](main_shorter_files/figure-latex/rpn-repmes-eglob-1.pdf) 

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

![(\#fig:rpn-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_shorter_files/figure-latex/rpn-repmes-eglobw-1.pdf) 

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

![(\#fig:rpn-repmes-eloc)Integrated metric of local efficiency by group.](main_shorter_files/figure-latex/rpn-repmes-eloc-1.pdf) 

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

![(\#fig:rpn-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_shorter_files/figure-latex/rpn-repmes-elocw-1.pdf) 

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

![(\#fig:rpn-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_shorter_files/figure-latex/rpn-sparklines-long-1.pdf) 



#### Density

![(\#fig:rpn-repmesl-density)Integrated metric of density by session.](main_shorter_files/figure-latex/rpn-repmesl-density-1.pdf) 

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

![(\#fig:rpn-repmesl-strength)Integrated metric of strength by session.](main_shorter_files/figure-latex/rpn-repmesl-strength-1.pdf) 

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

![(\#fig:rpn-repmesl-mod)Integrated metric of modularity by session.](main_shorter_files/figure-latex/rpn-repmesl-mod-1.pdf) 

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

![(\#fig:rpn-repmesl-hubs)Integrated metric of number of hubs by session.](main_shorter_files/figure-latex/rpn-repmesl-hubs-1.pdf) 

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

![(\#fig:rpn-repmesl-eglob)Integrated metric of global efficiency by session.](main_shorter_files/figure-latex/rpn-repmesl-eglob-1.pdf) 

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

![(\#fig:rpn-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_shorter_files/figure-latex/rpn-repmesl-eglobw-1.pdf) 

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

![(\#fig:rpn-repmesl-eloc)Integrated metric of local efficiency by session.](main_shorter_files/figure-latex/rpn-repmesl-eloc-1.pdf) 

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

![(\#fig:rpn-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_shorter_files/figure-latex/rpn-repmesl-elocw-1.pdf) 

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



<!-- ## Gordon-333 (with Global Signal) -->

<!-- ```{r, child = here('reports/raw_gordon_gs.Rmd')} -->
<!-- ``` -->

<!-- ## Gordon-333 (without Global Signal) -->

<!-- ```{r, child = here('reports/raw_gordon_ngs.Rmd')} -->
<!-- ``` -->

<!-- ## Schaefer-100 (with Global Signal) -->

<!-- ```{r, child = here('reports/raw_schaefer100_gs.Rmd')} -->
<!-- ``` -->

<!-- ## Schaefer-100 (without Global Signal) -->

<!-- ```{r, child = here('reports/raw_schaefer100_ngs.Rmd')} -->
<!-- ``` -->

## Schaefer-200 (with Global Signal)





### Acute phase

![(\#fig:rs2g-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_shorter_files/figure-latex/rs2g-sparklines-acute-1.pdf) 



#### Density

![(\#fig:rs2g-repmes-density)Integrated metric of density by group.](main_shorter_files/figure-latex/rs2g-repmes-density-1.pdf) 

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

![(\#fig:rs2g-repmes-strength)Integrated metric of strength by group.](main_shorter_files/figure-latex/rs2g-repmes-strength-1.pdf) 

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

![(\#fig:rs2g-repmes-mod)Integrated metric of modularity by group.](main_shorter_files/figure-latex/rs2g-repmes-mod-1.pdf) 

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

![(\#fig:rs2g-repmes-nhubs)Integrated metric of the number of hubs by group.](main_shorter_files/figure-latex/rs2g-repmes-nhubs-1.pdf) 

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

![(\#fig:rs2g-repmes-eglob)Integrated metric of global efficiency by group.](main_shorter_files/figure-latex/rs2g-repmes-eglob-1.pdf) 

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

![(\#fig:rs2g-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_shorter_files/figure-latex/rs2g-repmes-eglobw-1.pdf) 

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

![(\#fig:rs2g-repmes-eloc)Integrated metric of local efficiency by group.](main_shorter_files/figure-latex/rs2g-repmes-eloc-1.pdf) 

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

![(\#fig:rs2g-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_shorter_files/figure-latex/rs2g-repmes-elocw-1.pdf) 

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

![(\#fig:rs2g-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_shorter_files/figure-latex/rs2g-sparklines-long-1.pdf) 



#### Density

![(\#fig:rs2g-repmesl-density)Integrated metric of density by session.](main_shorter_files/figure-latex/rs2g-repmesl-density-1.pdf) 

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

![(\#fig:rs2g-repmesl-strength)Integrated metric of strength by session.](main_shorter_files/figure-latex/rs2g-repmesl-strength-1.pdf) 

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

![(\#fig:rs2g-repmesl-mod)Integrated metric of modularity by session.](main_shorter_files/figure-latex/rs2g-repmesl-mod-1.pdf) 

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

![(\#fig:rs2g-repmesl-hubs)Integrated metric of number of hubs by session.](main_shorter_files/figure-latex/rs2g-repmesl-hubs-1.pdf) 

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

![(\#fig:rs2g-repmesl-eglob)Integrated metric of global efficiency by session.](main_shorter_files/figure-latex/rs2g-repmesl-eglob-1.pdf) 

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

![(\#fig:rs2g-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_shorter_files/figure-latex/rs2g-repmesl-eglobw-1.pdf) 

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

![(\#fig:rs2g-repmesl-eloc)Integrated metric of local efficiency by session.](main_shorter_files/figure-latex/rs2g-repmesl-eloc-1.pdf) 

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

![(\#fig:rs2g-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_shorter_files/figure-latex/rs2g-repmesl-elocw-1.pdf) 

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

![(\#fig:rs2n-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_shorter_files/figure-latex/rs2n-sparklines-acute-1.pdf) 



#### Density

![(\#fig:rs2n-repmes-density)Integrated metric of density by group.](main_shorter_files/figure-latex/rs2n-repmes-density-1.pdf) 

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

![(\#fig:rs2n-repmes-strength)Integrated metric of strength by group.](main_shorter_files/figure-latex/rs2n-repmes-strength-1.pdf) 

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

![(\#fig:rs2n-repmes-mod)Integrated metric of modularity by group.](main_shorter_files/figure-latex/rs2n-repmes-mod-1.pdf) 

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

![(\#fig:rs2n-repmes-nhubs)Integrated metric of the number of hubs by group.](main_shorter_files/figure-latex/rs2n-repmes-nhubs-1.pdf) 

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

![(\#fig:rs2n-repmes-eglob)Integrated metric of global efficiency by group.](main_shorter_files/figure-latex/rs2n-repmes-eglob-1.pdf) 

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

![(\#fig:rs2n-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_shorter_files/figure-latex/rs2n-repmes-eglobw-1.pdf) 

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

![(\#fig:rs2n-repmes-eloc)Integrated metric of local efficiency by group.](main_shorter_files/figure-latex/rs2n-repmes-eloc-1.pdf) 

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

![(\#fig:rs2n-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_shorter_files/figure-latex/rs2n-repmes-elocw-1.pdf) 

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

![(\#fig:rs2n-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_shorter_files/figure-latex/rs2n-sparklines-long-1.pdf) 



#### Density

![(\#fig:rs2n-repmesl-density)Integrated metric of density by session.](main_shorter_files/figure-latex/rs2n-repmesl-density-1.pdf) 

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

![(\#fig:rs2n-repmesl-strength)Integrated metric of strength by session.](main_shorter_files/figure-latex/rs2n-repmesl-strength-1.pdf) 

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

![(\#fig:rs2n-repmesl-mod)Integrated metric of modularity by session.](main_shorter_files/figure-latex/rs2n-repmesl-mod-1.pdf) 

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

![(\#fig:rs2n-repmesl-hubs)Integrated metric of number of hubs by session.](main_shorter_files/figure-latex/rs2n-repmesl-hubs-1.pdf) 

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

![(\#fig:rs2n-repmesl-eglob)Integrated metric of global efficiency by session.](main_shorter_files/figure-latex/rs2n-repmesl-eglob-1.pdf) 

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

![(\#fig:rs2n-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_shorter_files/figure-latex/rs2n-repmesl-eglobw-1.pdf) 

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

![(\#fig:rs2n-repmesl-eloc)Integrated metric of local efficiency by session.](main_shorter_files/figure-latex/rs2n-repmesl-eloc-1.pdf) 

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

![(\#fig:rs2n-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_shorter_files/figure-latex/rs2n-repmesl-elocw-1.pdf) 

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



<!-- ## Schaefer-400 (with Global Signal) -->

<!-- ```{r, child = here('reports/raw_schaefer400_gs.Rmd')} -->
<!-- ``` -->

<!-- ## Schaefer-400 (without Global Signal) -->

<!-- ```{r, child = here('reports/raw_schaefer400_ngs.Rmd')} -->
<!-- ``` -->

# Graphs: Density Thresholding

## Power-264 (with Global Signal)





### Acute phase

![(\#fig:dpg-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_shorter_files/figure-latex/dpg-sparklines-acute-1.pdf) 



#### Density

![(\#fig:dpg-repmes-density)Integrated metric of density by group.](main_shorter_files/figure-latex/dpg-repmes-density-1.pdf) 

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

![(\#fig:dpg-repmes-strength)Integrated metric of strength by group.](main_shorter_files/figure-latex/dpg-repmes-strength-1.pdf) 

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

![(\#fig:dpg-repmes-mod)Integrated metric of modularity by group.](main_shorter_files/figure-latex/dpg-repmes-mod-1.pdf) 

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

![(\#fig:dpg-repmes-nhubs)Integrated metric of the number of hubs by group.](main_shorter_files/figure-latex/dpg-repmes-nhubs-1.pdf) 

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

![(\#fig:dpg-repmes-eglob)Integrated metric of global efficiency by group.](main_shorter_files/figure-latex/dpg-repmes-eglob-1.pdf) 

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

![(\#fig:dpg-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_shorter_files/figure-latex/dpg-repmes-eglobw-1.pdf) 

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

![(\#fig:dpg-repmes-eloc)Integrated metric of local efficiency by group.](main_shorter_files/figure-latex/dpg-repmes-eloc-1.pdf) 

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

![(\#fig:dpg-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_shorter_files/figure-latex/dpg-repmes-elocw-1.pdf) 

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

![(\#fig:dpg-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_shorter_files/figure-latex/dpg-sparklines-long-1.pdf) 



#### Density

![(\#fig:dpg-repmesl-density)Integrated metric of density by session.](main_shorter_files/figure-latex/dpg-repmesl-density-1.pdf) 

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

![(\#fig:dpg-repmesl-strength)Integrated metric of strength by session.](main_shorter_files/figure-latex/dpg-repmesl-strength-1.pdf) 

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

![(\#fig:dpg-repmesl-mod)Integrated metric of modularity by session.](main_shorter_files/figure-latex/dpg-repmesl-mod-1.pdf) 

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

![(\#fig:dpg-repmesl-hubs)Integrated metric of number of hubs by session.](main_shorter_files/figure-latex/dpg-repmesl-hubs-1.pdf) 

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

![(\#fig:dpg-repmesl-eglob)Integrated metric of global efficiency by session.](main_shorter_files/figure-latex/dpg-repmesl-eglob-1.pdf) 

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

![(\#fig:dpg-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_shorter_files/figure-latex/dpg-repmesl-eglobw-1.pdf) 

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

![(\#fig:dpg-repmesl-eloc)Integrated metric of local efficiency by session.](main_shorter_files/figure-latex/dpg-repmesl-eloc-1.pdf) 

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

![(\#fig:dpg-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_shorter_files/figure-latex/dpg-repmesl-elocw-1.pdf) 

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

![(\#fig:dpn-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_shorter_files/figure-latex/dpn-sparklines-acute-1.pdf) 



#### Density

![(\#fig:dpn-repmes-density)Integrated metric of density by group.](main_shorter_files/figure-latex/dpn-repmes-density-1.pdf) 

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

![(\#fig:dpn-repmes-strength)Integrated metric of strength by group.](main_shorter_files/figure-latex/dpn-repmes-strength-1.pdf) 

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

![(\#fig:dpn-repmes-mod)Integrated metric of modularity by group.](main_shorter_files/figure-latex/dpn-repmes-mod-1.pdf) 

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

![(\#fig:dpn-repmes-nhubs)Integrated metric of the number of hubs by group.](main_shorter_files/figure-latex/dpn-repmes-nhubs-1.pdf) 

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

![(\#fig:dpn-repmes-eglob)Integrated metric of global efficiency by group.](main_shorter_files/figure-latex/dpn-repmes-eglob-1.pdf) 

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

![(\#fig:dpn-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_shorter_files/figure-latex/dpn-repmes-eglobw-1.pdf) 

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

![(\#fig:dpn-repmes-eloc)Integrated metric of local efficiency by group.](main_shorter_files/figure-latex/dpn-repmes-eloc-1.pdf) 

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

![(\#fig:dpn-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_shorter_files/figure-latex/dpn-repmes-elocw-1.pdf) 

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

![(\#fig:dpn-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_shorter_files/figure-latex/dpn-sparklines-long-1.pdf) 



#### Density

![(\#fig:dpn-repmesl-density)Integrated metric of density by session.](main_shorter_files/figure-latex/dpn-repmesl-density-1.pdf) 

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

![(\#fig:dpn-repmesl-strength)Integrated metric of strength by session.](main_shorter_files/figure-latex/dpn-repmesl-strength-1.pdf) 

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

![(\#fig:dpn-repmesl-mod)Integrated metric of modularity by session.](main_shorter_files/figure-latex/dpn-repmesl-mod-1.pdf) 

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

![(\#fig:dpn-repmesl-hubs)Integrated metric of number of hubs by session.](main_shorter_files/figure-latex/dpn-repmesl-hubs-1.pdf) 

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

![(\#fig:dpn-repmesl-eglob)Integrated metric of global efficiency by session.](main_shorter_files/figure-latex/dpn-repmesl-eglob-1.pdf) 

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

![(\#fig:dpn-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_shorter_files/figure-latex/dpn-repmesl-eglobw-1.pdf) 

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

![(\#fig:dpn-repmesl-eloc)Integrated metric of local efficiency by session.](main_shorter_files/figure-latex/dpn-repmesl-eloc-1.pdf) 

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

![(\#fig:dpn-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_shorter_files/figure-latex/dpn-repmesl-elocw-1.pdf) 

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



<!-- ## Gordon-333 (with Global Signal) -->

<!-- ```{r, child = here('reports/dens_gordon_gs.Rmd')} -->
<!-- ``` -->

<!-- ## Gordon-333 (without Global Signal) -->

<!-- ```{r, child = here('reports/dens_gordon_ngs.Rmd')} -->
<!-- ``` -->

<!-- ## Schaefer-100 (with Global Signal) -->

<!-- ```{r, child = here('reports/dens_schaefer100_gs.Rmd')} -->
<!-- ``` -->

<!-- ## Schaefer-100 (without Global Signal) -->

<!-- ```{r, child = here('reports/dens_schaefer100_ngs.Rmd')} -->
<!-- ``` -->

## Schaefer-200 (with Global Signal)





### Acute phase

![(\#fig:ds2g-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_shorter_files/figure-latex/ds2g-sparklines-acute-1.pdf) 



#### Density

![(\#fig:ds2g-repmes-density)Integrated metric of density by group.](main_shorter_files/figure-latex/ds2g-repmes-density-1.pdf) 

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

![(\#fig:ds2g-repmes-strength)Integrated metric of strength by group.](main_shorter_files/figure-latex/ds2g-repmes-strength-1.pdf) 

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

![(\#fig:ds2g-repmes-mod)Integrated metric of modularity by group.](main_shorter_files/figure-latex/ds2g-repmes-mod-1.pdf) 

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

![(\#fig:ds2g-repmes-nhubs)Integrated metric of the number of hubs by group.](main_shorter_files/figure-latex/ds2g-repmes-nhubs-1.pdf) 

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

![(\#fig:ds2g-repmes-eglob)Integrated metric of global efficiency by group.](main_shorter_files/figure-latex/ds2g-repmes-eglob-1.pdf) 

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

![(\#fig:ds2g-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_shorter_files/figure-latex/ds2g-repmes-eglobw-1.pdf) 

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

![(\#fig:ds2g-repmes-eloc)Integrated metric of local efficiency by group.](main_shorter_files/figure-latex/ds2g-repmes-eloc-1.pdf) 

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

![(\#fig:ds2g-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_shorter_files/figure-latex/ds2g-repmes-elocw-1.pdf) 

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

![(\#fig:ds2g-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_shorter_files/figure-latex/ds2g-sparklines-long-1.pdf) 



#### Density

![(\#fig:ds2g-repmesl-density)Integrated metric of density by session.](main_shorter_files/figure-latex/ds2g-repmesl-density-1.pdf) 

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

![(\#fig:ds2g-repmesl-strength)Integrated metric of strength by session.](main_shorter_files/figure-latex/ds2g-repmesl-strength-1.pdf) 

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

![(\#fig:ds2g-repmesl-mod)Integrated metric of modularity by session.](main_shorter_files/figure-latex/ds2g-repmesl-mod-1.pdf) 

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

![(\#fig:ds2g-repmesl-hubs)Integrated metric of number of hubs by session.](main_shorter_files/figure-latex/ds2g-repmesl-hubs-1.pdf) 

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

![(\#fig:ds2g-repmesl-eglob)Integrated metric of global efficiency by session.](main_shorter_files/figure-latex/ds2g-repmesl-eglob-1.pdf) 

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

![(\#fig:ds2g-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_shorter_files/figure-latex/ds2g-repmesl-eglobw-1.pdf) 

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

![(\#fig:ds2g-repmesl-eloc)Integrated metric of local efficiency by session.](main_shorter_files/figure-latex/ds2g-repmesl-eloc-1.pdf) 

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

![(\#fig:ds2g-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_shorter_files/figure-latex/ds2g-repmesl-elocw-1.pdf) 

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

![(\#fig:ds2n-sparklines-acute)Sparklines of the topology metrics across thresholds. Labels: Max and Min; Grey shadow: IQR.](main_shorter_files/figure-latex/ds2n-sparklines-acute-1.pdf) 



#### Density

![(\#fig:ds2n-repmes-density)Integrated metric of density by group.](main_shorter_files/figure-latex/ds2n-repmes-density-1.pdf) 

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

![(\#fig:ds2n-repmes-strength)Integrated metric of strength by group.](main_shorter_files/figure-latex/ds2n-repmes-strength-1.pdf) 

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

![(\#fig:ds2n-repmes-mod)Integrated metric of modularity by group.](main_shorter_files/figure-latex/ds2n-repmes-mod-1.pdf) 

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

![(\#fig:ds2n-repmes-nhubs)Integrated metric of the number of hubs by group.](main_shorter_files/figure-latex/ds2n-repmes-nhubs-1.pdf) 

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

![(\#fig:ds2n-repmes-eglob)Integrated metric of global efficiency by group.](main_shorter_files/figure-latex/ds2n-repmes-eglob-1.pdf) 

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

![(\#fig:ds2n-repmes-eglobw)Integrated metric of global efficiency by group (weighted).](main_shorter_files/figure-latex/ds2n-repmes-eglobw-1.pdf) 

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

![(\#fig:ds2n-repmes-eloc)Integrated metric of local efficiency by group.](main_shorter_files/figure-latex/ds2n-repmes-eloc-1.pdf) 

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

![(\#fig:ds2n-repmes-elocw)Integrated metric of local efficicency (weighted) by group.](main_shorter_files/figure-latex/ds2n-repmes-elocw-1.pdf) 

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

![(\#fig:ds2n-sparklines-long)Sparklines of the topology metrics across thresholds in the maintenance phase. Labels: Max and Min; Grey shadow: IQR.](main_shorter_files/figure-latex/ds2n-sparklines-long-1.pdf) 



#### Density

![(\#fig:ds2n-repmesl-density)Integrated metric of density by session.](main_shorter_files/figure-latex/ds2n-repmesl-density-1.pdf) 

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

![(\#fig:ds2n-repmesl-strength)Integrated metric of strength by session.](main_shorter_files/figure-latex/ds2n-repmesl-strength-1.pdf) 

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

![(\#fig:ds2n-repmesl-mod)Integrated metric of modularity by session.](main_shorter_files/figure-latex/ds2n-repmesl-mod-1.pdf) 

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

![(\#fig:ds2n-repmesl-hubs)Integrated metric of number of hubs by session.](main_shorter_files/figure-latex/ds2n-repmesl-hubs-1.pdf) 

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

![(\#fig:ds2n-repmesl-eglob)Integrated metric of global efficiency by session.](main_shorter_files/figure-latex/ds2n-repmesl-eglob-1.pdf) 

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

![(\#fig:ds2n-repmesl-eglobw)Integrated metric of global efficiency (weighted) by session.](main_shorter_files/figure-latex/ds2n-repmesl-eglobw-1.pdf) 

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

![(\#fig:ds2n-repmesl-eloc)Integrated metric of local efficiency by session.](main_shorter_files/figure-latex/ds2n-repmesl-eloc-1.pdf) 

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

![(\#fig:ds2n-repmesl-elocw)Integrated metric of local efficiency (weighted) by session.](main_shorter_files/figure-latex/ds2n-repmesl-elocw-1.pdf) 

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



<!-- ## Schaefer-400 (with Global Signal) -->

<!-- ```{r, child = here('reports/dens_schaefer400_gs.Rmd')} -->
<!-- ``` -->

<!-- ## Schaefer-400 (without Global Signal) -->

<!-- ```{r, child = here('reports/dens_schaefer400_ngs.Rmd')} -->
<!-- ``` -->
