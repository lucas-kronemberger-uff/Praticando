#Script referente a aula prática de 30/03 de Git e GitHub, vinculado ao projeto Praticando

#Leitura do banco de dados
dados = read_csv2(file= "dados - respostas formulário.csv")

# Verificando estrutura dos dados
str(dados)

# Análises descritivas - variáveis qualitativas
prop.table(table(ingresso))
prop.table(table(sexo))
prop.table(table(grupo_sanguineo))
prop.table(table(ingresso))
prop.table(table(ingere_pao))
prop.table(table(ingere_massa))
prop.table(table(ingere_refri))
prop.table(table(ingere_alcool))
prop.table(table(fruta_gosta))