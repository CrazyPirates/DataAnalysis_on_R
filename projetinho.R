dados <- read.csv(file = "C:/Users/HOME/Downloads/day.csv") # Pegar os dados

View(dados)
glimpse(dados) # Olhar os dados

#TRATAMENTO DE DADOS

dados$date <- as.Date(dados$dteday, format = "%Y-%m-%d") #Formatar texto pra data

glimpse(dados)

dados <- dados[-2] # Tirar coluna desnecessária
glimpse(dados)

novos_dados <- select(dados, instant, date, season, yr, mnth, holiday, weekday, 
                      workingday, weathersit, temp, atemp, hum, windspeed,
                      casual, registered, cnt, date) #Reorganizar colunas
glimpse(novos_dados)
View(novos_dados)

install.packages("dataMeta")

novos_dados$temp <- round(novos_dados$temp * 100)
novos_dados$atemp <- round(novos_dados$atemp * 100)
novos_dados$hum <- round(novos_dados$hum * 100)
novos_dados$windspeed <- round(novos_dados$windspeed * 100) # Arredondar e formatar
                                                            # os números
#------------------------------------------------
#FAZENDO O DICIONÁRIO DE DADOS
desc <- c("O Índicie", "Dia", "Temporada (1-Primavera, 2-Verão, 3-Outono, 4-Inverno)", 
          "Ano (0-2011, 1-2012)", "Mês", "Se teve feriado ou não", 
          "Dia da semana", "Dia Normal", "Situação que se encontra o clima",
          "Temperatura", "Sensação Térmica", "Umidade", "Velocidade do vento",
          "Usuários casuais", "Usuários registrados", "Contagem de Usuários")
#Descrição do dicionario de dados

tipo <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)#Declarando os tipos de dados

linker <- build_linker(novos_dados, variable_description = desc, 
                       variable_type = tipo) #Configurando o Linker

dict <- build_dict(my.data = novos_dados, linker = linker, option_description = NULL,
                   prompt_varopts = FALSE) #Fazendo o dicionário

dict

class(novos_dados$yr)











