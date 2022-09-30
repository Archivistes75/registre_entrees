Spécification du modèle de données relatif aux registres des entrées des services publics d'archives.


### Modèle de données

La version validée 1.0 du schéma de registre des entrées se trouve [ici](Schema_registre_entrees/Schema_registre_entrees_V1.1.xlsx).

Un [gabarit](Schema_registre_entrees/Schema_registre_entrees_gabarit.xlsx) au format tableur est également prévu pour faciliter la réalisation d'un registre des entrée au format du schéma.

#### `ID`

- **titre** : Identifiant unique de chaque entrée

- **description** : Identifiant unique de chaque entrée composés de ces trois éléments séparés par des tirets bas : l'identifiant du service archives, année d'entrée et un identifiant unique (numéro incrémental, identifiant technique...).

- **type** : Chaîne de caractères

- **exemple** : `FRAC_13001_2020_001`, `FRAN_2020_aeaqaaaabehgml5fab7gialyq46s4jyaaaca`
`
- valeur obligatoire

- **commentaire** : L'identifiant du service d'archives peut être composé soit du numéro utilisé pour identifier les IR, ou pour des services d'entreprises le SIREN ou pour d'autres types de services le RCR, le numéro Muséophile. Dans ce cas, il faut renseigneer cet éléments dans les métadonnées associées.

#### `nomArch`

- **titre** : Nom du service archives 

- **description** : Nom sous forme textuelle du service d'archives dans lequel sont entrées les archives

- **type** : Chaîne de caractères

- **exemple** : `Archives municipales d'Aix-en-Provence`

- valeur obligatoire

#### `coteArch`

- **titre** : Cotation

- **description** : Identifiant de l'entrée d’archives et correspondant à sa place dans le cadre de classement (série et sous-série). Dans le cas où les articles sont connus dès l'entrée, ils peuvent être ajoutés à la cotation (mais cela reste optionnel).

- **type** : Chaîne de caractères

- **exemple** : `1238W`, `1240W1-12`

- valeur optionnelle

#### `dateEntree`

- **titre** : Date d'entrée 

- **description** : Date à laquelle les documents sont entrés dans le service d'archives au format ISO8601

- **type** : Date

- **exemple** : `2020-08-26`

- valeur obligatoire

#### `statutJur`

- **titre** : Statut juridique des documents entrés

- **description** : Permet d'identifier le statut juridique des archives

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

- **valeurs autorisées** : ["Versement", "Dépôt", "Don", "Achat", "Dévolution", "Leg ou Dation", "Copie", "Réintégration", "Protocole", "Autre"]

#### `orgaVers`

- **titre** : Organisation qui verse l'entrée

- **description** : Nom de l'organisation qui a versé l'entrée, distincte du service qui a produit les entrées dans l'organisation. Dans le cas où des identifiants pérennes existent pour identifier les organisations versantes, elles peuvent être ajoutées en complément du nom de l'organisation : URI - Nom de l'organisation. Ce champ peut comporter plusieurs valeurs, dans ce cas, les éléments sont séparés par une barre verticale *pipe* "|".

- **type** : Chaîne de caractères

- **exemple** : `Ville d'Aix-en-Provence`, `FR78422804100033_000000011 - Tribunal administratif`

- valeur optionnelle

#### `servVers`

- **titre** : Service qui verse l'entrée

- **description** : permet d'identifier la personne physique ou morale qui a transféré les documents

- **type** : Chaîne de caractères

- **exemple** : `Service de l'achat public`

- valeur optionnelle

#### `orgaProd`

- **titre** : Organisation productrice de l'entrée

- **description** : nom de l'organisation qui a produit l'entrée, distincte du service qui a produit les entrées dans l'organisation. Dans le cas où des identifiants pérennes existent pour identifier les organisations versantes, elles peuvent être ajoutées en complément du nom de l'organisation : URI - Nom de l'organisation. Ce champ peut comporter plusieurs valeurs, dans ce cas, les éléments sont séparés par une barre verticale *pipe* "|".

- **type** : Chaîne de caractères

- **exemple** : `Ville d'Aix-en-Provence`, `FR78422804100033_000000011 - Tribunal administratif`

- valeur optionnelle

#### `servProd`

- **titre** : Service producteur

- **description** : Permet d'identifier la personne physique ou morale qui a produit les documents

- **type** : Chaîne de caractères

- **exemple** : `Service de l'achat public`, `Service producteur inconnu`

- valeur obligatoire

- **commentaire** : Si le producteur est inconnu, saisir `Service producteur inconnu`

#### `typeProd`

- **titre** : Fonction du producteur

- **description** : permet d'identifier la fonction du producteur, liste établie à partir des éléments du SIAF 

- **type** : Chaîne de caractères

- **exemple** : `Commune et établissement public communal`

- valeur obligatoire

- **valeurs autorisées** : ["Présidence de la République", "Premier ministre", "Ministère (administration centrale) ", "Assemblée parlementaire", "Grand organe de contrôle", "Service déconcentré et établissement public de l’État à compétence départementale ou locale", "Service déconcentré et établissement public de l’État à compétence régionale ou supra-départementale", "Etablissement public national", "Commune et établissement public communal", "Conseil départemental et établissement public départemental", "Conseil régional et établissement public régional", "Structure de coopération intercommunale ou interdépartementale", "Établissement public de santé", "Organisme de droit privé chargé d’une mission de service public", "Officier public ou ministériel (dont notaire) ", "Producteur privé"]

- **commentaire** : La séparation entre type et activité répond à la nouvelle organisation définie pa le SIAF et mise en place au sein de l'enquête annuelle. 

#### `activiteProd`

- **titre** : Domaine ou thématique d'action du producteur

- **description** : Permet d'identifier le domaine d'activité du producteur, liste établie à partir des éléments du SIAF 

- **type** : Chaîne de caractères

- **exemple** : `Administration générale (fonctions transverses, RH) | Culture, jeunesse et sports`

- valeur obligatoire

- **valeurs autorisées** : ["Instance de délibération", "Direction, cabinet", "Administration générale (fonctions transverses, RH)", "Finances, fiscalité", "Économie, industrie", "Agriculture", "Équipement, environnement", "Travail, emploi", "Affaires sociales, santé", "Justice", "Police, protection civile, intérieur", "Éducation, recherche", "Culture, jeunesse et sports", "Défense, anciens combattants", "Outre-mer", "Archives privées personnelles et familiales", "Archives privées cultuelles", "Archives privées d'associations, de partis politiques, de syndicats", "Archives privées d'entreprises", "Archives privées professionnelles"]

- **commentaire** : La séparation entre type et activité répond à la nouvelle organisation définie pa le SIAF et mise en place au sein de l'enquête annuelle. Les valeurs "Archives privées personnelles et familiales", "Archives privées cultuelles", "Archives privées d'associations, de partis politiques, de syndicats", "Archives privées d'entreprises", "Archives privées de professionnels (architectes, photographes...)" sont à réserver aux éléments qui possèdent l'élément "Producteurs privés" en *fonction du producteur*. Ce champ peut comporter plusieurs valeurs, dans ce cas, les éléments sont séparés par une barre verticale *pipe* "|".

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

- **exemple** : `Support physique`

- valeur obligatoire

- **valeurs autorisées** : ["Support physique","Support électronique","Support mixte"]

#### `mlEntree`

- **titre** : Métrage linéaire de l'entrée

- **description** : Volume en mètre linéaire de l'entrée. Le séparateur décimal doit être le point. L'unité sera rappelée en métadonnée.

- **type** : nombre réel

- **exemple** : `1.60`

- valeur optionnelle

- **commentaire** : le séparateur décimal doit être le point . L'unité sera rappelée en métadonnée.

#### `nbreArt`

- **titre** : Nombre d'articles

- **description** : Permet d'indiquer le nombre d'articles d'une entrée

- **type** : nombre entier

- **exemple** : `56`

- valeur optionnelle

#### `volElec`

- **titre** : Volume d'archives électroniques de l'entrée

- **description** : Correspond à la volumétrie de fichiers électroniques présents dans l'entrée en Go. Le séparateur décimal doit être le point. L'unité sera rappelée en métadonnée.

- **type** : nombre réel

- **exemple** : `2.30`

- valeur optionnelle

- **commentaire** : le séparateur décimal doit être le point **.** L'unité sera rappelée en métadonnée.

#### `objElec`

- **titre** : Nombre d'objets électroniques 

- **description** : Permet d'indiquer le nombre d'objets électroniques d'une entrée

- **type** : nombre entier

- **exemple** : `234`
