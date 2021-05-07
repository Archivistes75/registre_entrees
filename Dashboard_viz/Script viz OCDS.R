 # Registre d'entrée archivistes de France


######## VISUALISATIONS JEU AVIGNON


# Import base
library(tidyverse)
avignon <- read_csv("C:/Users/diane/Desktop/Archives_registre_dentrees/siaf/Dashboard_viz/Avignon.csv")
stetienne <- read_csv("C:/Users/diane/Desktop/Archives_registre_dentrees/siaf/Dashboard_viz/StEtienne.csv")


# Format des données
str(avignon)


### Statistiques descriptives
summary(avignon)
table(avignon$nature)
table(avignon$modeEntree)

# Création d'une colonne où on récup l'année de la date d'entrée
avignon$dateYear <- format(as.Date(avignon$dateEntree, format="%d/%m/%Y"),"%Y")

# On remplace le mode d'entrée 'collecte' par 'collecte privée'
library(stringr)
avignon$modeEntree <- str_replace_all(avignon$modeEntree, c("Collecte"="Collecte privée"))


 

    # Représentations graphiques des variables à caractère obligatoire



#-------------------------------------------------------------------------------------------------------------------------


### R.G n°1 : nb d'archives entrées par année
    # création du tableau des fréquences par année
t1 <- as.data.frame(table(avignon$dateYear))
str(t1)
t1$Var1 <- as.character(t1$Var1)  # étape intermédiaire sinon remplace les années par un ID de 1 à 24 
t1$Var1 <- as.integer(t1$Var1)
    # plot
library(ggplot2)
library(gifski)   # lire 1 fois l'anim puis figer le graph
library(gganimate)
ggplot(t1, aes(Var1, Freq)) +  
   geom_line(aes(y=Freq), colour="orange", lwd=1) +
   geom_point(colour="orange", shape=16, cex=3) +
   labs(title ="Évolution du nombre de documents entrés chaque année", y = "Nombre d'archives entrées", x="Année de l'entrée") +
#   transition_reveal(Var1)+
   theme_linedraw() +
        theme(plot.title = element_text(face = "bold")) +
        theme(axis.title.y = element_text(size=12)) +
        theme(axis.title.x = element_text(size=12))

#gganimate::animate(ggp, renderer = gifski_renderer(loop = F))  # anim x1


#-------------------------------------------------------------------------------------------------------------------------


  # Tableau des fréquences
avignon$dateYear <- factor(avignon$dateYear, levels = c(min(data$dateYear):max(data$dateYear)))
t1 <- as.data.frame(table(avignon$dateYear))   # ces commandes permettent de récupérer des fréquences pour toutes les années même si aucune archive n'a été rentrée (:freq=0 alors)

  # On prépare les données au graph
t11 <- stats::ts(t1$Freq, frequency=1, start=1989)

  # Plot
dygraph(t11) %>% dyRangeSelector() %>% dyOptions(stackedGraph = TRUE) %>% dySeries("V1", label = "Nombre d'entrées") %>%
  dyHighlight(highlightSeriesOpts = list(strokeWidth = 2))





#-------------------------------------------------------------------------------------------------------------------------


### R.G n°2 : nb d'archives entrées par année selon le type
  # création du tableau des fréquences par année selon le mode d'entrée
t1bis <- subset(as.data.frame(table(avignon$dateYear, avignon$modeEntree)), Freq = 0) #fréquences
colnames(t1bis) <- c("dateYear", "modeEntree", "n") # mise en forme de la table
str(t1bis)
t1bis$dateYear <- as.character(t1bis$dateYear)  # exploitabilité
t1bis$dateYear <- as.integer(t1bis$dateYear)

  # label font
windowsFonts(A = windowsFont("Times New Roman"))  # on définit la police des labels (pour harmoniser la dashboard et reproduire le visu de ggplotly)

  # plot
library(ggthemes)
p <- ggplot(t1bis, aes(x=dateYear, y=n, colour=modeEntree,  
                text = paste("", "Mode d'entrée :", modeEntree, # customisation du texte à afficher
                              "\n", "Année :", dateYear,
                              "\n", n, "archives"), group=modeEntree)) +  
   geom_line(aes(x=dateYear, y=n), lwd=1) +
   theme_light() +
   labs(title ="Nombre de documents entrés chaque année selon le type",
        y = "Nombre d'archives entrées", 
        x="Année de l'entrée") +
        theme(plot.title = element_text(face = "bold")) +
        theme(axis.title.y = element_text(size=12, family="Times New Roman")) +
        theme(axis.title.x = element_text(size=12)) +
   facet_wrap(vars(modeEntree)) +
   theme(legend.position = 'none') +
   guides(colour = FALSE)
library(plotly)
ggplotly(p, source = "select", tooltip=c("text"))


#-------------------------------------------------------------------------------------------------------------------------


### R.G n°3 : nb d'archives entrées par année selon le type
  # calcul des fréquences cumulées par année selon le mode d'entrée
t1bis <- t1bis %>% group_by(modeEntree) %>% mutate(count=cumsum(n)) # fréquences cumulées
  # plot
library(plotly)
library(viridis)
library(ggthemes)
library(hrbrthemes)
p <- t1bis %>%
     ggplot(aes(x=dateYear, y=count, fill=modeEntree,  
                text = paste("Mode d'entrée :", modeEntree, # customisation du texte à afficher
                              "\nAnnée :", dateYear,
                              "\n", count, "archives"), group=modeEntree))+
     geom_area(alpha=0.6 , size=.5, colour="white")+
     scale_fill_viridis(discrete = T, name="Mode d'entrée")+
     theme(legend.position = 'none')+
     theme_ipsum()+
     ggtitle("Nombre cumulé d'archives entrées par mode d'entrée depuis 1989") +
     labs(y = "Nombre cumulé de dépôt", x='Année du dépôt')
p <- ggplotly(p, source = "select", tooltip=c("text"))
p
  # save it
library(htmlwidgets)
#saveWidget(p, "plotly.html", selfcontained = F, libdir = "lib")




#-------------------------------------------------------------------------------------------------------------------------

### R.G n°4 : part de chaque mode d'entrée ds total archives entrées sur la période
    # création du tableau des fréquences par mode d'entrée
t2 <- as.data.frame(table(avignon$modeEntree))
colnames(t2) <- c("modeEntree", "Freq")
    # plot où on met la fréquence en pourcentage puis on réordonne par ordre décroissant
library(gmodels)
library(forcats)
t2 %>% mutate(Freq = Freq/sum(Freq)) %>% 
  mutate(modeEntree = fct_reorder(modeEntree, Freq)) %>% 
  ggplot(aes(x=modeEntree, y=Freq)) +
    geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.4) +
    coord_flip() +
    ylab("Pourcentage des archives entrées de 1989 à 2020") + xlab("Mode d'entrée") + ggtitle("Répartition des archives selon le mode d'entrée") +
    theme_bw() +
    scale_y_continuous(labels = scales::percent_format())  # afficher des % sur la règle des y (abscisses car coord_flip)




#-------------------------------------------------------------------------------------------------------------------------

### R.G n°5 : part de chaque mode d'entrée ds total archives entrées sur 1 année complète
    # création du tableau des fréquences par mode d'entrée selon l'année
t2_individual <- as.data.frame(table(avignon$modeEntree, avignon$dateYear))
colnames(t2_individual) <- c("modeEntree", "dateYear", "Freq")
  # plot
t2_individual %>% ggplot(aes(x=modeEntree, y=Freq)) +
  geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.4) + coord_flip() + 
  facet_wrap(vars(dateYear)) +
  ylab("Nombre d'entrées") + xlab("Mode d'entrée") + ggtitle("Fréquence des entrées par année selon le type") + theme_bw()

  # OU BIEN
t2_bis <- avignon %>% group_by(dateYear) %>% count(modeEntree) # pas de facette pour les années sans entrées d'archives

plot2_t2 <- t2_bis %>% 
  ggplot(aes(x=modeEntree, y=n,  
                text = paste("Mode d'entrée :", modeEntree, # customisation du texte à afficher
                              "\nNombre d'archives :", n), group=modeEntree)) +
  geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.4) + 
  coord_flip() + 
  ylab("Nombre d'entrées") + xlab("Mode d'entrée") + 
  theme(text = element_text(size=rel(3.5)),
        strip.text.x = element_text(size=rel(3.5)),
        label.text = element_text(size=rel(500)),
        axis.ticks.x = element_text(size=rel(500)),
        strip.text.y = element_text(size=rel(3.5))) +
  facet_wrap(vars(dateYear)) +
  theme_bw()

ggplotly(plot2_t2, tooltip=c("text"))

        
#-------------------------------------------------------------------------------------------------------------------------


### R.G n°6 : Mode d'entrée des archives selon qu'elles soient publiques ou privées
  # création du tableau des fréquences par mode d'entrée selon la nature (publique ou privée)
t3 <- as.data.frame(table(avignon$modeEntree, avignon$nature))
colnames(t3) <- c("modeEntree", "nature", "Freq")
  # OU BIEN : pas d'obs qd fréq=0, évite les "trous" visuels
t3 <- avignon %>% group_by(nature) %>% count(modeEntree)
t3 <- na.omit(t3)
  # plot
library(ggthemes)
library(hrbrthemes)
ggplot(t3, aes(fill=modeEntree, y=n, x=nature)) + 
    geom_bar(stat="identity", position=position_dodge()) +
    scale_fill_viridis_d(name="Type d'entrée", option = "C", direction = 1) +
  #  scale_fill_brewer(palette = "Spectral", direction = 1, name="Type d'entrée")  +
    ggtitle("Nombre d'entrées selon le type et la nature") +
    theme_ipsum() +
    xlab("") + ylab("Nombre d'archives") +
        theme(axis.title.y = element_text(size=12, face="italic"))


#-------------------------------------------------------------------------------------------------------------------------

### R.G n°7 : Nature du support des archives

  # On attribue des valeurs aléatoires à la nature du support non rentré pour Avignon mais présent désormais ds le standard
nature <- c("Support papier", "Support électronique", "Support mixte")
avignon$natureSupport <- sample(nature, size = nrow(avignon), replace = TRUE, prob = c(9/10,0.06,0.04))
  # On récupère un tableau des fréquences
t4 <- as.data.frame(table(avignon$natureSupport))
t4bis <- avignon %>% group_by(nature) %>% count(natureSupport)
t4bis <- na.omit(t4bis)

  # plot
t4bis <- t4bis %>% group_by(nature) %>% mutate(ypos = cumsum(n) - 0.5*n) %>% ungroup()  # position y label on graph
ggplot(t4bis, aes(fill=natureSupport, y=n, x=nature)) + 
    geom_bar(position="stack", stat="identity") +
    geom_text(aes(y=ypos, label=n), vjust=1.3, color="white", size=5)+
    scale_fill_viridis(discrete = T, name="Nature du support") +
    ggtitle("Nature du support des archives entrées selon leur type") +
      labs(caption="Données non réelles pour la nature du support") +
    theme_ipsum() +
    xlab("") + ylab("Nombre d'entrées") +
        theme(axis.title.y = element_text(size=12))

# Export base complète càd équivalente au standard donc analyse reproductible si basée sur ces données finalisées.
#write.csv(avignon,"./Dashboard_viz/Avignon.csv", row.names = FALSE, fileEncoding = "UTF-8")
  


#-------------------------------------------------------------------------------------------------------------------------

### R.G n°8 :  Wordcloud à partir de la colonne activiteProd

  # prepare data
library(e1071)
library(mlbench)
library(tm)
library(SnowballC)
data_wordcloud <- glimpse(avignon)
corpus = Corpus(VectorSource(data_wordcloud$activiteProd))

corpus = tm_map(corpus, PlainTextDocument) #Conversion to Lowercase
corpus = tm_map(corpus, tolower)
corpus = tm_map(corpus, removePunctuation) #Removing Punctuation
corpus = tm_map(corpus, removeWords, c("cloth", remix_stopwords)) #Remove stopwords
corpus = tm_map(corpus, stripWhitespace) # Eliminate white spaces
corpus[[1]][1] 

DTM <- TermDocumentMatrix(corpus)
mat <- as.matrix(DTM)
f <- sort(rowSums(mat),decreasing=TRUE)  #moment d'ajouter ville !
dat <- data.frame(word = names(f),freq=f)
head(dat, 5)

  #plot
library(wordcloud2) 
wc <- wordcloud2(data=dat, size=1.6, col="grey", minRotation = -pi/6, maxRotation = -pi/6, rotateRatio = 1)

# Save plot
library(webshot)
webshot::install_phantomjs()
webshot("wc.png")


#-------------------------------------------------------------------------------------------------------------------------

### R.G n°9:  Wordcloud à partir de la colonne descContenu
library(wordcloud2)
corpus2 = Corpus(VectorSource(data_wordcloud$descContenu))

corpus2 = tm_map(corpus2, PlainTextDocument) #Conversion to Lowercase
corpus2 = tm_map(corpus2, tolower)
corpus2 = tm_map(corpus2, removePunctuation) #Removing Punctuation

ajout_stopwords <- c("d'", "d", "article", "articles")
remix_stopwords <- c(ajout_stopwords, stopwords("french"))

corpus2 = tm_map(corpus2, removeWords, c("cloth", remix_stopwords)) #Remove stopwords
corpus2 = tm_map(corpus2, stripWhitespace) # Eliminate white spaces

DTM2 <- TermDocumentMatrix(corpus2)
mat2 <- as.matrix(DTM2)
f2 <- sort(rowSums(mat2),decreasing=TRUE)
dat2 <- data.frame(word = names(f2),freq=f2)

  #plot
wordcloud2(data=dat, size=1.6, col=rep_len(c("#66CCFF", "#0099CC", "#3399CC", "#006699", "#0066FF", "#0033CC", "#0066CC", "#0000FF"), nrow(dat)))

wordcloud2(data=dat2, size=1.2, color=rep_len(c("#1D3139","#E5555C"), nrow(dat2)), backgroundColor="#FAF3EE")

letterCloud(data=dat2, size=1, word="ARCHIVES", color=rep_len(c("#1D3139","#E5555C"), nrow(dat2)))



# Change the shape using your image
wordcloud2(dat2, figPath = "~/Desktop/R-graph-gallery/img/other/peaceAndLove.jpg", size = 1.5, color = "skyblue", backgroundColor="black")





#________________________________________________________________________________________________
# POUBELLE, old graphs :
#________________________________________________________________________________________________


library(treemap)
library(RColorBrewer)
tree <- treemap(t4bis, index=c("nature","natureSupport"), 
        vSize="n", 
        type="categorical", # categorical ou index avec palette
        vColor="nature", position.legend = "none",
    title = "Nature du support  des archives déposées selon leur nature",
    show.labels=TRUE, truncate.labels=c(2,4,6),
  #  palette = brewer.pal(n=6,"Blues"),
  #  color = c("#33CC00", "#FFCC00"),
    fontsize.labels=c(19,15),                # size of labels
    fontcolor.labels=c("white","black"),     # Color of labels
    fontface.labels=c(2,1),                  # Font of labels: 1,2,3,4 for normal, bold, italic, bold-italic...
    bg.labels=c("transparent"),              # Background color of labels
    align.labels=list(
        c("center", "top"), 
        c("center", "center")),              # Where to place labels in the rectangle?
    overlap.labels=0.5,                      # number between 0 and 1 that determines the tolerance of the overlap between labels. 0 means that labels of lower levels are not printed if higher level labels overlap, 1  means that labels are always printed. In-between values, for instance the default value .5, means that lower level labels are printed if other labels do not overlap with more than .5  times their area size.
    inflate.labels=F,                        # If true, labels are bigger when rectangle is bigger.
)


#-------------------------------------------------------------------------------------------

  # tableau croisé 
t3 <- avignon %>% group_by(nature) %>% count(modeEntree)
t3 <- na.omit(t3)
  # par type d'archives (publiques ou privées)
t3_prive <- t3 %>% filter(nature == "Archives privées" & n > 2) %>% arrange(desc(n))
t3_public <- t3 %>% filter(nature == "Archives publiques" & n > 2) %>% arrange(desc(n))
  # plot
par(mfrow=c(1,2))
bplt <- barplot(height=t3_prive$n, names=t3_prive$modeEntree,
        col=rgb(0.8,0.1,0.1,0.6),
        ylab="Nombre d'archives déposées", main="Principaux modes d'entrée des archives", sub = "Privées",
        ylim=c(0, 1.1*max(t3_public$n)), #las=2, # x.text.axis vertical 
        cex.main=1.3, font.sub=3, col.lab="#999999"
        )
#text(bplt, par("usr")[3], labels = t3_prive$modeEntree, srt = 45, adj = c(1.1,1.1), xpd = TRUE, cex=1) 
barplot(height=t3_public$n, names=t3_public$modeEntree, sub = "Publiques",
        col="#3399CC",
        ylab="Nombre d'archives déposées",
        ylim=c(0, 1.1*max(t3_public$n)), 
        font.sub=3, col.lab="#999999"
        )

#-------------------------------------------------------------------------------------------


ggplot(t3_freq_toutes_modalites, aes(fill=nature, y=Freq, x=modeEntree)) + 
    geom_bar(position="stack", stat="identity") +
 #   geom_text(aes(y=ypos, label=n), vjust=1.3, color="white", size=5)+
    scale_fill_viridis(discrete = T, name="Nature du support") +
    ggtitle("Nature du support des archives déposées selon leur nature") +
    theme_ipsum() +
    xlab("") + ylab("Nombre d'archives déposées") +
        theme(axis.title.y = element_text(size=12)) +
        theme(axis.title.x = element_text(size=12), axis.text.x = element_text(angle = 90))

#-------------------------------------------------------------------------------------------


ggplot(t3_freq_toutes_modalites, aes(fill=modeEntree, y=Freq, x=nature)) + 
    geom_bar(position="stack", stat="identity") +
 #   geom_text(aes(y=ypos, label=n), vjust=1.3, color="white", size=5)+
    scale_fill_viridis(discrete = T, name="Nature du support") +
    ggtitle("Nature du support des archives déposées selon leur nature") +
    theme_ipsum() +
    xlab("") + ylab("Nombre d'archives déposées") +
        theme(axis.title.y = element_text(size=12)) +
        theme(axis.title.x = element_text(size=12))


#-------------------------------------------------------------------------------------------


  # plot n°3
ggplot(t3_freq_toutes_modalites, aes(fill=nature, y=Freq, x=modeEntree)) + 
    geom_bar(stat="identity", position=position_dodge()) +
 #   geom_text(aes(y=ypos, label=n), vjust=1.3, color="white", size=5)+
    scale_fill_viridis(discrete = T, name="Nature du support") +
    ggtitle("Nature du support des archives déposées selon leur nature") +
    theme_ipsum() +
    xlab("") + ylab("Nombre d'archives déposées") +
        theme(axis.title.y = element_text(size=12)) +
        theme(axis.title.x = element_text(size=12), axis.text.x = element_text(angle = 90))