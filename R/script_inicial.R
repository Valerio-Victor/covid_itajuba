


# CARREGAMENTOS INICIAIS ---------------------------------------------------------------------------

`%>%` <- magrittr::`%>%`


library(ggplot2)



# IMPORTAÇÃO DOS DADOS:

dados_min_saude <- coronabr::get_corona_minsaude()


dados_jhu <- coronabr::get_corona_jhu()



# TRATAMENTO DOS DADOS -----------------------------------------------------------------------------
# Em primeiro lugar, vamos nos atentar a situação de itajubá (diferentes perspectivas gráficas):

dados_itajuba <- dados_min_saude %>%

  janitor::clean_names() %>%

  dplyr::filter(municipio == 'Itajubá') %>%

  dplyr::select(data, casos_acumulado, obitos_acumulado)


# Tema Básico

confirmados <- dados_itajuba %>%

  ggplot() +

  geom_line(mapping = aes(x = data, y = casos_acumulado)) +

  labs(title = 'Casos de COVID-19 em Itajubá',

       subtitle = 'Tema Básico de Gráfico',

       x = '',

       y = 'Casos Confirmados (Acumulado)',

       caption = '')



obitos <- dados_itajuba %>%

  ggplot() +

  geom_line(mapping = aes(x = data, y = obitos_acumulado)) +

  labs(title = 'Óbitos de COVID-19 em Itajubá',

       subtitle = 'Tema Básico de Gráfico',

       x = '',

       y = 'Óbitos (Acumulado)',

       caption = 'Dados: Ministério da Saúde.')



gridExtra::grid.arrange(confirmados, obitos, nrow = 1, ncol = 2)



# Tema do periódico The Economist

confirmados <- dados_itajuba %>%

  ggplot() +

  geom_line(mapping = aes(x = data, y = casos_acumulado)) +

  labs(title = 'Casos de COVID-19 em Itajubá',

       subtitle = 'The Economist',

       x = '',

       y = 'Casos Confirmados (Acumulado)',

       caption = '') +

  ggthemes::theme_economist()



obitos <- dados_itajuba %>%

  ggplot() +

  geom_line(mapping = aes(x = data, y = obitos_acumulado)) +

  labs(title = 'Óbitos de COVID-19 em Itajubá',

       subtitle = 'The Economist',

       x = '',

       y = 'Óbitos (Acumulado)',

       caption = 'Dados: Ministério da Saúde.') +

  ggthemes::theme_economist()



gridExtra::grid.arrange(confirmados, obitos, nrow = 1, ncol = 2)

# Tema do periódico The Wall Street Journal

confirmados <- dados_itajuba %>%

  ggplot() +

  geom_line(mapping = aes(x = data, y = casos_acumulado)) +

  labs(title = 'Casos de COVID-19 em Itajubá',

       subtitle = 'Itajubá',

       x = '',

       y = 'Casos Confirmados (Acumulado)',

       caption = '') +

  ggthemes::theme_wsj()



obitos <- dados_itajuba %>%

  ggplot() +

  geom_line(mapping = aes(x = data, y = obitos_acumulado)) +

  labs(title = 'Óbitos de COVID-19 em Itajubá',

       subtitle = 'Itajubá',

       x = '',

       y = 'Óbitos (Acumulado)',

       caption = 'Dados: Ministério da Saúde.') +

  ggthemes::theme_wsj()



gridExtra::grid.arrange(confirmados, obitos, nrow = 1, ncol = 2)



# Tema de Os Simpsons

confirmados <- dados_itajuba %>%

  ggplot() +

  geom_line(mapping = aes(x = data, y = casos_acumulado)) +

  labs(title = 'Casos de COVID-19 em Itajubá',

       subtitle = 'Itajubá',

       x = '',

       y = 'Casos Confirmados (Acumulado)',

       caption = '') +

  tvthemes::theme_simpsons(title.font = 'Akbar',

                           text.font = 'Akbar',

                           axis.text.size = 8)




