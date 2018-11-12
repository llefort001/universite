-- Creation de la table étudiant selon le modèle relationnel
CREATE TABLE etudiant (
  num int not null,
  nom varchar(255) not null,
  prenom VARCHAR(255) not null,
  genre varchar(1) not null,
  date_naiss Date not null,
  login varchar(255) not null,
  password char(40) character set ascii not null
)engine=innodb;-- Pour pouvoir gérer des clés étrangères

-- Creation de la table master selon le modèle relationnel
CREATE TABLE master (
  code_parcours varchar(255) not null,
  annee Date not null,
  intitule varchar(255) not null
)engine=innodb;-- Pour pouvoir gérer des clés étrangères

-- Creation de la table video selon le modèle relationnel
CREATE TABLE video (
  url varchar(255) not null,
  titre varchar(255) not null
)engine=innodb;-- Pour pouvoir gérer des clés étrangères
-- Ajout de la clé primaire à étudiant
ALTER TABLE etudiant
  ADD CONSTRAINT pk_etudiant PRIMARY KEY (num);

-- Ajout de la clé primaire à master
ALTER TABLE master
  ADD CONSTRAINT pk_master PRIMARY KEY (code_parcours);

-- Ajout de la clé primaire à video
ALTER TABLE video
  ADD CONSTRAINT pk_video PRIMARY KEY (url);

-- Ajout de la contrainte de relation etudiant_master selon le modèle relationnel
ALTER TABLE etudiant
  ADD master_code_parcours varchar(255) not null,
  ADD CONSTRAINT fk_etudiant_master
FOREIGN KEY(master_code_parcours)
REFERENCES master(code_parcours);

-- Création de la table de jointure etudiant_video
CREATE TABLE etudiant_video (
  etudiant_num int not null,
  video_url varchar(255) not null,
  note int not null
)engine=innodb;-- Pour pouvoir gérer des clés étrangères


-- Ajout de la clé primaire composée du numero étudiant et du nom de la vidéo ainsi que des clés étrangères liant les autres tables
ALTER TABLE etudiant_video
  ADD CONSTRAINT PRIMARY KEY (
etudiant_num, video_url),
  ADD CONSTRAINT
FOREIGN KEY(etudiant_num)
REFERENCES etudiant(num),
  ADD CONSTRAINT
FOREIGN KEY(video_url)
REFERENCES video(url);