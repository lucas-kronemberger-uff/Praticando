# Script para leitura de bancos de dados diversos para geração de um data frame de uma única linha referente as informações do estado do aluno

# Ao receber este script esqueleto colocá-lo no repositório LOCAL Extensao, que deve ter sido clonado do GitHub
# Enviar o script esqueleto para o repositório REMOTO com o nome extensao-esqueleto.R

# Para realizar as tarefas da ETAPA 1, ABRIR ANTES uma branch de nome SINASC no main de Extensao e ir para ela
# Após os alunos concluírem a ETAPA 1 a professora orientará fazer o merge into main e depois abrir outro branch. Aguarde...


####################################
# ETAPA 1: BANCO DE DADOS DO SINASC
####################################

# A ALTERAÇÃO DO SCRIPT ESQUELETO - ETAPA 1 - DEVERÁ SER FEITA DENTRO DA BRANCH SINASC

# Tarefa 1. Leitura do banco de dados do SINASC 2015  com 3017668 linhas e 61 colunas
# verificar se a leitura foi feita corretamente e a estrutura dos dados
# nomeie o banco de dados como dados_sinasc

dados_sinasc = read.csv2("SINASC_2015.csv")


# Tarefa 2. Reduzir dados_sinasc apenas para as colunas que serão utilizadas, nomeando este novo banco de dados como dados_sinasc_1
# as colunas serão 1, 4, 5, 6, 7, 12, 13, 14, 15, 19, 21, 22, 23, 24, 35, 38, 44, 46, 48, 59, 60, 61
# nomes das respectivas variáveis: CONTADOR, CODMUNNASC, LOCNASC, IDADEMAE, ESTCIVMAE, CODMUNRES, GESTACAO, GRAVIDEZ, PARTO,
# SEXO, APGAR5, RACACOR, PESO, IDANOMAL, ESCMAE2010, RACACORMAE, SEMAGESTAC, CONSPRENAT, TPAPRESENT, TPROBSON, PARIDADE, KOTELCHUCK
dados_sinasc_1 =  dados_sinasc[,  c(1,4,5,6,7,12,13,14,15,19,21,22,23,24,35,38,44,46,48,59,60,61)]

# Tarefa 3. Reduzir dados_sinasc_1 apenas para o estado que o aluno irá trabalhar (utilizar os dois primeiros dígitos de CODMUNRES), nomeando este novo banco de dados como dados_sinasc_2
# Códigos das UF: 11: RO, 12: AC, 13: AM, 14: RR, 15: PA, 16: AP, 17: TO, 21: MA, 22: PI, 23: CE, 24: RN
# 25: PB, 26: PE, 27: AL, 28: SE, 29: BA, 31: MG, 32: ES, 33: RJ, 35: SP, 41: PR, 42: SC, 43: RS
# 50: MS, 51: MT, 52: GO, 53: DF 
UF = substr(as.character(dados_sinasc_1$CODMUNRES), 1, 2)
dados_sinasc_2 = dados_sinasc_1[UF == "32",]




# observar abaixo o número de nascimentos por UF de residência para certificar-se que seu banco de dados está correto
# 11: 27918     12: 16980     13: 80097     14: 11409     15: 143657    16: 15750      17: 25110
# 21: 117564    22: 49253     23: 132516    24: 49099     25: 59089     26: 145024     27: 52257     28: 34917     29: 206655
# 31: 268305    32: 56941     33: 236960    35: 634026     
# 41: 160947    42: 97223     43: 148359
# 50: 44142     51: 56673     52: 100672    53: 46122 

# Exportar o arquivo com o nome dados_sinasc_2.csv
write.csv2(dados_sinasc_2, "dados_sinasc_2")

# Ao concluir a Tarefa 3 da Etapa 1 commite e envie para o repositório REMOTO o script e dados_sinasc_2.csv com o comentário "Dados do estado UF (coloque o nome da UF) e script de sua obtenção"


# Tarefa 4. Verificar em dados_sinasc_2 a frequência das categorias das seguintes variáveis: LOCNASC, ESTCIVMAE, GESTACAO, GRAVIDEZ, PARTO,
# SEXO, APGAR5, RACACOR, IDANOMAL, ESCMAE2010, RACACORMAE, TPAPRESENT, TPROBSON, PARIDADE, KOTELCHUCK
table(dados_sinasc_2$LOCNASC)
table(dados_sinasc_2$ESTCIVMAE)
table(dados_sinasc_2$GESTACAO)
table(dados_sinasc_2$GRAVIDEZ)
table(dados_sinasc_2$PARTO)
table(dados_sinasc_2$SEXO)
table(dados_sinasc_2$APGAR5)
table(dados_sinasc_2$RACACOR)
table(dados_sinasc_2$IDANOMAL)
table(dados_sinasc_2$ESCMAE2010)
table(dados_sinasc_2$RACACORMAE)
table(dados_sinasc_2$TPAPRESENT)
table(dados_sinasc_2$TPROBSON)
table(dados_sinasc_2$PARIDADE)
table(dados_sinasc_2$KOTELCHUCK)


# Tarefa 5. Atribuir para cada variável de dados_sinasc_2 como sendo NA a categoria de "Não informado ou Ignorado", geralmente com código 9
# KOTELCHUCK = 9 significa "não informado"   TPROBSON = 11 significa "não classificado por falta de informação"
# veja o dicionário do SINASC para identificar qual o código das categorias de cada variável
dados_sinasc_2$ESTCIVMAE[dados_sinasc_2$ESTCIVMAE == 9] = NA
dados_sinasc_2$GESTACAO[dados_sinasc_2$GESTACAO == 9] = NA
dados_sinasc_2$PARTO[dados_sinasc_2$PARTO == 9] = NA
dados_sinasc_2$SEXO[dados_sinasc_2$SEXO == 0] = NA
dados_sinasc_2$APGAR5[dados_sinasc_2$APGAR5 == 99] = NA
dados_sinasc_2$IDANOMAL[dados_sinasc_2$IDANOMAL == 9] = NA
dados_sinasc_2$ESCMAE2010[dados_sinasc_2$ESCMAE2010 == 9] = NA
dados_sinasc_2$TPAPRESENT[dados_sinasc_2$TPAPRESENT == 9] = NA
dados_sinasc_2$TPROBSON[dados_sinasc_2$TPROBSON == 11] = NA
dados_sinasc_2$KOTELCHUCK[dados_sinasc_2$KOTELCHUCK == 9] = NA

# Tarefa 6. Atribuir legendas para as categorias das variáveis investigadas na etapa 4.
# Exemplo: dados_sinasc_2$KOTELCHUCK = factor(dados_sinasc_2$KOTELCHUCK, levels = c(1,2,3,4,5), 
# labels = c("Não realizou pré-natal", "Inadequado", "Intermediário", "Adequado",  
# "Mais que adequado")
dados_sinasc_2$LOCNASC = factor(dados_sinasc_2$LOCNASC, levels = c(1,2,3,4,5), labels = 
                                  c("Hospital", "Outros estabelecimentos de saúde", "Domicílio", "Outros", "Aldeia indígena"))


dados_sinasc_2$ESTCIVMAE = factor(dados_sinasc_2$ESTCIVMAE, levels = c(1,2,3,4,5), labels = 
                                    c("Solteira", "Casada", "Viúva", "Separada judicialmente/divorciada", "União estável"))


dados_sinasc_2$GESTACAO = factor(dados_sinasc_2$GESTACAO, levels = c(1,2,3,4,5,6), labels = 
                                   c("Menos de 22 semanas", "22 a 27 semanas", "28 a 31 semanas", "32 a 36 semanas", "37 a 41 semanas", "42 semanas e mais"))


dados_sinasc_2$GRAVIDEZ = factor(dados_sinasc_2$GRAVIDEZ, levels = c(1,2,3), labels = 
                                   c("Única", "Dupla","Tripla ou mais"))


dados_sinasc_2$PARTO = factor(dados_sinasc_2$PARTO, levels = c(1,2), labels = 
                                c("Vaginal", "Cesário"))


dados_sinasc_2$SEXO = factor(dados_sinasc_2$SEXO, levels = c(1,2), labels = 
                               c( "Masculino", "Feminino"))


dados_sinasc_2$RACACOR = factor(dados_sinasc_2$RACACOR, levels = c(1,2,3,4,5), labels = 
                                  c("Branca", "Preta", "Amarela", "Parda", "Indígena"))


dados_sinasc_2$IDANOMAL = factor(dados_sinasc_2$IDANOMAL, levels = c(1,2), labels = 
                                   c("Sim", "Não"))


dados_sinasc_2$ESCMAE2010 = factor(dados_sinasc_2$ESCMAE2010, levels = c(0,1,2,3,4,5), labels = 
                                     c("Sem escolaridade", "Fundamental I", "Fundamental II", "Médio", "Superior incompleto", "Superior completo"))


dados_sinasc_2$RACACORMAE = factor(dados_sinasc_2$RACACORMAE, levels = c(1,2,3,4,5), labels = 
                                     c("Branca", "Preta", "Amarela", "Parda", "Indígena"))


dados_sinasc_2$TPAPRESENT = factor(dados_sinasc_2$TPAPRESENT, levels = c(1,2,3), labels = 
                                     c("Cefálico", "Pélvica ou podálica", "Transversa"))


dados_sinasc_2$TPROBSON = factor(dados_sinasc_2$TPROBSON, levels = c(1,2,3,4,5,6,7,8,9,10), labels = 
                                   c("Grupo 1", "Grupo 2 ", "Grupo 3", "Grupo 4", "Grupo 5", "Grupo 6",
                                     "Grupo 7", "Grupo 8", "Grupo 9", "Grupo 10" ))


dados_sinasc_2$PARIDADE = factor(dados_sinasc_2$PARIDADE, levels = c(1,0), labels = 
                                   c("Multípara", "Nulípara"))


dados_sinasc_2$KOTELCHUCK = factor(dados_sinasc_2$KOTELCHUCK, levels = c(1,2,3,4,5), labels = 
                                     c("Não realizou pré-natal", "Inadequado", "Intermediário", "Adequado",  
                                       "Mais que adequado"))
#Aqui, decidi não incluir a especificação do Fundamental I e Fundamental II na label. Caso seja necessário, eu mudo.


# ATENçÃO: 1. Na hora de escrever os labels, somente a primeira letra da palavra é maiúscula. Exemplo para SEXO: Feminino e Masculino
#          2. Nesta Tarefa 6 não crie novas variáveis no banco de dados


# Tarefa 7. Categorizar as variáveis IDADEMAE, PESO e APGAR5
# nova variável: dados_sinasc_2$F_PESO com PESO: < 2500: Baixo peso, >=2500 e < 4000: Peso normal, >= 4000: Macrossomia
# nova variável dados_sinasc_2$F_IDADE com IDADEMAE: <15, 15-19, 20-24, 25-29, 30-34, 35-39, 40-44, 45-49, 50+
# nova variável dados_sinasc_2$F_APGAR5 com APGAR5: < 7: Baixo, >= 7: Normal
# Atenção para casos de NA em IDADEMAE, PESO e APGAR5
# Ao categorizar as variáveis, garantir que sejam transformadas em tipo fator
dados_sinasc_2$F_PESO = ifelse(dados_sinasc_2$PESO < 2500, "Baixo peso",
                               ifelse(dados_sinasc_2$PESO < 4000, "Peso normal",
                                      "Macrossomia"))

dados_sinasc_2$F_IDADE = ifelse(dados_sinasc_2$IDADEMAE < 15, "<15",
                                ifelse(dados_sinasc_2$IDADEMAE <20, "15-19",
                                       ifelse(dados_sinasc_2$IDADEMAE <25,"20-24",
                                              ifelse(dados_sinasc_2$IDADEMAE<30, "25-29",
                                                     ifelse(dados_sinasc_2$IDADEMAE<35,"30-34",
                                                            ifelse(dados_sinasc_2$IDADEMAE<40,"35-39",
                                                                   ifelse(dados_sinasc_2$IDADEMAE<45,"40-44",
                                                                          ifelse(dados_sinasc_2$IDADEMAE<49, "45-49",
                                                                                 "50+"))))))))

dados_sinasc_2$F_APGAR5 = ifelse(dados_sinasc_2$APGAR5 <7, "Baixo",
                                 "Normal")

dados_sinasc_2$PERIG = ifelse(is.na(dados_sinasc_2$CODMUNNASC) | is.na(dados_sinasc_2$CODMUNRES), NA,
                              ifelse(dados_sinasc_2$CODMUNNASC == dados_sinasc_2$CODMUNRES, "Não", "Sim"))
dados_sinasc_2$PERIG = factor(dados_sinasc_2$PERIG, levels = c("Não", "Sim"))

dados_sinasc_2$ESTCIV = ifelse(dados_sinasc_2$ESTCIVMAE %in% c("Solteira", "Viúva", "Separada judicialmente/divorciada"), "Sem companheiro",
                               ifelse(dados_sinasc_2$ESTCIVMAE %in% c("Casada", "União estável"), "Com companheiro", NA))
dados_sinasc_2$ESTCIV = factor(dados_sinasc_2$ESTCIV, levels = c("Sem companheiro","Com companheiro"))

# Tarefa 8. Agregar ao banco de dados_sinasc_2 as informações PESO_P10 e PESO_P90 a partir de Tabela_PIG_Brasil.csv
# a Tabela PIG informa P10 e P90 dos pesos, de acordo com a idade gestacional
# criar nova variável referente ao peso, de acordo com a idade gestacional, conforme indicado abaixo
# nova variável apenas para casos de GRAVIDEZ única: dados_sinasc_2$F_PIG: PIG: PESO < PESO_P10, AIG: PESO_P10 <= PESO <= PESO_P90, GIG: PESO > PESO_P90
# Atenção para casos de NA em SEMAGESTAC, PESO ou SEXO. Lembre-se também que em dados_sinasc_2 SEXO está como fator com as categorias Feminino e Masculino.


tabela_pig = read.csv("Tabela_PIG_Brasil.csv", header = TRUE, sep=";")
tabela_pig$SEXO = factor(tabela_pig$SEXO, levels = c("Masculino", "Feminino"))
dados_sinasc_2 = merge(dados_sinasc_2, tabela_pig, by = c("SEMAGESTAC","SEXO"), all.x = TRUE)
dados_sinasc_2$F_PIG=ifelse(dados_sinasc_2$GRAVIDEZ != "Única", NA,
                            ifelse(is.na(dados_sinasc_2$PESO)|is.na(dados_sinasc_2$PESO_P10)|is.na(dados_sinasc_2$PESO_P90),
                                   NA,
                                   ifelse(dados_sinasc_2$PESO < dados_sinasc_2$PESO_P10, "PIG",
                                          ifelse(dados_sinasc_2$PESO<=dados_sinasc_2$PESO_P90, "AIG", "GIG"))))
dados_sinasc_2$F_PIG = factor(dados_sinasc_2$F_PIG, levels = c("PIG","AIG","GIG"))

#tarefas 9 e 10 foram alteradas.

#Habilitando biblioteca que utilizarei(caso não tenha instalado, use install.packages)
library(tidyverse)
#Cálculo da variável que depende de "dados_sinasc"
TNRC = dados_sinasc %>% 
  group_by(CODMUNRES) %>% 
  summarise(
    TNRC = sum(if_all(everything(), ~ !is.na(.)))
  )


#Construção da base com municípios
base = dados_sinasc_2 %>% 
  group_by(CODMUNRES) %>% 
  summarise(
    #DESCRIÇÂO
    ANO = 2015,
    NIVEL = "MUNICIPIO",
    #INFORMAÇÕES SOBRE OS NASCIMENTOS
    TN = n(),
    TNRCR = sum(if_all(everything(), ~ !is.na(.))),
    
    #INFORMAÇÕES SOBRE AS GESTANTES
    TGI_15 = sum(IDADEMAE < 15),
    TGI_15_19 = sum(IDADEMAE >= 15 & IDADEMAE <= 19),
    TGI_20_24 = sum(IDADEMAE >= 20 & IDADEMAE <= 24),
    TGI_25_29 = sum(IDADEMAE >= 25 & IDADEMAE <= 29),
    TGI_30_34 = sum(IDADEMAE >= 30 & IDADEMAE <= 34),
    TGI_35_39 = sum(IDADEMAE >= 35 & IDADEMAE <= 39),
    TGI_40_44 = sum(IDADEMAE >= 40 & IDADEMAE <= 44),
    TGI_45_49 = sum(IDADEMAE >= 45 & IDADEMAE <= 49),
    TGI_50 = sum(IDADEMAE > 50),
    TGIF = sum(IDADEMAE >= 15 & IDADEMAE <= 49),
    IM_P25 = quantile(IDADEMAE, probs = 0.25, na.rm= T),
    IM_P50 = quantile(IDADEMAE, probs = 0.5, na.rm= T),
    IM_P75 = quantile(IDADEMAE, probs = 0.75, na.rm= T),
    IM_MD = mean(IDADEMAE),
    IM_DP = sd(IDADEMAE),
    EM_S = sum(ESCMAE2010 == "Sem escolaridade", na.rm = TRUE),
    EM_FI = sum(ESCMAE2010 == "Fundamental I", na.rm = TRUE),
    EM_FII = sum(ESCMAE2010 == "Fundamental II", na.rm = TRUE),
    EM_M = sum(ESCMAE2010 == "Médio", na.rm = TRUE),
    EM_SI = sum(ESCMAE2010 == "Superior incompleto", na.rm = TRUE),
    EM_SC = sum(ESCMAE2010 == "Superior completo", na.rm = TRUE),
    TGRC_B = sum(RACACORMAE == "Branca", na.rm = T),
    TGRC_PT = sum(RACACORMAE == "Preta", na.rm = T),
    TGRC_A = sum(RACACORMAE == "Amarela", na.rm = T),
    TGRC_PD = sum(RACACORMAE == "Parda", na.rm = T),
    TGRC_I = sum(RACACORMAE == "Indígena", na.rm = T),
    TGSC = sum(ESTCIV == "Sem companheiro", na.rm = T),
    TGCC = sum(ESTCIV == "Com companheiro", na.rm = T),
    TGPRI = sum(PARIDADE == "Nulípara", na.rm = T),
    TGNPRI = sum(PARIDADE == "Multípara", na.rm = T),
    #INFORMAÇÕES SOBRE AS GESTAÇÕES
    TGU = sum(GRAVIDEZ == "Única", na.rm = T),
    TGG = sum(GRAVIDEZ == "Dupla" | GRAVIDEZ == "Tripla ou mais", na.rm = T ),
    TGD_22 = sum(SEMAGESTAC < 22, na.rm = T),
    TGD_22_27 = sum(SEMAGESTAC >= 22 & SEMAGESTAC <= 27, na.rm = T),
    TGD_28_31 = sum(SEMAGESTAC >= 28 & SEMAGESTAC <= 31, na.rm = T),
    TGD_32_36 = sum(SEMAGESTAC >= 32 & SEMAGESTAC <= 36, na.rm = T),
    TGD_37_41 = sum(SEMAGESTAC >= 37 & SEMAGESTAC <= 41, na.rm = T),
    TGD_42 = sum(SEMAGESTAC >= 42, na.rm = T),
    TGD_PRT = sum(SEMAGESTAC < 37, na.rm = T),
    TGD_AT = sum(SEMAGESTAC >= 37 & SEMAGESTAC <=41, na.rm = T),
    TGD_PST = sum(SEMAGESTAC >= 42, na.rm = T),
    DG_P25 = quantile(SEMAGESTAC, probs = 0.25, na.rm= T),
    DG_P50= quantile(SEMAGESTAC, probs = 0.50, na.rm= T),
    DG_P75= quantile(SEMAGESTAC, probs = 0.75, na.rm= T),
    DG_MD = mean(SEMAGESTAC, na.rm = T),
    DG_DP = sd(SEMAGESTAC, na.rm = T),
    TKC_NR = sum(KOTELCHUCK == "Não realizou pré-natal", na.rm = T),
    TKC_ID = sum(KOTELCHUCK == "Inadequado", na.rm = T),
    TKC_IT = sum(KOTELCHUCK == "Intermediário", na.rm = T),
    TKC_AD = sum(KOTELCHUCK == "Adequado", na.rm = T),
    TKC_MAD = sum(KOTELCHUCK == "Mais que adequado", na.rm = T),
    #INFORMAÇÕES SOBRE O PARTO
    TGPRG_S = sum(PERIG == "Sim", na.rm = T),
    TGPRG_N = sum(PERIG == "Não", na.rm = T),
    TPV = sum(PARTO == "Vaginal", na.rm = T),
    TPC = sum(PARTO == "Cesário", na.rm = T),
    TRAP_C = sum(TPAPRESENT == "Cefálico", na.rm = T),
    TRAP_P = sum(TPAPRESENT == "Pélvica ou podálica", na.rm = T),
    TRAP_T = sum(TPAPRESENT == "Transversa", na.rm = T),
    TGROB_1 = sum(TPROBSON == "Grupo 1", na.rm = T),
    TGROB_2 = sum(TPROBSON == "Grupo 2", na.rm = T),
    TGROB_3 = sum(TPROBSON == "Grupo 3", na.rm = T),
    TGROB_4 = sum(TPROBSON == "Grupo 4", na.rm = T),
    TGROB_5 = sum(TPROBSON == "Grupo 5", na.rm = T),
    TGROB_6 = sum(TPROBSON == "Grupo 6", na.rm = T),
    TGROB_7 = sum(TPROBSON == "Grupo 7", na.rm = T),
    TGROB_8 = sum(TPROBSON == "Grupo 8", na.rm = T),
    TGROB_9 = sum(TPROBSON == "Grupo 9", na.rm = T),
    TGROB_10 = sum(TPROBSON == "Grupo 10", na.rm = T),
    TNLOC_H = sum(LOCNASC == "Hospital"),
    TNLOC_ES = sum(LOCNASC == "Outros estabelecimentos de saúde"),
    TNLOC_D = sum(LOCNASC == "Domicílio"),
    TNLOC_O = sum(LOCNASC == "Outros"),
    TNLOC_AI = sum(LOCNASC == "Aldeia indígena"),
    #INFORMAÇÕES SOBRE OS RECÉM-NASCIDOS
    TRS_M = sum(SEXO == "Masculino", na.rm = T),
    TRS_F = sum(SEXO == "Feminino", na.rm = T),
    TRRC_B = sum(RACACOR == "Branca", na.rm = T),
    TRRC_PT = sum(RACACOR == "Preta", na.rm = T),
    TRRC_A = sum(RACACOR == "Amarela", na.rm = T),
    TRRC_PD = sum(RACACOR == "Parda", na.rm = T),
    TRRC_I = sum(RACACOR == "Indígena", na.rm = T),
    TRP_BP = sum(PESO < 2500),
    TRP_N = sum(PESO >= 2500 & PESO<4000),
    TRP_M = sum(PESO>=4000),
    PESO_P25 = quantile(PESO, probs = 0.25, na.rm= T),
    PESO_P50 = quantile(PESO, probs = 0.50, na.rm= T),
    PESO_P75 = quantile(PESO, probs = 0.75, na.rm= T),
    PESO_MD = mean(PESO, na.rm = T),
    PESO_DP =  sd(PESO, na.rm = T),
    TRPIG_P = sum(GRAVIDEZ == "Única" & F_PIG == "PIG", na.rm = T),
    TRPIG_A = sum(GRAVIDEZ == "Única" & F_PIG == "AIG", na.rm = T),
    TRPIG_G = sum(GRAVIDEZ == "Única" & F_PIG == "GIG", na.rm = T),
    TRAPG5_B = sum(APGAR5 <7, na.rm = T),
    TRAPG5_N = sum(APGAR5 >= 7, na.rm = T),
    APG5_MD = mean(APGAR5, na.rm = T),
    APG5_DP = sd(APGAR5, na.rm = T),
    TRAC = sum(IDANOMAL == "Sim", na.rm = T),
    TRSAC = sum(IDANOMAL == "Não", na.rm = T)
  )

base = merge(base, TNRC, all.x = T)

#Ajustando posicionamento das colunas
base = base %>% 
  relocate(CODMUNRES, .after = NIVEL) %>% 
  relocate(TNRC, .after = TN)

#Construção da linha referente a UF como um todo
base_uf = dados_sinasc_2 %>% 
  
  summarise(
    #DESCRIÇÂO
    ANO = 2015,
    NIVEL = "UF",
    CODMUNRES = 32,
    #INFORMAÇÕES SOBRE OS NASCIMENTOS
    TN = n(),
    TNRC = 0,
    TNRCR = sum(base$TNRCR),
    
    #INFORMAÇÕES SOBRE AS GESTANTES
    TGI_15 = sum(IDADEMAE < 15),
    TGI_15_19 = sum(IDADEMAE >= 15 & IDADEMAE <= 19),
    TGI_20_24 = sum(IDADEMAE >= 20 & IDADEMAE <= 24),
    TGI_25_29 = sum(IDADEMAE >= 25 & IDADEMAE <= 29),
    TGI_30_34 = sum(IDADEMAE >= 30 & IDADEMAE <= 34),
    TGI_35_39 = sum(IDADEMAE >= 35 & IDADEMAE <= 39),
    TGI_40_44 = sum(IDADEMAE >= 40 & IDADEMAE <= 44),
    TGI_45_49 = sum(IDADEMAE >= 45 & IDADEMAE <= 49),
    TGI_50 = sum(IDADEMAE > 50),
    TGIF = sum(IDADEMAE >= 15 & IDADEMAE <= 49),
    IM_P25 = quantile(IDADEMAE, probs = 0.25, na.rm= T),
    IM_P50 = quantile(IDADEMAE, probs = 0.5, na.rm= T),
    IM_P75 = quantile(IDADEMAE, probs = 0.75, na.rm= T),
    IM_MD = mean(IDADEMAE),
    IM_DP = sd(IDADEMAE),
    EM_S = sum(ESCMAE2010 == "Sem escolaridade", na.rm = TRUE),
    EM_FI = sum(ESCMAE2010 == "Fundamental I", na.rm = TRUE),
    EM_FII = sum(ESCMAE2010 == "Fundamental II", na.rm = TRUE),
    EM_M = sum(ESCMAE2010 == "Médio", na.rm = TRUE),
    EM_SI = sum(ESCMAE2010 == "Superior incompleto", na.rm = TRUE),
    EM_SC = sum(ESCMAE2010 == "Superior completo", na.rm = TRUE),
    TGRC_B = sum(RACACORMAE == "Branca", na.rm = T),
    TGRC_PT = sum(RACACORMAE == "Preta", na.rm = T),
    TGRC_A = sum(RACACORMAE == "Amarela", na.rm = T),
    TGRC_PD = sum(RACACORMAE == "Parda", na.rm = T),
    TGRC_I = sum(RACACORMAE == "Indígena", na.rm = T),
    TGSC = sum(ESTCIV == "Sem companheiro", na.rm = T),
    TGCC = sum(ESTCIV == "Com companheiro", na.rm = T),
    TGPRI = sum(PARIDADE == "Nulípara", na.rm = T),
    TGNPRI = sum(PARIDADE == "Multípara", na.rm = T),
    #INFORMAÇÕES SOBRE AS GESTAÇÕES
    TGU = sum(GRAVIDEZ == "Única", na.rm = T),
    TGG = sum(GRAVIDEZ == "Dupla" | GRAVIDEZ == "Tripla ou mais", na.rm = T ),
    TGD_22 = sum(SEMAGESTAC < 22, na.rm = T),
    TGD_22_27 = sum(SEMAGESTAC >= 22 & SEMAGESTAC <= 27, na.rm = T),
    TGD_28_31 = sum(SEMAGESTAC >= 28 & SEMAGESTAC <= 31, na.rm = T),
    TGD_32_36 = sum(SEMAGESTAC >= 32 & SEMAGESTAC <= 36, na.rm = T),
    TGD_37_41 = sum(SEMAGESTAC >= 37 & SEMAGESTAC <= 41, na.rm = T),
    TGD_42 = sum(SEMAGESTAC >= 42, na.rm = T),
    TGD_PRT = sum(SEMAGESTAC < 37, na.rm = T),
    TGD_AT = sum(SEMAGESTAC >= 37 & SEMAGESTAC <=41, na.rm = T),
    TGD_PST = sum(SEMAGESTAC >= 42, na.rm = T),
    DG_P25 = quantile(SEMAGESTAC, probs = 0.25, na.rm= T),
    DG_P50= quantile(SEMAGESTAC, probs = 0.50, na.rm= T),
    DG_P75= quantile(SEMAGESTAC, probs = 0.75, na.rm= T),
    DG_MD = mean(SEMAGESTAC, na.rm = T),
    DG_DP = sd(SEMAGESTAC, na.rm = T),
    TKC_NR = sum(KOTELCHUCK == "Não realizou pré-natal", na.rm = T),
    TKC_ID = sum(KOTELCHUCK == "Inadequado", na.rm = T),
    TKC_IT = sum(KOTELCHUCK == "Intermediário", na.rm = T),
    TKC_AD = sum(KOTELCHUCK == "Adequado", na.rm = T),
    TKC_MAD = sum(KOTELCHUCK == "Mais que adequado", na.rm = T),
    #INFORMAÇÕES SOBRE O PARTO
    TGPRG_S = sum(PERIG == "Sim", na.rm = T),
    TGPRG_N = sum(PERIG == "Não", na.rm = T),
    TPV = sum(PARTO == "Vaginal", na.rm = T),
    TPC = sum(PARTO == "Cesário", na.rm = T),
    TRAP_C = sum(TPAPRESENT == "Cefálico", na.rm = T),
    TRAP_P = sum(TPAPRESENT == "Pélvica ou podálica", na.rm = T),
    TRAP_T = sum(TPAPRESENT == "Transversa", na.rm = T),
    TGROB_1 = sum(TPROBSON == "Grupo 1", na.rm = T),
    TGROB_2 = sum(TPROBSON == "Grupo 2", na.rm = T),
    TGROB_3 = sum(TPROBSON == "Grupo 3", na.rm = T),
    TGROB_4 = sum(TPROBSON == "Grupo 4", na.rm = T),
    TGROB_5 = sum(TPROBSON == "Grupo 5", na.rm = T),
    TGROB_6 = sum(TPROBSON == "Grupo 6", na.rm = T),
    TGROB_7 = sum(TPROBSON == "Grupo 7", na.rm = T),
    TGROB_8 = sum(TPROBSON == "Grupo 8", na.rm = T),
    TGROB_9 = sum(TPROBSON == "Grupo 9", na.rm = T),
    TGROB_10 = sum(TPROBSON == "Grupo 10", na.rm = T),
    TNLOC_H = sum(LOCNASC == "Hospital"),
    TNLOC_ES = sum(LOCNASC == "Outros estabelecimentos de saúde"),
    TNLOC_D = sum(LOCNASC == "Domicílio"),
    TNLOC_O = sum(LOCNASC == "Outros"),
    TNLOC_AI = sum(LOCNASC == "Aldeia indígena"),
    #INFORMAÇÕES SOBRE OS RECÉM-NASCIDOS
    TRS_M = sum(SEXO == "Masculino", na.rm = T),
    TRS_F = sum(SEXO == "Feminino", na.rm = T),
    TRRC_B = sum(RACACOR == "Branca", na.rm = T),
    TRRC_PT = sum(RACACOR == "Preta", na.rm = T),
    TRRC_A = sum(RACACOR == "Amarela", na.rm = T),
    TRRC_PD = sum(RACACOR == "Parda", na.rm = T),
    TRRC_I = sum(RACACOR == "Indígena", na.rm = T),
    TRP_BP = sum(PESO < 2500),
    TRP_N = sum(PESO >= 2500 & PESO<4000),
    TRP_M = sum(PESO>=4000),
    PESO_P25 = quantile(PESO, probs = 0.25, na.rm= T),
    PESO_P50 = quantile(PESO, probs = 0.50, na.rm= T),
    PESO_P75 = quantile(PESO, probs = 0.75, na.rm= T),
    PESO_MD = mean(PESO, na.rm = T),
    PESO_DP =  sd(PESO, na.rm = T),
    TRPIG_P = sum(GRAVIDEZ == "Única" & F_PIG == "PIG", na.rm = T),
    TRPIG_A = sum(GRAVIDEZ == "Única" & F_PIG == "AIG", na.rm = T),
    TRPIG_G = sum(GRAVIDEZ == "Única" & F_PIG == "GIG", na.rm = T),
    TRAPG5_B = sum(APGAR5 <7, na.rm = T),
    TRAPG5_N = sum(APGAR5 >= 7, na.rm = T),
    APG5_MD = mean(APGAR5, na.rm = T),
    APG5_DP = sd(APGAR5, na.rm = T),
    TRAC = sum(IDANOMAL == "Sim", na.rm = T),
    TRSAC = sum(IDANOMAL == "Não", na.rm = T)
  )


#Junção da linha referente à UF e a base com os municípios
base_final = bind_rows(base_uf,
                       base)



# Tarefa 11: Exporte o banco de dados com o nome SINASC_UF.csv

write.csv(base_final, "SINASC_UF.csv")
write.csv(base_final, "SINASC_ES.csv")


# Ao terminar a ETAPA 1 commite e envie para o repositório REMOTO com o comentário "Dados da UF e Script Etapa 1"



##################################
# ETAPA 2: BANCO DE DADOS DO SIM
##################################
# Só inicie esta Etapa quando a professora orientar
# Altere o script esqueleto nas partes que se refere a ETAPA 2 e envie para o repositório Extensao tendo feito o commite "Esqueleto atualizado na Etapa 2"
# A partir de main crie a branch SIM
# ESTANDO NA BRANCH SIM, NÃO ALTERE NADA NO SCRIPT REFERENTE A ETAPA 1 e só insira comandos na ETAPA 2
# Para realizar as tarefas da ETAPA 2, ABRIR ANTES uma branch de nome SINASC no main de Extensao e ir para ela

# Tarefa 1. Leitura do banco de dados Mortalidade_Geral_2015 do SIM 2015 com 1216475 linhas e 87 colunas
# verificar se a leitura foi feita corretamente e a estrutura dos dados
# nomeie o banco de dados como dados_sim

dados_sim = read.csv2("Mortalidade_Geral_2015.csv")

View(dados_sim)


# Tarefa 2. Reduzir dados_sim apenas para as colunas que serão utilizadas, nomeando este novo banco de dados como dados_sim_1
# as colunas serão: 1, 3, 4, 8, 9, 10, 11, 14, 17, 35, 36, 37, 47, 77, 84
# nomes das respectivas variáveis: CONTADOR, TIPOBITO, DTOBITO, DTNASC, IDADE, SEXO, RACACOR, ESC2010, CODMUNRES, TPMORTEOCO, 
# OBITOGRAV, OBITOPUERP, CAUSABAS, TPOBITOCOR, MORTEPARTO

dados_sim_1 = dados_sim[c(1,3,4,8,9,10,11,14,17,35,36,37,47,77,84)]

# Tarefa 3. Reduzir dados_sim_1 apenas para o estado que o aluno irá trabalhar (utilizar os dois primeiros dígitos de CODMUNRES), nomeando este novo banco de dados como dados_sim_2
# Códigos das UF: 11: RO, 12: AC, 13: AM, 14: RR, 15: PA, 16: AP, 17: TO, 21: MA, 22: PI, 23: CE, 24: RN
# 25: PB, 26: PE, 27: AL, 28: SE, 29: BA, 31: MG, 32: ES, 33: RJ, 35: SP, 41: PR, 42: SC, 43: RS
# 50: MS, 51: MT, 52: GO, 53: DF 

UF_SIM = substr(as.character(dados_sim_1$CODMUNRES), 1, 2)
dados_sim_2 = dados_sim_1[UF_SIM == "32",]




# observar abaixo o número de óbitos por UF de residência para certificar-se que seu banco de dados está correto
# 11: 7948      12: 3517      13: 16675     14: 2091      15: 37365     16: 2946       17: 7402
# 21: 33666     22: 19366     23: 55258     24: 20153     25: 26422     26: 62556      27: 19756     28: 13453     29: 87083
# 31: 131274    32: 22332     33: 127714    35: 287645     
# 41: 70839     42: 37984     43: 82349
# 50: 15457     51: 17095     52: 38854     53: 11975

# Exportar o arquivo com o nome dados_sim_2.csv

write.csv(dados_sim_2, "dados_sim_2.csv")

# Ao concluir a Tarefa 3 da Etapa 2 commite e envie para o repositório REMOTO o script e dados_sim_2.csv com o comentário "Dados do estado UF (coloque o nome da UF) e script de sua obtenção"


# Tarefa 4. Verificar em dados_sim_2 a frequência das categorias das seguintes variáveis: TIPOBITO, SEXO, RACACOR, 
# TPMORTEOCO, OBITOGRAV, OBITOPUERP, CAUSABAS, TPOBITOCOR, MORTEPARTO

table(dados_sim_2$TIPOBITO) 
table(dados_sim_2$SEXO)
table(dados_sim_2$RACACOR)
table(dados_sim_2$TPMORTEOCO)
table(dados_sim_2$OBITOGRAV)
table(dados_sim_2$OBITOPUERP)
table(dados_sim_2$CAUSABAS)
table(dados_sim_2$TPOBITOCOR)
table(dados_sim_2$MORTEPARTO)
table(dados_sim_2$IDADE)
table(dados_sim_2$DTOBITO)
table(dados_sim_2$DTNASC)
table(dados_sim_2$CODMUNRES)
# Tarefa 5. Atribuir para cada variável de dados_sim_2 como sendo NA a categoria de "Não informado ou Ignorado", geralmente com código 9
# veja o dicionário do SIM para identificar qual o código das categorias de cada variável
# Em variáveis quantitativas como IDADE verificar se existem valores como 99 para NA

dados_sim_2$SEXO[dados_sim_2$SEXO == 0] = NA
dados_sim_2$TPMORTEOCO[dados_sim_2$TPMORTEOCO == 9] = NA
dados_sim_2$OBITOGRAV[dados_sim_2$OBITOGRAV == 9] = NA
dados_sim_2$OBITOPUERP[dados_sim_2$OBITOPUERP == 9] = NA
dados_sim_2$MORTEPARTO[dados_sim_2$MORTEPARTO == 9] = NA
dados_sim_2$IDADE[dados_sim_2$IDADE == 999] = NA 
dados_sim_2$ESC2010[dados_sim_2$ESC2010 == 9] = NA


# Tarefa 6. Atribuir legendas para as categorias das variáveis qualitativas investigadas na tarefa 4.
# Exemplo: dados_sim_2$TIPOBITO = factor(dados_sim_2$TIPOBITO, levels = c(1,2), 
# labels = c("Fetal", "Não fetal")
dados_sim_2$TIPOBITO = factor(dados_sim_2$TIPOBITO, levels = c(1,2) , labels = 
                                c("Fetal", "Não fetal"))

dados_sim_2$SEXO = factor(dados_sim_2$SEXO, levels = c(1,2) , labels = 
                            c("Masculino", "Feminino"))

dados_sim_2$RACACOR = factor(dados_sim_2$RACACOR, levels = c(1,2,3,4,5) , labels = 
                               c("Branca", "Preta", "Amarela", "Parda", "Indígena"))

dados_sim_2$TPMORTEOCO = factor(dados_sim_2$TPMORTEOCO, levels = c(1,2,3,4,5,8) , labels = 
                                  c("Na gravidez", "No parto","No abortamento", "Até 42 dias após o término do parto", "De 43 dias a 1 ano após o término da gestação", "Não ocorreu nestes períodos"))

dados_sim_2$OBITOGRAV = factor(dados_sim_2$OBITOGRAV, levels = c(1,2) , labels = 
                                 c("Sim", "Não"))

dados_sim_2$OBITOPUERP = factor(dados_sim_2$OBITOPUERP, levels = c(1,2,3) , labels = 
                                  c("Sim, até 42 dias após o parto", "Sim, de 43 dias a 1 ano", "Não"))

dados_sim_2$TPOBITOCOR = factor(dados_sim_2$TPOBITOCOR, levels = c(1,2,3,4,5,6,7,8,9), labels = 
                                  c("Durante a gestação", 'Durante o abortamento', 'Após o abortamento', "No parto ou até 1 hora após o parto", "No puerpério - Até 42 dias após o parto", "Entre 43 dias e até 1 ano após o parto", "A investigação não identificou o momento do óbito", "Mais de um ano após o parto", "O óbito não ocorreu nas circunstancias anteriores"))


dados_sim_2$MORTEPARTO = factor(dados_sim_2$MORTEPARTO, levels = c(1,2,3) , labels = 
                                  c("Antes", "Durante", "Após"))

dados_sim_2$ESC2010 = factor(dados_sim_2$ESC2010, levels = c(0,1,2,3,4,5), labels = 
                               c("Sem escolaridade", "Fundamental I", "Fundamental II", "Médio", "Superior incompleto", "Superior completo"))


# ATENçÃO: 1. Na hora de escrever os labels, somente a primeira letra da palavra é maiúscula. Exemplo para SEXO: Feminino e Masculino
#          2. Nesta Tarefa 6 não crie novas variáveis no banco de dados


# Tarefa 7. Crie um banco de dados, de nome SIM_UF.csv (Exemplo: SIM_RJ.csv), contendo as 41 variáveis listadas no arquivo “Variáveis - Projeto - Tarefa 7 da Etapa 2.pdf”
# Atenção:
# 1. Para informações gerais utilize CAUSABAS, SEXO e IDADE
# 2. Para informações fetais utilize TIPOBITO
# 3. Para informações neonatais utilize TIPOBITO não fetal e IDADE entre 0 e 27 dias e RACACOR
# 4. Para informações maternas utilize TPMORTEOCO, ESC e IDADE
library(tidyverse)
dados_sim_torc = dados_sim_1[UF_SIM == "32",]
TORC = dados_sim_torc %>% 
  group_by(CODMUNRES) %>% 
  summarise(
    TORC = sum(if_all(everything(), ~ !is.na(.)))
  )



SIM_ES = dados_sim_2 %>% 
  group_by(CODMUNRES) %>% 
  summarise(
    #IDENTIFICADORES DO BANCO DE DADOS
    ANO = 2015,
    NIVEL = "MUNICIPIO",
    
    #INFORMAÇÕES GERAIS:
    
    TO = n(),
    TORCR = sum(if_all(everything(), ~ !is.na(.))),
    TO_NN = sum(startsWith(CAUSABAS,c("V", "W", "X", "Y")), na.rm = T),
    TO_N = sum(!startsWith(CAUSABAS,c("V", "W", "X", "Y")), na.rm = T),
    TO_CB_I = sum(startsWith(CAUSABAS,c("A","B")), na.rm = T),
    TO_CB_N = sum(startsWith(CAUSABAS,c("C","D")), na.rm = T),
    TO_CB_C = sum(startsWith(CAUSABAS,c("I")), na.rm = T),
    TO_CB_R = sum(startsWith(CAUSABAS,c("J")), na.rm = T),
    TO_CB_O = sum(!startsWith(CAUSABAS,c("V", "W", "X", "Y","A","B","C","D","I","J")), na.rm = T),
    TO_M = sum(SEXO == "Masculino", na.rm = T),
    TO_F = sum(SEXO == "Feminino", na.rm = T),
    TO_F_IF = sum(SEXO == "Masculino" & IDADE >= 415 & IDADE<= 449, na.rm = T),
    #INFORMAÇÕES FETAIS E NEONATAIS
    TO_FT = sum(TIPOBITO == "Fetal", na.rm = T),
    TO_NT = sum(TIPOBITO == "Não fetal" & IDADE >= 0 & IDADE <=227, na.rm = T),
    TO_NT_P = sum(TIPOBITO == "Não fetal" & IDADE >= 0 & IDADE <=206, na.rm = T),
    TO_NT_T = sum(TIPOBITO == "Não fetal" & IDADE >= 207 & IDADE <=227, na.rm = T),
    TO_PNT = sum(TIPOBITO == "Não fetal" & IDADE >= 228 & IDADE <=312, na.rm = T),
    TO_MT_G = sum(MORTEPARTO == "Antes", na.rm = T),
    TONT_B = sum(TIPOBITO == "Não fetal" & IDADE >= 0 & IDADE <=227 & RACACOR == "Branca", na.rm = T),
    TONT_PT = sum(TIPOBITO == "Não fetal" & IDADE >= 0 & IDADE <=227 & RACACOR == "Preta", na.rm = T),
    TONT_A = sum(TIPOBITO == "Não fetal" & IDADE >= 0 & IDADE <=227 & RACACOR == "Amarela", na.rm = T),
    TONT_PD = sum(TIPOBITO == "Não fetal" & IDADE >= 0 & IDADE <=227 & RACACOR == "Parda", na.rm = T),
    TONT_I= sum(TIPOBITO == "Não fetal" & IDADE >= 0 & IDADE <=227 & RACACOR == "Indígena", na.rm = T),
    
    #INFORMAÇÕES MATERNAS:
    TO_MT = sum(TPMORTEOCO == "Na gravidez" | TPMORTEOCO == "No parto" |TPMORTEOCO == "No abortamento" |TPMORTEOCO == "Até 42 dias após o término do parto" | TPMORTEOCO == "De 43 dias a 1 ano após o término da gestação" | TPMORTEOCO == "Não ocorreu nestes períodos", na.rm = T  ),
    TO_MT_DG = sum(TPMORTEOCO == "Na gravidez", na.rm = T),
    TO_MT_PT = sum(TPMORTEOCO == "No parto", na.rm = T),
    TO_MT_AB = sum(TPMORTEOCO == "No abortamento", na.rm = T),
    TO_MT_42 = sum(TPMORTEOCO == "Até 42 dias após o término do parto", na.rm = T),
    TO_MT_43 = sum(TPMORTEOCO == "De 43 dias a 1 ano após o término da gestação", na.rm = T),
    TO_MT_P = sum(TPMORTEOCO == "Na gravidez" | TPMORTEOCO == "No parto" |TPMORTEOCO == "No abortamento" |TPMORTEOCO == "Até 42 dias após o término do parto", na.rm = T),
    TO_MT_P_I = sum(TPMORTEOCO == "Na gravidez"  & IDADE >= 415 & IDADE<= 449| TPMORTEOCO == "No parto" & IDADE >= 415 & IDADE<= 449 |TPMORTEOCO == "No abortamento"  & IDADE >= 415 & IDADE<= 449 |TPMORTEOCO == "Até 42 dias após o término do parto"  & IDADE >= 415 & IDADE<= 449, na.rm = T),
    TO_MT_P_ES = sum(TPMORTEOCO == "Na gravidez"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Sem escolaridade"| TPMORTEOCO == "No parto" & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Sem escolaridade"|TPMORTEOCO == "No abortamento"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Sem escolaridade"|TPMORTEOCO == "Até 42 dias após o término do parto"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Sem escolaridade", na.rm = T),
    TO_MT_P_EFI= sum(TPMORTEOCO == "Na gravidez"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Fundamental I"| TPMORTEOCO == "No parto" & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Fundamental I"|TPMORTEOCO == "No abortamento"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Fundamental I"|TPMORTEOCO == "Até 42 dias após o término do parto"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Fundamental I", na.rm = T),
    TO_MT_P_EFII = sum(TPMORTEOCO == "Na gravidez"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Fundamental II"| TPMORTEOCO == "No parto" & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Fundamental II"|TPMORTEOCO == "No abortamento"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Fundamental II"|TPMORTEOCO == "Até 42 dias após o término do parto"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Fundamental II", na.rm = T),
    TO_MT_P_EM = sum(TPMORTEOCO == "Na gravidez"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Médio"| TPMORTEOCO == "No parto" & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Médio"|TPMORTEOCO == "No abortamento"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Médio"|TPMORTEOCO == "Até 42 dias após o término do parto"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Médio", na.rm = T),
    TO_MT_P_ESI = sum(TPMORTEOCO == "Na gravidez"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Superior incompleto"| TPMORTEOCO == "No parto" & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Superior incompleto"|TPMORTEOCO == "No abortamento"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Superior incompleto"|TPMORTEOCO == "Até 42 dias após o término do parto"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Superior incompleto", na.rm = T),
    TO_MT_P_ESC = sum(TPMORTEOCO == "Na gravidez"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Superior completo"| TPMORTEOCO == "No parto" & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Superior completo"|TPMORTEOCO == "No abortamento"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Superior completo"|TPMORTEOCO == "Até 42 dias após o término do parto"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Superior completo", na.rm = T),
    
  )

SIM_ES = merge(SIM_ES, TORC, all.x = T)

SIM_ES = SIM_ES %>% 
  relocate(CODMUNRES, .after = NIVEL)
SIM_ES = SIM_ES %>% 
  relocate(TORC, .after = TO)

#No banco de dados apareceram alguns registros como 320000 em CODMUNRES. Nesse caso, me parecem ser NA's. Deixarei na tabela para referenciar isso.



#Agora, repetindo o processo para a UF:

SIM_ES_UF = dados_sim_2 %>% 
  
  summarise(
    #IDENTIFICADORES DO BANCO DE DADOS
    ANO = 2015,
    NIVEL = "UF",
    CODMUNRES = 32,
    
    #INFORMAÇÕES GERAIS:
    
    TO = n(),
    TORC = sum(SIM_ES$TORC),
    TORCR = sum(if_all(everything(), ~ !is.na(.))),
    TO_NN = sum(startsWith(CAUSABAS,c("V", "W", "X", "Y")), na.rm = T),
    TO_N = sum(!startsWith(CAUSABAS,c("V", "W", "X", "Y")), na.rm = T),
    TO_CB_I = sum(startsWith(CAUSABAS,c("A","B")), na.rm = T),
    TO_CB_N = sum(startsWith(CAUSABAS,c("C","D")), na.rm = T),
    TO_CB_C = sum(startsWith(CAUSABAS,c("I")), na.rm = T),
    TO_CB_R = sum(startsWith(CAUSABAS,c("J")), na.rm = T),
    TO_CB_O = sum(!startsWith(CAUSABAS,c("V", "W", "X", "Y","A","B","C","D","I","J")), na.rm = T),
    TO_M = sum(SEXO == "Masculino", na.rm = T),
    TO_F = sum(SEXO == "Feminino", na.rm = T),
    TO_F_IF = sum(SEXO == "Masculino" & IDADE >= 415 & IDADE<= 449, na.rm = T),
    #INFORMAÇÕES FETAIS E NEONATAIS
    TO_FT = sum(TIPOBITO == "Fetal", na.rm = T),
    TO_NT = sum(TIPOBITO == "Não fetal" & IDADE >= 0 & IDADE <=227, na.rm = T),
    TO_NT_P = sum(TIPOBITO == "Não fetal" & IDADE >= 0 & IDADE <=206, na.rm = T),
    TO_NT_T = sum(TIPOBITO == "Não fetal" & IDADE >= 207 & IDADE <=227, na.rm = T),
    TO_PNT = sum(TIPOBITO == "Não fetal" & IDADE >= 228 & IDADE <=312, na.rm = T),
    TO_MT_G = sum(MORTEPARTO == "Antes", na.rm = T),
    TONT_B = sum(TIPOBITO == "Não fetal" & IDADE >= 0 & IDADE <=227 & RACACOR == "Branca", na.rm = T),
    TONT_PT = sum(TIPOBITO == "Não fetal" & IDADE >= 0 & IDADE <=227 & RACACOR == "Preta", na.rm = T),
    TONT_A = sum(TIPOBITO == "Não fetal" & IDADE >= 0 & IDADE <=227 & RACACOR == "Amarela", na.rm = T),
    TONT_PD = sum(TIPOBITO == "Não fetal" & IDADE >= 0 & IDADE <=227 & RACACOR == "Parda", na.rm = T),
    TONT_I= sum(TIPOBITO == "Não fetal" & IDADE >= 0 & IDADE <=227 & RACACOR == "Indígena", na.rm = T),
    
    #INFORMAÇÕES MATERNAS:
    TO_MT = sum(TPMORTEOCO == "Na gravidez" | TPMORTEOCO == "No parto" |TPMORTEOCO == "No abortamento" |TPMORTEOCO == "Até 42 dias após o término do parto" | TPMORTEOCO == "De 43 dias a 1 ano após o término da gestação" | TPMORTEOCO == "Não ocorreu nestes períodos", na.rm = T  ),
    TO_MT_DG = sum(TPMORTEOCO == "Na gravidez", na.rm = T),
    TO_MT_PT = sum(TPMORTEOCO == "No parto", na.rm = T),
    TO_MT_AB = sum(TPMORTEOCO == "No abortamento", na.rm = T),
    TO_MT_42 = sum(TPMORTEOCO == "Até 42 dias após o término do parto", na.rm = T),
    TO_MT_43 = sum(TPMORTEOCO == "De 43 dias a 1 ano após o término da gestação", na.rm = T),
    TO_MT_P = sum(TPMORTEOCO == "Na gravidez" | TPMORTEOCO == "No parto" |TPMORTEOCO == "No abortamento" |TPMORTEOCO == "Até 42 dias após o término do parto", na.rm = T),
    TO_MT_P_I = sum(TPMORTEOCO == "Na gravidez"  & IDADE >= 415 & IDADE<= 449| TPMORTEOCO == "No parto" & IDADE >= 415 & IDADE<= 449 |TPMORTEOCO == "No abortamento"  & IDADE >= 415 & IDADE<= 449 |TPMORTEOCO == "Até 42 dias após o término do parto"  & IDADE >= 415 & IDADE<= 449, na.rm = T),
    TO_MT_P_ES = sum(TPMORTEOCO == "Na gravidez"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Sem escolaridade"| TPMORTEOCO == "No parto" & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Sem escolaridade"|TPMORTEOCO == "No abortamento"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Sem escolaridade"|TPMORTEOCO == "Até 42 dias após o término do parto"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Sem escolaridade", na.rm = T),
    TO_MT_P_EFI= sum(TPMORTEOCO == "Na gravidez"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Fundamental I"| TPMORTEOCO == "No parto" & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Fundamental I"|TPMORTEOCO == "No abortamento"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Fundamental I"|TPMORTEOCO == "Até 42 dias após o término do parto"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Fundamental I", na.rm = T),
    TO_MT_P_EFII = sum(TPMORTEOCO == "Na gravidez"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Fundamental II"| TPMORTEOCO == "No parto" & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Fundamental II"|TPMORTEOCO == "No abortamento"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Fundamental II"|TPMORTEOCO == "Até 42 dias após o término do parto"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Fundamental II", na.rm = T),
    TO_MT_P_EM = sum(TPMORTEOCO == "Na gravidez"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Médio"| TPMORTEOCO == "No parto" & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Médio"|TPMORTEOCO == "No abortamento"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Médio"|TPMORTEOCO == "Até 42 dias após o término do parto"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Médio", na.rm = T),
    TO_MT_P_ESI = sum(TPMORTEOCO == "Na gravidez"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Superior incompleto"| TPMORTEOCO == "No parto" & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Superior incompleto"|TPMORTEOCO == "No abortamento"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Superior incompleto"|TPMORTEOCO == "Até 42 dias após o término do parto"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Superior incompleto", na.rm = T),
    TO_MT_P_ESC = sum(TPMORTEOCO == "Na gravidez"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Superior completo"| TPMORTEOCO == "No parto" & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Superior completo"|TPMORTEOCO == "No abortamento"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Superior completo"|TPMORTEOCO == "Até 42 dias após o término do parto"  & IDADE >= 415 & IDADE<= 449 & ESC2010 == "Superior completo", na.rm = T),
    
  )

SIM_ES = bind_rows(SIM_ES_UF, SIM_ES)



# Tarefa 8: Exporte o banco de dados com o nome SIM_UF.csv

write.csv(SIM_ES, "SIM_ES.csv")

# Ao terminar a ETAPA 2 commite e envie para o repositório REMOTO com o comentário "Dados da UF e Script Etapa 2"
# Faça um merge de script de SIM para main


#####################################################
# ETAPA 3: OUTROS BANCOS DE DADOS: IBGE, SNIS, ...
#####################################################
# Só inicie esta Etapa quando a professora orientar
# Ao terminar a ETAPA 2 faça um merge de SIM para main
# Altere as orientações do script e commit (em main) "Script com orientações ETAPA 3 - SIDRA"
# Abra um branch OUTROS
# Na branch OUTROS escreva os comandos da Tarefa 1 abaixo

# Tarefa 1. Acesso aos bancos de dados do SIDRA e obtenção da informação
# Leia os arquivos:
# 1. população residente estimada - UF e municípios - 2015 - SIDRA - tabela_6579.csv  
# 2. população residente censo 2010 - UF e municípios - total e por sexo - SIDRA - tabela_1552.csv  
# 3. população residente censo 2010 - por faixa etária -  UF - SIDRA - tabela_1552.csv
# 4. população residente censo 2010 - por faixa etária e sexo -  municípios - SIDRA - tabela_1552.csv

# A partir dos arquivos acima gere o banco de dados de nome SIDRA_UF com as seguintes variáveis:
# 1  ANO    
# 2  NIVEL
# 3  CODMUNRES
# 4 POPRE_T
# 5 POPRC_T
# 6 POPRC_M
# 7 POPRC_F
# 8 POPRC_15
# 9 POPRC_15_49
# 10 POPRC_50
# 11 POPRC_F_15
# 12 POPRC_F_15_49
# 13 POPRC_F_50



# Exporte o arquivo em formato CSV
# Faça o commit com a mensagem "Script e dados TAREFA 3 - SIDRA"
#---------------------------------------------------------------------------------
library(tidyverse)

#Leitura dos csv's que serão utlizados:

sidra1 = read.csv2("população residente estimada - UF e municípios - 2015 - SIDRA - tabela_6579.csv")
sidra2 = read.csv2("população residente censo 2010 - UF e municípios - total e por sexo - SIDRA - tabela_1552.csv ")
sidra3 = read.csv2("população residente censo 2010 - por faixa etária -  UF - SIDRA - tabela_1552.csv")
sidra4  = read.csv2("população residente censo 2010 - por faixa etária e sexo -  municípios - SIDRA - tabela_1552.csv")

#Filtrando dados para apenas o ES:

UF_sidra1 = substr(as.character(sidra1$CODMUNRES), 1, 2)
sidraES1 = sidra1[UF_sidra1 == "32",]

UF_sidra2 = substr(as.character(sidra2$CODMUNRES), 1, 2)
sidraES2 = sidra2[UF_sidra2 == "32",]

sidraES3 = sidra3 %>% 
  filter(CODMUNRES== 32)

UF_sidra4 = substr(as.character(sidra4$CODMUNRES), 1, 2)
sidraES4 = sidra4[UF_sidra4 == "32",]
#Construção de tabelas auxiliares:

dados_sidra1 = sidraES1 %>% 
  group_by(CODMUNRES) %>% 
  summarise(
    POPRE_T = POPRE_T
  )

dados_sidra2 = sidraES2 %>% 
  group_by(CODMUNRES) %>% 
  summarise(
    POPRC_T = POPRC_T,
    POPRC_M = POPRC_M,
    POPRC_F = POPRC_F
  )


dados_sidra3 = sidraES3 %>%
  group_by(CODMUNRES) %>% 
  
  summarise(
    ANO = 2015,
    NIVEL = "UF",
    POPRC_15 = POP[F_IDADE == "0 a 4 anos"] + POP[F_IDADE == "5 a 9 anos"] + POP[F_IDADE == "10 a 14 anos"],
    POPRC_15_49 = POP[F_IDADE == "15 a 19 anos"] +POP[F_IDADE == "20 a 24 anos"] +POP[F_IDADE == "25 a 29 anos"] +POP[F_IDADE == "30 a 34 anos"] +POP[F_IDADE == "35 a 39 anos"] +POP[F_IDADE == "40 a 44 anos"] +POP[F_IDADE == "45 a 49 anos"],
    POPRC_50 = POP[F_IDADE == "50 a 54 anos"] +POP[F_IDADE == "55 a 59 anos"] +POP[F_IDADE == "60 a 64 anos"] +POP[F_IDADE == "65 a 69 anos"] +POP[F_IDADE == "70 a 74 anos"] +POP[F_IDADE == "75 a 79 anos"] +POP[F_IDADE == "80 a 89 anos"]+POP[F_IDADE == "90 a 99 anos"]+POP[F_IDADE == "100 anos ou mais"],
    POPRC_F_15 = POPF[F_IDADE == "0 a 4 anos"] + POPF[F_IDADE == "5 a 9 anos"] + POPF[F_IDADE == "10 a 14 anos"],
    POPRC_F_15_49 = POPF[F_IDADE == "15 a 19 anos"] +POPF[F_IDADE == "20 a 24 anos"] +POPF[F_IDADE == "25 a 29 anos"] +POPF[F_IDADE == "30 a 34 anos"] +POPF[F_IDADE == "35 a 39 anos"] +POPF[F_IDADE == "40 a 44 anos"] +POPF[F_IDADE == "45 a 49 anos"],
    POPRC_F_50 = POPF[F_IDADE == "50 a 54 anos"] +POPF[F_IDADE == "55 a 59 anos"] +POPF[F_IDADE == "60 a 64 anos"] +POPF[F_IDADE == "65 a 69 anos"] +POPF[F_IDADE == "70 a 74 anos"] +POPF[F_IDADE == "75 a 79 anos"] +POPF[F_IDADE == "80 a 89 anos"]+POPF[F_IDADE == "90 a 99 anos"]+POPF[F_IDADE == "100 anos ou mais"],
  )


dados_sidra4 = sidraES4 %>%
  group_by(CODMUNRES) %>% 
  
  summarise(
    ANO = 2015,
    NIVEL = "MUNICIPIO",
    POPRC_15 = POP[F_IDADE == "0 a 4 anos"] + POP[F_IDADE == "5 a 9 anos"] + POP[F_IDADE == "10 a 14 anos"],
    POPRC_15_49 = POP[F_IDADE == "15 a 19 anos"] +POP[F_IDADE == "20 a 24 anos"] +POP[F_IDADE == "25 a 29 anos"] +POP[F_IDADE == "30 a 34 anos"] +POP[F_IDADE == "35 a 39 anos"] +POP[F_IDADE == "40 a 44 anos"] +POP[F_IDADE == "45 a 49 anos"],
    POPRC_50 = POP[F_IDADE == "50 a 54 anos"] +POP[F_IDADE == "55 a 59 anos"] +POP[F_IDADE == "60 a 64 anos"] +POP[F_IDADE == "65 a 69 anos"] +POP[F_IDADE == "70 a 74 anos"] +POP[F_IDADE == "75 a 79 anos"] +POP[F_IDADE == "80 a 89 anos"]+POP[F_IDADE == "90 a 99 anos"]+POP[F_IDADE == "100 anos ou mais"],
    POPRC_F_15 = POPF[F_IDADE == "0 a 4 anos"] + POPF[F_IDADE == "5 a 9 anos"] + POPF[F_IDADE == "10 a 14 anos"],
    POPRC_F_15_49 = POPF[F_IDADE == "15 a 19 anos"] +POPF[F_IDADE == "20 a 24 anos"] +POPF[F_IDADE == "25 a 29 anos"] +POPF[F_IDADE == "30 a 34 anos"] +POPF[F_IDADE == "35 a 39 anos"] +POPF[F_IDADE == "40 a 44 anos"] +POPF[F_IDADE == "45 a 49 anos"],
    POPRC_F_50 = POPF[F_IDADE == "50 a 54 anos"] +POPF[F_IDADE == "55 a 59 anos"] +POPF[F_IDADE == "60 a 64 anos"] +POPF[F_IDADE == "65 a 69 anos"] +POPF[F_IDADE == "70 a 74 anos"] +POPF[F_IDADE == "75 a 79 anos"] +POPF[F_IDADE == "80 a 89 anos"]+POPF[F_IDADE == "90 a 99 anos"]+POPF[F_IDADE == "100 anos ou mais"],
  )

juncao1 = bind_rows(dados_sidra3, dados_sidra4)

juncao2 = merge(dados_sidra1, juncao1)

SIDRA_ES = merge(juncao2, dados_sidra2)


SIDRA_ES = SIDRA_ES %>% 
  relocate(ANO, .before = CODMUNRES) %>% 
  relocate(NIVEL, .after = ANO) %>% 
  relocate(c(POPRC_T, POPRC_M, POPRC_F), .after = POPRE_T)

#Exportação dos dados da tarefa 3:

write.csv(SIDRA_ES, "SIDRA_ES.csv")
#-------------------------------------------------------------------------------------------------------------------------
# Tarefa 2: Acesso aos bancos de dados do SINISA e obtenção da informação
# Escreva os comandos da Tarefa 2 estando na branch OUTROS# Leia o arquivo agua e esgoto - município - 2015.csv 
# A partir do arquivo acima gere o banco de dados de nome SINISA_UF com as seguintes variáveis:
# 1  ANO    
# 2  NIVEL
# 3  CODMUNRES
# 4 POPR_RA
# 5 POPR_RE

library(tidyverse)

#Leitura do arquivo SINISA:

dados_sinisa = read.csv("/home/aluno/Downloads/agua e esgoto - município - 2015.csv")

#Filtrar os dados para apenas o ES:

dados_sinisa_ES = dados_sinisa %>% 
  filter(Estado == "ES")

#Mudança de tipo de variável para as variáveis quantitativas:

dados_sinisa_ES$POPR_RA = as.numeric(dados_sinisa_ES$POPR_RA)
dados_sinisa_ES$POPR_RE = as.numeric(dados_sinisa_ES$POPR_RE)









#Criação de banco de dados com os municípios do ES:

dados_sinisa_M_ES = dados_sinisa_ES %>% 
  group_by(CODMUNRES) %>% 
  summarise(
    ANO = 2015,
    NIVEL = "MUNICIPIO",
    POPR_RA = POPR_RA,
    POPR_RE = POPR_RE
  ) %>% 
  relocate(CODMUNRES, .after = NIVEL)


#Criação de banco de dados com os dados gerais do ES:

dados_sinisa_UF_ES = dados_sinisa_ES %>% 
  summarise(
    ANO = 2015,
    NIVEL = "UF",
    CODMUNRES = 32,
    POPR_RA = sum(POPR_RA , na.rm = T),
    POPR_RE = sum(POPR_RE, na.rm = T)
  )

#Juncao dos dados:

SINISA_ES = bind_rows(dados_sinisa_UF_ES, dados_sinisa_M_ES)





# Exporte o arquivo em formato CSV

write_csv(SINISA_ES, "SINISA_ES.csv")

# Faça o commit com a mensagem "Script e dados TAREFA 3 - SINISA"

# Tarefa 3: Acesso aos bancos de dados do ATLAS  e obtenção da informação
# Escreva os comandos da Tarefa 3 estando na branch OUTROS
# Leia os arquivos:
# 1. códigos dos municípios - 2010.csv      
# 2. IDHM - 2010 (CENSO) e 2015 (PNAD) - total e por sexo - UF - Atlas Brasil.csv
# 3. IDHM - 2010 - municípios - Atlas Brasil.csv
# A partir do arquivo acima gere o banco de dados de nome ATLAS_UF com as seguintes variáveis:
# 1  ANO    
# 2  NIVEL
# 3  CODMUNRES
# 4 IDHM_A
# 5 IDHM_CA
# 6 IDHM_CA_M
# 7 IDHM_CA_F

# Exporte o arquivo em formato CSV# Faça o commit com a mensagem "Script e dados TAREFA 3 - ATLAS"



#####################################################################################################
# ETAPA 4: GERAR BANCO DE DADOS FINAL DO ESTADO, BASEADO NAS ANÁLISES DE SINASC, SIM, IBGE, SNIS,...
######################################################################################################
# Só inicie esta Etapa quando a professora orientar
# ESTANDO NA BRANCH SINASC, NÃO ALTERE NADA NO SCRIPT REFERENTE A ETAPA 4

# Cada aluno gerar um dataframe de uma única linha (referente ao seu estado) com as variáveis na ordem indicada pela professora



############################################################################################
# ETAPA 5: EMPILHAMENTO DOS DATAFRAMES DE CADA ESTADO, GERANDO UM DATAFRAME DE 27 LINHAS
############################################################################################
# Só inicie esta Etapa quando a professora orientar
# ESTANDO NA BRANCH SINASC, NÃO ALTERE NADA NO SCRIPT REFERENTE A ETAPA 5

# 1. Enviar arquivos para as pastas do repositório da Professora no GitHUb
# 2. A professora fará o empilhamentos dos dataframes