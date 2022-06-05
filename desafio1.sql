DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone ;

CREATE TABLE SpotifyClone.subscriptions (
  subscription_id INT NOT NULL AUTO_INCREMENT,
  subscription_type VARCHAR(45) NULL,
  subscription_value DECIMAL(3,2) NULL,
  PRIMARY KEY (subscription_id))
ENGINE = InnoDB;

CREATE TABLE SpotifyClone.user (
  id_user INT NOT NULL AUTO_INCREMENT,
  user_name VARCHAR(45) NULL,
  user_age INT NULL,
  signup_date DATE NULL,
  subscriptions_subscription_id INT NOT NULL,
  PRIMARY KEY (id_user),
  INDEX fk_user_Subscriptions1_idx (subscriptions_subscription_id ASC),
  CONSTRAINT fk_user_Subscriptions1
    FOREIGN KEY (subscriptions_subscription_id)
    REFERENCES SpotifyClone.subscriptions (subscription_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE SpotifyClone.authors (
  id_author INT NOT NULL AUTO_INCREMENT,
  author_name VARCHAR(45) NULL,
  PRIMARY KEY (id_author))
ENGINE = InnoDB;

CREATE TABLE SpotifyClone.albuns (
  id_albums INT NOT NULL,
  album_name VARCHAR(45) NULL,
  launch_date YEAR(4) NULL,
  authors_id_author INT NOT NULL,
  PRIMARY KEY (id_albums),
  INDEX fk_albuns_authors1_idx (authors_id_author ASC),
  CONSTRAINT fk_albuns_authors1
    FOREIGN KEY (authors_id_author)
    REFERENCES SpotifyClone.authors (id_author)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE SpotifyClone.songs (
  id_song INT NOT NULL,
  song_name VARCHAR(45) NULL,
  song_duration_seconds INT NULL,
  albuns_id_albums INT NOT NULL,
  PRIMARY KEY (id_song),
  INDEX fk_songs_albuns_idx (albuns_id_albums ASC),
  CONSTRAINT fk_songs_albuns
    FOREIGN KEY (albuns_id_albums)
    REFERENCES SpotifyClone.albuns (id_albums)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE SpotifyClone.reproductions (
  songs_id_song INT NOT NULL,
  user_id_user INT NOT NULL,
  reproduction_date TIMESTAMP NULL,
  PRIMARY KEY (songs_id_song, user_id_user),
  INDEX fk_songs_has_user_user1_idx (user_id_user ASC),
  INDEX fk_songs_has_user_songs1_idx (songs_id_song ASC),
  CONSTRAINT fk_songs_has_user_songs1
    FOREIGN KEY (songs_id_song)
    REFERENCES SpotifyClone.songs (id_song)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_songs_has_user_user1
    FOREIGN KEY (user_id_user)
    REFERENCES SpotifyClone.user (id_user)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE SpotifyClone.following (
  authors_id_author INT NOT NULL,
  user_id_user INT NOT NULL,
  PRIMARY KEY (authors_id_author, user_id_user),
  INDEX fk_authors_has_user_user1_idx (user_id_user ASC),
  INDEX fk_authors_has_user_authors1_idx (authors_id_author ASC),
  CONSTRAINT fk_authors_has_user_authors1
    FOREIGN KEY (authors_id_author)
    REFERENCES SpotifyClone.authors (id_author)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_authors_has_user_user1
    FOREIGN KEY (user_id_user)
    REFERENCES SpotifyClone.user (id_user)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO SpotifyClone.subscriptions (subscription_id, subscription_type, subscription_value)
VALUES
  (1, 'gratuito', 0),
  (2, 'familiar', 7.99),
  (3, 'universitário', 5.99),
  (4, 'pessoal', 6.99);

INSERT INTO SpotifyClone.user (id_user, user_name, user_age, signup_date, subscriptions_subscription_id)
VALUES
  (1, 'Thati', 23, '2019-10-20', 1),
  (2, 'Cintia', 35, '2017-12-30', 2),
  (3, 'Bill', 20, '2019-06-05', 3),
  (4, 'Roger', 45, '2020-05-13', 4),
  (5, 'Norman', 58, '2017-02-17', 4),
  (6, 'Patrick', 33, '2017-01-06', 2),
  (7, 'Vivian', 26, '2018-01-05', 3),
  (8, 'Carol', 19, '2018-04-29', 3),
  (9, 'Angelina', 42, '2018-04-29', 2),
  (10, 'Paul', 46, '2017-01-17', 2);

INSERT INTO SpotifyClone.authors (id_author, author_name)
VALUES
  (1, 'Walter Phoenix'),
  (2, 'Peter Strong'),
  (3, 'Lance Day'),
  (4, 'Freedie Shannon'),
  (5, 'Tyler Isle'),
  (6, 'Fog');

INSERT INTO SpotifyClone.albuns (id_albums, album_name, launch_date, authors_id_author)
VALUES
  (1, 'Envious', '1990', 1),
  (2, 'Exuberant', '1993', 1),
  (3, 'Hallowed Steam', '1995', 2),
  (4, 'Incandescent', '1998', 3),
  (5, 'Temporary Culture', '2001', 4),
  (6, 'Library of liberty', '2033', 4),
  (7, 'Chained Down', '2007', 5),
  (8, 'Cabinet of fools', '2012', 5),
  (9, 'No guarantees', '2015', 5),
  (10, 'Apparatus', '2015', 6);

INSERT INTO SpotifyClone.songs (id_song, song_name, song_duration_seconds, albuns_id_albums)
VALUES
  (1, "Soul for Us", 200, 1),
  (2, "Reflections Of Magic", 163, 1),
  (3, "Dance With Her Own", 116, 1),
  (4, "Troubles Of My Inner Fire", 203, 2),
  (5, "Time Fireworks", 152, 2),
  (6, "Magic Circus", 105, 3),
  (7, "Honey, So Do I", 207, 3),
  (8, "Sweetie, Let's Go Wild", 139, 3),
  (9, "She Knows", 244, 3),
  (10, "Fantasy For Me", 100, 4),
  (11, "Celebration Of More", 146, 4),
  (12, "Rock His Everything", 223, 4),
  (13, "Home Forever", 231, 4),
  (14, "Diamond Power", 241, 4),
  (15, "Let's Be Silly", 132, 4),
  (16, "Thang Of Thunder", 240, 5),
  (17, "Words Of Her Life", 185, 5),
  (18, "Without My Streets", 176, 5),
  (19, "Need Of The Evening", 190, 6),
  (20, "History Of My Roses", 222, 6),
  (21, "Without My Love", 111, 6),
  (22, "Walking And Game", 123, 6),
  (23, "Young And Father", 197, 6),
  (24, "Finding My Traditions", 179, 7),
  (25, "Walking And Man", 229, 7),
  (26, "Hard And Time", 135, 7),
  (27, "Honey, I'm A Lone Wolf", 150, 7),
  (28, "She Thinks I Won't Stay Tonight", 166, 8),
  (29, "He Heard You're Bad For Me", 154, 8),
  (30, "He Hopes We Can't Stay", 210, 8),
  (31, "I Know I Know", 117, 8),
  (32, "He's Walking Away", 159, 9),
  (33, "He's Trouble", 138, 9),
  (34, "I Heard I Want To Bo Alone", 120, 9),
  (35, "I Ride Alone", 151, 9),
  (40, "Honey", 79, 10),
  (41, "You Cheated On Me", 95, 10),
  (42, "Wouldn't It Be Nice", 213, 10),
  (43, "Baby", 136, 10),
  (44, "You Make Me Feel So..", 83, 10);

INSERT INTO SpotifyClone.reproductions (songs_id_song, user_id_user, reproduction_date)
VALUES
  (40, 1, '2020-02-28 10:45:55'),
  (25, 1, '2020-05-02 05:30:35'),
  (23, 1, '2020-03-06 11:22:33'),
  (14, 1, '2020-08-05 08:05:17'),
  (15, 1, '2020-09-14 16:32:22'),
  (34, 2, '2020-01-02 07:40:33'),
  (24, 2, '2020-05-16 06:16:22'),
  (21, 2, '2020-10-09 12:27:48'),
  (43, 2, '2020-09-21 13:14:46'),
  (6, 3, '2020-11-13 16:55:13'),
  (3, 3, '2020-12-05 18:38:30'),
  (26, 3, '2020-07-30 10:00:00'),
  (2, 4, '2021-08-15 17:10:10'),
  (35, 4, '2021-07-10 15:20:30'),
  (27, 4, '2021-01-09 01:44:33'),
  (7, 5, '2020-07-03 19:33:28'),
  (12, 5, '2017-02-24 21:14:22'),
  (14, 5, '2020-08-06 15:23:43'),
  (1, 5, '2020-11-10 13:52:27'),
  (42, 6, '2019-02-07 20:33:48'),
  (29, 6, '2017-01-24 00:31:17'),
  (30, 6, '2017-10-12 12:35:20'),
  (22, 6, '2018-05-29 14:56:41'),
  (5, 7, '2018-05-09 22:30:49'),
  (4, 7, '2020-07-27 12:52:58'),
  (11, 7, '2018-01-16 18:40:43'),
  (43, 8, '2018-03-21 16:56:40'),
  (44, 8, '2020-10-18 13:38:05'),
  (32, 8, '2019-05-25 08:14:03'),
  (33, 8, '2021-08-15 21:37:09'),
  (16, 9, '2021-05-24 17:23:45'),
  (17, 9, '2018-12-07 22:48:52'),
  (8, 9, '2021-03-14 06:14:26'),
  (9, 9, '2020-04-01 03:36:00'),
  (20, 10, '2017-02-06 08:21:34'),
  (21, 10, '2017-12-04 05:33:43'),
  (12, 10, '2017-07-27 05:24:49'),
  (13,10, '2017-12-25 01:03:57');

INSERT INTO SpotifyClone.following(user_id_user, authors_id_author) 
VALUES
  (1,1),
  (1,4),
  (1,3),
  (2,1),
  (2,3),
  (3,2),
  (3,1),
  (4,4),
  (5,5),
  (5,6),
  (6,6),
  (6,3),
  (6,1),
  (7,2),
  (7,5),
  (8,1),
  (8,5),
  (9,6),
  (9,4),
  (9,3),
  (10,2),
  (10,6);
