Spécification du modèle de données relatif aux registres des entrées des services publics d'archives.


### Modèle de données

[VERSION PROVISOIRE SOUMISE A AVIS]

Ce modèle de données repose sur les 20 champs suivants correspondant aux colonnes du [fichier tabulaire](https://docs.google.com/spreadsheets/d/1O-8Hhw6_78BILxNAchl391cpYNXpck2S1cTH1bXM_d8/edit?usp=sharing).

#### `ID`

- **titre** : Identifiant unique de chaque entrée

- **description** : Identifiant unique de chaque entrée sous la forme : l'identifiant du service archives, année d'entrée et numéro incrémental.

- **type** : Chaîne de caractères

- **exemple** : `FRAC_13001_2020_001`
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

#### `servProd`

- **titre** : Service producteur

- **description** : Permet d'identifier la personne physique ou morale qui a produit les documents

- **type** : Chaîne de caractères

- **exemple** : `Service de l'achat public`

- valeur optionnelle

#### `fonctionProd`

- **titre** : Fonction du producteur

- **description** : permet d'identifier la fonction du producteur, liste établie à partir des éléments du SIAF 

- **type** : Chaîne de caractères

- **exemple** : `Communes de plus de 2 000 habitants`

- valeur obligatoire

- **valeurs autorisées** : ["Présidence de la République", "Premier ministre", "Ministères (directions d'administration centrale) ", "Assemblées parlementaires", "Grands organes de contrôle", "Services déconcentrés et établissements publics de l’État à compétence départementale ou locale", "Services déconcentrés et établissements publics de l’État à compétence régionale ou supra-départementale", "Administrations centrales délocalisées et établissements publics nationaux de l’État", "Communes de plus de 2 000 habitants", "Communes de moins de 2 000 habitants", "Services du conseil départemental et établissements publics départementaux", "Services du conseil régional et établissements publics régionaux", "Services de la commune et établissements publics communaux", "Structures intercommunales ou interdépartementales", "Établissements publics de santé", "Organismes de droit privé chargés d’une mission de service public", "Officiers publics ou ministériels (dont notaires) ", "Producteurs privés"]

- **commentaire** : La séparation entre fonction et domaine répond à la nouvelle organisation définie pa le SIAF et mise en place au sein de l'enquête annuelle. 

#### `domaineProd`

- **titre** : Domaine ou thématique d'action du producteur

- **description** : Permet d'identifier le domaine d'activité du producteur, liste établie à partir des éléments du SIAF 

- **type** : Chaîne de caractères

- **exemple** : `Ressources humaines`

- valeur obligatoire

- **valeurs autorisées** : ["Instances de délibération", "Direction, cabinet", "Administration générale (fonctions transverses hors RH)", "Finances, fiscalité", "Ressources humaines", "Économie, industrie", "Agriculture", "Équipement, environnement", "Travail, emploi", "Affaires sociales, santé", "Justice", "Police, protection civile, intérieur", "Éducation, recherche", "Culture, jeunesse et sports", "Défense, anciens combattants", "Outre-mer", "Archives privées personnelles et familiales", "Archives privées cultuelles", "Archives privées d'associations, de partis politiques, de syndicats", "Archives privées d'entreprises", "Archives privées de professionnels (architectes, photographes...)"]

- **commentaire** : La séparation entre fonction et domaine répond à la nouvelle organisation définie pa le SIAF et mise en place au sein de l'enquête annuelle. Les valeurs "Archives privées personnelles et familiales", "Archives privées cultuelles", "Archives privées d'associations, de partis politiques, de syndicats", "Archives privées d'entreprises", "Archives privées de professionnels (architectes, photographes...)" sont à réserver aux éléments qui possèdent l'élément "Producteurs privés" en *fonction du producteur*.

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

- **description** : Correspond à la volumétrie de fichiers électroniques présents dans l'entrée en Go

- **type** : nombre réel

- **exemple** : `2.30`

- valeur optionnelle

- - **commentaire** : le séparateur décimal doit être le point **.** L'unité sera rappelée en métadonnée.

#### `objElec`

- **titre** : Nombre d'objets électroniques 

- **description** : Permet d'indiquer le nombre d'objets électroniques d'une entrée

- **type** : nombre entier

- **exemple** : `234`
