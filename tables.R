
# HC vs CU ----------------------------------------------------------------

mylatex(
    mytable(Grupo ~ ., 
        covarsP[, .(
            Sexo = sex,
            Edad = age,
            Educación = education,
            Fumar = factor(smoking, labels = c("No", "Sí")),
            Cigarrillos_día = cig_day, 
            Grupo = factor(Group, labels = c('Adictos', 'Controles'))
        )]
    ) 
)


# Demographics Closed label -----------------------------------------------

setkey(clin1, Study.ID)
setkey(covars1, Study.ID)
dt <- clin1[covars1]
mylatex(
    mytable2(Etapa + Grupo ~ .,
        dt[, .(
            Grupo = factor(Group, labels = c("Sham", "Real")),
            Etapa = factor(Stage),
            Sexo = sex,
            Edad = age, 
            Educación = education,
            Años_consumo = coc_years,
            Tabaco = factor(smoking, labels = c("No", "Sí")),
            Cigarrillos_día = cig_day, 
            VAS = VAS,
            CCQG = CCQG,
            CCQN = CCQN,
            BIS11 = B11Tot
        )])
)

# Longitudinal - 3 months -------------------------------------------------
mylatex(
    mytable(Etapa ~ .,
        clin2[, .(
            Etapa = factor(Stage),
            VAS = VAS,
            CCQG = CCQG,
            CCQN = CCQN,
            BIS11 = B11Tot
        )]
    )
)

mylatex(
    mytable(Etapa ~ .,
        clin3[ ,.(
            Etapa = factor(Stage),
            VAS = VAS,
            CCQG = CCQG,
            CCQN = CCQN,
            BIS11 = B11Tot
        )]
    )
)
