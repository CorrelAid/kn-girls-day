# Girls Day 2023
# Geburtstagkarte
library(tidyverse)
library(htmltools)
library(markdown)
library(here)

# Data hochladen 
df <- read.csv(here::here("data/BeispielTabelle.csv"))

# Data Reinigung

df <- df %>% filter(!is.na(Geburtsjahr)) %>% 
  mutate(Alter = 2023 - Geburtsjahr)


# Karte1

df1 <- df %>% filter(Name == "Nele")


nachricht <- paste0("<span style='font-size:48px'><strong><span style='color:blue'>Herzlichen Glückwunsch zum ", df1$Alter,
                    ". Geburtstag, ", df1$Name,
                    "!</span>\n\n <span style='color:red'>Alles Liebe und Gute für dein neues Lebensjahr. Ich hoffe, dass du einen wundervollen Tag hast und im Kreis deiner Liebsten feiern kannst.</span>\n\n",
                    "<span style='color:green'>Liebe Grüße und nochmals alles Gute!</span>\n")

## Erstelle HTML-Code für die Nachricht
karte1 <- markdownToHTML(nachricht)

## Exportiere die Nachricht als HTML-Datei
write(karte1, file = here("output/geburtstagskarte1.html"))

# Wenn 2 Freundinnen gleich heißen

df2 <- df %>% filter(Name == "Elena" & Geburtsjahr == 2019)

nachricht2 <- paste0("<span style='font-size:48px'><strong><span style='color:blue'>Herzlichen Glückwunsch zum ", df2$Alter,
                  ". Geburtstag, ", df2$Name,
                  "!</span>\n\n <span style='color:red'>Alles Liebe und Gute für dein neues Lebensjahr. Ich hoffe, dass du einen wundervollen Tag hast und im Kreis deiner Liebsten feiern kannst.</span>\n\n",
                  "<span style='color:green'>Liebe Grüße und nochmals alles Gute!</span>\n")

karte2 <- markdownToHTML(nachricht2)
write(karte2, file = here("output/geburtstagskarte2.html"))

