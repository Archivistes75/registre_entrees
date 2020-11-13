# SIAF / AAF - Standard des registres d'entrée d'archives

Création d'un schéma de données pour les registres d'entrées d'archives des services publics d'archives. 

* [Copil 1](https://datactivist.coop/siaf/20200703_COPIL1/)
* [Copil 2](https://datactivist.coop/siaf/20200911_COPIL2/) 
* [Copil 3](https://datactivist.coop/siaf/20201105_COPIL3/)



# Introduction

En 2018, 86 kilomètres de documents et plus de 16000Go de données sont venus enrichir les collections des services publics d'archives français (Données du service interministériel des archives de France).

Dans une optique de gestion et de suivi de leurs fonds, les services d'archives consignent chaque entrée d'archives à partir de renseignements sommaires permettant d’identifier et de retracer toutes les arrivées de nouveaux documents (provenance, date d'arrivée dans le service, volume...) : c'est le registre des entrées.

Il est généralement directement tenu au sein d'un système d'information dédié aux archives (le SIA), mais il peut également être réalisé avec un tableur voir sur un cahier.

Dans son [Cadre stratégique commun de modernisation des archives](https://www.gouvernement.fr/cadre-strategique-commun-de-modernisation-des-archives-3042), la Délégation interministérielle aux archives de France, mentionne dans les objectifs 2020-2024 :

> **Objectif 1.4 : Numériser les archives et rendre les archives numériques aisément consultables et exploitables** 
> Il conviendra également de généraliser l’open data dans les services d’archives de l’État et de recommander ce modèle aux services territoriaux d’archives.
La création d'un schéma de données permet de standardiser la diffusion des données produites par les services d'archives. Cette standardisation est impérative pour les ré-utilisateurs car elle permet de faciliter la découverte des jeux de données et de les utiliser, notamment en simplifiant l'alignement à différentes échelles (utilisation sur des échelles locales ou nationales).

#### Pour en savoir plus sur la méthodologie de construction de ce schéma, consultez [ce document](methodologie.md). 

## Quand utiliser ce schéma?

Ce shéma peut être utilisé lors de la publication d'un jeu de données de registre des entrées. Il a été créé par des services publics d'archives mais il peut tout à fait convenir à des services d'archives privées ou à des établissements spécialisés.

## Suis-je obligé d'utiliser ce schéma?

Non, aucune obligation car ce schéma n'a pas de caractère réglementaire. En revanche, si vous souhaitez publier des données l'utilisation de ce shéma est très fortement recommandée car il peut permettre une réutilisation plus facile de vos données car il est documenté et que vos données sont standardisées et peuvent être agrégée et comparée avec d'autres.


## Recommandations pour le formatage des fichiers

Le format de fichier retenu pour la publication des données est le CSV (Comma Separated Values, valeurs séparées par des virgules).

Les fichiers doivent, sauf exception et autant que possible, respecter les règles de formatage suivantes :

* l’encodage des caractères est UTF-8,

* le séparateur des colonnes est la virgule,

* le séparateur des nombres décimaux est le point,

* le séparateur de valeurs multiples dans un champ est le point-virgule,

* si un champ contient une virgule, il doit être entouré de guillemets doubles,

* chaque ligne doit avoir le même nombre de champs,

* le type MIME ou Content-Type est text/csv.

## Recommandations pour le nommage des fichiers

Les fichiers doivent, sauf exception et autant que possible, respecter les règles de nommage suivantes :

AAAAMMJJ_idProducteur_registre_des_entrees_millesime.csv

* AAAAMMJJ : Date de création du fichier

* idServArch : identifiant du service d'archives (ex. FRAD_001)

* registre_des_entrees : nom du fichier, en minuscules non accentuées
    
* millésime : année des entrées

* extension : Si les règles de formatage sont respectées, l'extension est .csv

**Exemple** : '20201012_FRAD_001_registre_des_entrees_2020.csv'

## Recommandations pour la mise en conformité

Ces conseils reprennent ceux du [Schéma des données locales publié par Open Data france](https://scdl.opendatafrance.net/docs/recommandations-relatives-aux-jeux-de-donnees.html)

Les fichiers doivent comporter :

   * Toutes les colonnes, y compris celles dont les cellules ne sont pas renseignées, dans le bon ordre, et avec des en-têtes correctement nommées sur la première ligne (nom correspondant strictement au schéma)

   * Autant de lignes que nécessaire comprenant des cellules dont les valeurs peuvent être obligatoires (elles doivent être impérativement renseignées) ou optionnelles (elles sont seulement recommandées ou soumises à condition de disponibilité / pertinence)
   
   * Traitement des cellules vides (absence de valeur ou valeur équivalente à 0) : ces cellules doivent être laissées vides. Dans le cas où une valeur numérique est égale à zéro elle doit être écrite 0.0 (zéro [point] zéro), et, dans le cas où des caractères spéciaux sont utilisés pour remplacer des valeurs manquantes (ex. "-" ou "NaN"), cela doit être mentionné dans les métadonnées.

## Recommandations pour la découvrabilité

Le respect du nommage de fichier et des métadonnées du schéma doivent permettre de découvrir l'ensemble des jeux de données répondant au schéma.

# - Les étapes de publication d'un jeu de données

Pour préparer la publication de vos données, vous pouvez trouver des informations sur les fiches pratiques réalisées par [OpenDataFrance](https://opendatafrance.gitbook.io/odl-ressources/fiches-pratiques/premiers-pas/preparer-les-donnees-pour-une-publication-en-open-data)

## Identifier les données
Lors de la phase de création du standard, nous avons identifié deux sources de productions des données, elles peuvent :

* provenir des systèmes d'information des services d'archives (SIA)

* provenir de fichers tabulaires (excel, calc)

## Préparer les données

Il va falloir préparer les données afin qu'elles correspondent au modèle défini par le standard. Il peut être nécessaire de changer le nom des colonnes, de supprimer ou ajouter certaines colonnes, de modifier des valeurs etc.

## Documenter les données

[EN CONSTRUCTION]

* Gérér les métadonnées


    **Métadonnées descriptives**
        * Nom du producteur du jeu de données :
        * Titre du jeu de données :
        * Description du jeu de données :
        * Taille du fichier :
        * Catégories (tag) :
            
    
    **Métadonnées administratives**
    
        * Date de création du jeu de données :
        * Date de modification :
        * Licence :
        * Fréquence de mise à jour :
        * Période temporelle couverte :
        * Aire géographique couverte :
        * Contact :
        

## Choisir une licence

[EN CONSTRUCTION]

## Où publier ses données

[EN CONSTRUCTION]

# Le schéma registre des entrées

[EN CONSTRUCTION]

#### Le schéma est en cours de construction, à terme il prendra [cette forme](standard.md) (attention les champs ne sont pas stabilisés).
