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

# - Le schéma registre des entrées

[EN CONSTRUCTION]


Spécification du modèle de données relatif aux registres des entrées des services publics d'archives.

## Contexte

[EN CONSTRUCTION]

## Outils

[EN CONSTRUCTION]

## Voir aussi

[EN CONSTRUCTION]

## Registres des entrées

[EN CONSTRUCTION]

### Modèle de données

[EN CONSTRUCTION]

Ce modèle de données repose sur les 20 champs suivants correspondant aux colonnes du fichier tabulaire.

#### `ID`

- **titre** : Identifiant unique de chaque entrée

- **description** : Identifiant unique de chaque entrée sous la forme : l'identifiant du service archives, année d'entrée et numéro incrémental.

- **type** : Chaîne de caractères

- **exemple** : `FRAC_13001_2020_001
`
- valeur obligatoire

- **commentaire** : L'identifiant du service d'archives peut être composé soit du numéro utilisé pour identifier les IR, ou pour des services d'entreprises le SIREN ou pour d'autres types de services le RCR, le numéro Muséophile. Dans ce cas, il faut renseigneer cet éléments dans les métadonnées associées

#### `nomArch`

- **titre** : Nom du service archives 

- **description** : Nom sous forme textuelle du service d'archives dans où sont entrées les archives

- **type** : chaîne de caractères

- **exemple** : `Archives municipales d'Aix-en-Provence`

- valeur obligatoire

#### `coteArch`

- **titre** : Cotation

- **description** : Identifiant de l'entrée d’archives et correspondant à sa place dans le cadre de classement (série et sous-série)

- **type** : Chaîne de caractères

- **exemple** : `1236W`

- valeur optionnelle

#### `dateEntree`

- **titre** : Date d'entrée 

- **description** : Date à laquelle les documents sont entrés dans le service d'archives au format ISO8601

- **type** : Date

- **exemple** : `2020-08-26`

- valeur obligatoire

#### `nature`

- **titre** : Nature juridique des documents entrés

- **description** : Permet d'identifier le nature juridique des archives

- **type** : Chaîne de caractères

- **exemple** : `Archives publiques`

- valeur obligatoire

- **valeurs autorisées** : ["Archives publiques","Archives privées","Archives publiques et privées"]

- **commentaire** : "Archives publiques et privées" est à réserver pour des entrées qui comporteraient à la fois du contenu public et privé.

#### `modeEntree`

- **titre** : Modalité d'entrée

- **description** : Permet d'identifier le mode d'entrée des archives

- **type** : Chaîne de caractères

- **exemple** : `Versement`

- valeur obligatoire

- **valeurs autorisées** : ["Versement","Don","Achat", "Leg ou Dation", "Copie", "Restitution"]

#### `orgaVers`

- **titre** : Organisation qui verse l'entrée

- **description** : Nom de l'organisation qui a versé l'entrée, distincte du service qui a produit les entrées dans l'organisation

- **type** : Chaîne de caractères

- **exemple** : `Ville d'Aix-en-Provence`

- valeur optionnelle

#### `servVers`

- **titre** : Service versant l'entrée

- **description** : permet d'identifier la personne physique ou morale qui a transféré les documents

- **type** : Chaîne de caractères

- **exemple** : `Service de l'achat public`

- valeur optionnelle

#### `orgaProd`

- **titre** : Organisation productrice de l'entrée

- **description** : Nom de l'organisation qui a produit l'entrée, distincte du service qui a produit les entrées dans l'organisation

- **type** : Chaîne de caractères

- **exemple** : `Ville d'Aix-en-Provence`

- valeur optionnelle

#### `producteur`

- **titre** : Service producteur

- **description** : Permet d'identifier la personne physique ou morale qui a produit les documents

- **type** : Chaîne de caractères

- **exemple** : `Service de l'achat public`

- valeur optionnelle

#### `fonctionProd`

- **titre** : Fonction du producteur

- **description** : Permet d'identifier la fonction du producteur

- **type** : Chaîne de caractères

- **exemple** : `Association`

- valeur obligatoire

- **valeurs autorisées** : [*en attente éléments SIAF*]

- **commentaire** : La séparation entre fonction et domaine répond à la nouvelle organisation définie pa le SIAF et mise en place au sein de l'enquête annuelle. 

#### `domaineProd`

- **titre** : Domaine ou thématique d'action du producteur

- **description** : Permet d'identifier le domaine d'activité du producteur

- **type** : Chaîne de caractères

- **exemple** : `Culture`

- valeur obligatoire

- **valeurs autorisées** : [*en attente éléments SIAF*]

- **commentaire** : La séparation entre fonction et domaine répond à la nouvelle organisation définie pa le SIAF et mise en place au sein de l'enquête annuelle.

#### `descContenu`

- **titre** : Description du contenu

- **description** : Permet de décrire le contenu des archives de l'entrée

- **type** : Chaîne de caractère

- **exemple** : `Marchés publics de prestations intellectuelles`

- valeur obligatoire

#### `dateExD`

- **titre** : Date extrème de début

- **description** : Date du plus vieux document d'archives format AAAA

- **type** : Date

- **exemple** : `2014`

- valeur optionnelle

#### `dateExF`

- **titre** : Date extrème de fin

- **description** : Date du plus récent document d'archives format AAAA

- **type** : Date

- **exemple** : `2020`

- valeur optionnelle

#### `natureSupport`

- **titre** : Nature du support matériel des documents

- **description** : Permet d'indiquer de façon macro la typologie de support des documents

- **type** : Chaîne de caractères

- **exemple** : `Support papier`

- valeur obligatoire

- **valeurs autorisées** : ["Support papier","Support électronique","Support mixte"]

#### `mlEntree`

- **titre** : Métrage linéaire de l'entrée

- **description** : Volument en mètre linéaire de l'entrée

- **type** : nombre réel

- **exemple** : `1.60`

- valeur optionnelle

- - **commentaire** : le séparateur décimal doit être le point . L'unité sera rappelée en métadonnée.

#### `nbreArt`

- **titre** : Nombre d'articles

- **description** : Permet d'indiquer le nombre d'articles d'une entrée

- **type** : nombre entier

- **exemple** : `56`

- valeur optionnelle

#### `volElec`

- **titre** : Volume d'archives électroniques de l'entrée

- **description** : Correspond à la volumétrie de fichiers électroniques présents dans l'entrée

- **type** : nombre réel

- **exemple** : `2.30`

- valeur optionnelle

- - **commentaire** : le séparateur décimal doit être le point **.** L'unité sera rappelée en métadonnée.

#### `objElec`

- **titre** : Nombre d'objets électroniques 

- **description** : Permet d'indiquer le nombre d'objets électroniques d'une entrée

- **type** : nombre entier

- **exemple** : `234`
