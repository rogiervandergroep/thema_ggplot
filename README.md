
Dit zijn scripts voor de functies
  
  my_plot_vertical
  my_plot_horizontal

Met deze functies kan je horizontale en verticale staafdiagrammen maken in ggplot met meerdere groepen 

De styling is gebaseerd op 
  https://onderzoek.amsterdam.nl/interactief/datavisualisatie?tab=kleuren en 
  https://gitlab.com/os-amsterdam/tools-onderzoek-en-statistiek/-/blob/main/R/OS_ggtheme.R?ref_type=heads

De volgend paramaters worden toegekend aan de functies:
  x_var = de variabele op de x-as
  y_var = de variabele op de y-as
  fill_var = de variabele waarop gegroepeerd wordt 
  color_var = een kleurenpallet in de vorm van een vector
  guide_nr = een integer: slaat op het aantal rijen bij de legenda
    staat bij my_plot_vertical als default op 2 
    staat bij my_plot_horizontal als default op 1 


