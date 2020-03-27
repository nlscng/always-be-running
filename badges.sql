--
-- Dumping data for table `badges`
--

INSERT INTO `badges` (`id`, `order`, `name`, `description`, `filename`, `auto`, `year`, `tournament_type_id`, `winlevel`) VALUES
(1, 160, 'Worlds Champion', 'This user has won a worlds championship.', 'worlds-winner-2016.png', 1, 2016, 5, 1),
(2, 161, 'Worlds Top 16', 'This user has been in the top 16 cut of a worlds championship.', 'worlds-top16-2016.png', 1, 2016, 5, 2),
(3, 162, 'Worlds Participant', 'This user has participated in a worlds championship.', 'worlds-player-2016.png', 1, 2016, 5, 5),
(8, 260, 'Nationals Champion', 'This user has won a national championship.', 'nationals-winner-2016.png', 1, 2016, 4, 1),
(9, 261, 'Nationals Top Cut', 'This user has been in the top cut of a national championship.', 'nationals-top-2016.png', 1, 2016, 4, 2),
(10, 360, 'Regionals Champion', 'This user has won a regional championship.', 'regionals-winner-2016.png', 1, 2016, 3, 1),
(11, 361, 'Regionals Top Cut', 'This user has been in the top cut of a regional championship.', 'regionals-top-2016.png', 1, 2016, 3, 2),
(12, 460, 'Store Champion', 'This user has won a store championship.', 'store-winner.png', 1, 2016, 2, 1),
(13, 2005, 'BRONZE player', 'This user has claimed at least 2 tournament spots.', 'player-bronze.png', 1, NULL, NULL, NULL),
(14, 2004, 'SILVER player', 'This user has claimed at least 8 tournament spots.', 'player-silver.png', 1, NULL, NULL, NULL),
(15, 2003, 'GOLD player', 'This user has claimed at least 20 tournament spots.', 'player-gold.png', 1, NULL, NULL, NULL),
(16, 3005, 'BRONZE organizer', 'This user has created at least 2 approved tournaments.', 'to-bronze.png', 1, NULL, NULL, NULL),
(17, 3004, 'SILVER organizer', 'This user has created at least 8 approved tournaments.', 'to-silver.png', 1, NULL, NULL, NULL),
(18, 3003, 'GOLD organizer', 'This user has created at least 20 approved tournaments.', 'to-gold.png', 1, NULL, NULL, NULL),
(20, 3010, 'Fancy organizer', 'This user has created a tournament with a fancy description. With at least one image, one link and 600 characters (using Markdown).', 'to-fancy.png', 1, NULL, NULL, NULL),
(21, 4001, 'Hard-working publisher', 'This user has at least 20 decks published on NetrunnerDB.', 'publisher.png', 1, NULL, NULL, NULL),
(22, 2, 'Admin', 'This user is an admin on this site.', 'admin.png', 0, NULL, NULL, NULL),
(24, 4, 'Helper', 'This user provided great help in the creation of this site. It might have been feature ideas, bug reports or technical help. We are all grateful.', 'helper.png', 0, NULL, NULL, NULL),
(25, 4002, 'Keeper of many secrets', 'This user has at least 150 private decks on NetrunnerDB, but willing to share.', 'keeper.png', 1, NULL, NULL, NULL),
(26, 3011, 'Preacher of NRTM', 'This user concluded at least 3 tournaments with NRTM results.', 'nrtm.png', 1, NULL, NULL, NULL),
(27, 2010, 'Minority Reporter', 'This user went to a tournament with a mini-faction (Adam, Apex or Sunny Lebeau).', 'minority.png', 1, NULL, NULL, NULL),
(28, 2011, 'Self-modifying Personality', 'This user has claimed with all the major runner factions.', 'all-runner.png', 1, NULL, NULL, NULL),
(29, 2012, 'Diversified Portfolio', 'This user has claimed with all the corporation factions.', 'all-corp.png', 1, NULL, NULL, NULL),
(30, 2020, 'Trapped in time', 'This user is registered for a weekly recurring event.', 'recurring.png', 1, NULL, NULL, NULL),
(31, 4011, 'NetrunnerDB V.I.P.', 'This user has more than 1000 reputation on NetrunnerDB.', 'ndb-vip.png', 1, NULL, NULL, NULL),
(32, 4012, 'NetrunnerDB Celebrity', 'This user has more than 500 reputation on NetrunnerDB.', 'ndb-celeb.png', 1, NULL, NULL, NULL),
(33, 4013, 'NetrunnerDB Known', 'This user has more than 100 reputation on NetrunnerDB.', 'ndb-known.png', 1, NULL, NULL, NULL),
(34, 901, 'Road to Worlds', 'This user has claimed spots for at least one Store, one Regional and one National Championship.', 'road.png', 1, NULL, NULL, NULL),
(35, 801, 'Champion of Sorts', 'This user has won a \'GNK/seasonal\' or \'non-FFG\' or \'online tournament\' with at least 8 players. We are proud. ', 'ofsorts.png', 1, NULL, NULL, NULL),
(36, 2030, 'Travelling player', 'This user claimed in tournaments belonging to 3 different countries.', 'player-travel.png', 1, NULL, NULL, NULL),
(37, 3020, 'Community Champion', 'This user has created  Store, Regional and National championships which are concluded and approved.', 'to-champ.png', 1, NULL, NULL, NULL),
(38, 5, 'Charity', 'This user either organized or took part in a charity event. We are all grateful for your help/donation. (Please contact the site if you want to receive or give this badge.) ', 'charity.png', 0, NULL, NULL, NULL),
(39, 4010, 'NetrunnerDB Superstar', 'This user has more than 5000 reputation on NetrunnerDB.', 'ndb-superstar.png', 1, NULL, NULL, NULL),
(40, 1, 'Developer', 'This user made a contribution to the code of the site. AlwaysBeRunning.net would be less without him/her. It\'s hard to be cooler than this.', 'dev.png', 0, NULL, NULL, NULL),
(41, 10, 'Creator', 'Site creator, main developer, owner, etc.', 'creator.png', 0, NULL, NULL, NULL),
(42, 9001, 'Alt Connoisseur', 'This user has donated some pretty cards. Mhmm... cards.', 'support-alt.png', 0, NULL, NULL, NULL),
(43, 9011, 'Credit Dealer', 'This user has donated credits. You can buy almost anything with credits.', 'support-money.png', 0, NULL, NULL, NULL),
(44, 9021, 'Bioroid Patreon', 'This user is a Bioroid-level Patreon supporter. You keep the dataflow flowing.', 'patreon-bioroid.png', 0, NULL, NULL, NULL),
(45, 9022, 'Sysop Patreon', 'This user is a Sysop-level Patreon supporter. You make the servers purr.', 'patreon-sysop.png', 0, NULL, NULL, NULL),
(46, 9023, 'Executive Patreon', 'This user is an Executive-level Patreon supporter. We invest your credits only in top-notch, off-shore enterprises.', 'patreon-executive.png', 0, NULL, NULL, NULL),
(47, 3030, 'Sensie Director', 'This user has added at least 5 tournament videos.', 'video.png', 1, NULL, NULL, NULL),
(48, 3021, 'Community Builder', 'This user created tournaments where at least 10 other users claimed.', 'to-comm.png', 1, NULL, NULL, NULL),
(49, 5001, 'Information Magnate', 'This user has claimed with NBN decks in 5 tournaments and won at least one with 8 or more players.', 'master-nbn.png', 1, NULL, NULL, NULL),
(50, 5002, 'Haas Progeny', 'This user has claimed with HB decks in 5 tournaments and won at least one with 8 or more players.', 'master-hb.png', 1, NULL, NULL, NULL),
(51, 5003, 'Board Member', 'This user has claimed with Weyland decks in 5 tournaments and won at least one with 8 or more players.', 'master-weyland.png', 1, NULL, NULL, NULL),
(52, 5004, 'Honorable Chairman', 'This user has claimed with Jinteki decks in 5 tournaments and won at least one with 8 or more players.', 'master-jinteki.png', 1, NULL, NULL, NULL),
(53, 5101, 'Scholar Supreme', 'This user has claimed with Shaper decks in 5 tournaments and won at least one with 8 or more players.', 'master-shaper.png', 1, NULL, NULL, NULL),
(54, 5102, 'Crime Lord', 'This user has claimed with Criminal decks in 5 tournaments and won at least one with 8 or more players.', 'master-criminal.png', 1, NULL, NULL, NULL),
(55, 5103, 'Fist of the Masses', 'This user has claimed with Anarch decks in 5 tournaments and won at least one with 8 or more players.', 'master-anarch.png', 1, NULL, NULL, NULL),
(56, 170, 'Worlds Champion', 'This user has won a worlds championship.', 'worlds-winner-2017.png', 1, 2017, 5, 1),
(57, 171, 'Worlds Top 16', 'This user has been in the top 16 cut of a worlds championship.', 'worlds-top16-2017.png', 1, 2017, 5, 2),
(58, 172, 'Worlds Participant', 'This user has participated in a worlds championship.', 'worlds-player-2017.png', 1, 2017, 5, 5),
(59, 270, 'Nationals Champion', 'This user has won a national championship.', 'nationals-winner-2017.png', 1, 2017, 4, 1),
(60, 271, 'Nationals Top Cut', 'This user has been in the top cut of a national championship.', 'nationals-top-2017.png', 1, 2017, 4, 2),
(61, 370, 'Regionals Champion', 'This user has won a regional championship.', 'regionals-winner2-2017.png', 1, 2017, 3, 1),
(62, 371, 'Regionals Top Cut', 'This user has been in the top cut of a regional championship.', 'regionals-top-2017.png', 1, 2017, 3, 2),
(63, 3040, 'Daily Business Material', 'This user has created a tournament which appeared in the \"Featured\" section. Big / interesting tournaments, many claims, photos, videos are preferred there.', 'spotlight.png', 0, NULL, NULL, NULL),
(64, 3035, 'Sensie Celebrity', 'This user was tagged in at least 5 tournament videos.', 'video-tag.png', 1, NULL, NULL, NULL),
(65, 200, 'European Champion', 'This user has won an European championship.', 'europe-winner-2017.png', 1, 2017, 9, 1),
(66, 201, 'European Championship Top 16', 'This user has been in the top 16 cut of an European championship.', 'europe-top16-2017.png', 1, 2017, 9, 2),
(67, 203, 'European Championship Participant', 'This user has participated in an European championship.', 'europe-player-2017.png', 1, 2017, 9, 5),
(68, 3022, 'Community Commander', 'This user created tournaments where at least 30 other users claimed. That is some serious recruiting!', 'to-commander.png', 1, NULL, NULL, NULL),
(69, 230, 'North American Champion', 'This user has won a North American championship.', 'n-america-winner-2017.png', 1, 2017, 10, 1),
(70, 231, 'North American Championship Top 16', 'This user has been in the top 16 cut of a North American championship.', 'n-america-top16-2017.png', 1, 2017, 10, 2),
(71, 233, 'North American Championship Participant', 'This user has participated in a North American championship.', 'n-america-player-2017.png', 1, 2017, 10, 5),
(72, 6, 'First Birthday', 'This user has been here for least a year. Thank you for running with us!', 'abr-birthday-1.png', 1, NULL, NULL, NULL),
(73, 5104, 'Rogue Bioroid', 'This user has claimed with Adam decks in 3 tournaments and won at least one with 8 or more players.', 'master-adam.png', 1, NULL, NULL, NULL),
(74, 5105, 'Virtual Anomaly', 'This user has claimed with Apex decks in 3 tournaments and won at least one with 8 or more players.', 'master-apex.png', 1, NULL, NULL, NULL),
(75, 5106, 'Greatest Mom in Cyberspace', 'This user has claimed with Sunny Lebeau decks in 3 tournaments and won at least one with 8 or more players.', 'master-sunny.png', 1, NULL, NULL, NULL),
(76, 8111, 'Cream of the Crop', 'This user won the UK rankings finals in 2017.', 'comm-uk-winner-2017.png', 1, 2017, NULL, 1),
(77, 8112, 'Finest Hour', 'This user was invited to the UK rankings finals in 2017.', 'comm-uk-2017.png', 1, 2017, NULL, 2),
(78, 8101, 'Cream of the Crop', 'This user won the UK rankings finals in 2016.', 'comm-uk-winner-2016.png', 1, 2016, NULL, 1),
(79, 8102, 'Finest Hour', 'This user was invited to the UK rankings finals in 2016.', 'comm-uk-2016.png', 1, 2016, NULL, 2),
(80, 8201, 'Prince of Pálinka', 'This user won the Third Hungarian National League.', 'comm-hun-winner-2017.png', 1, 2017, NULL, 1),
(81, 8202, 'CyBetyár', 'This user was invited to the top-cut of the Third Hungarian League.', 'comm-hun-2017.png', 1, 2017, NULL, 2),
(82, 210, 'European Champion', 'This user has won an European championship.', 'europe-winner-2018.png', 1, 2018, 9, 1),
(83, 211, 'European Championship Top 16', 'This user has been in the top 16 cut of an European championship.', 'europe-top16-2018.png', 1, 2018, 9, 2),
(84, 213, 'European Championship Participant', 'This user has participated in an European championship.', 'europe-player-2018.png', 1, 2018, 9, 5),
(85, 9002, 'Drinking Donor', 'This user has donated some fine beverage and took the time to socialise over it with the site creator. Cheers!', 'beer.png', 0, NULL, NULL, NULL),
(86, 240, 'North American Champion', 'This user has won a North American championship.', 'n-america-winner-2018.png', 1, 2018, 10, 1),
(87, 241, 'North American Championship Top 16', 'This user has been in the top 16 cut of a North American championship.', 'n-america-top16-2018.png', 1, 2018, 10, 2),
(88, 243, 'North American Championship Participant', 'This user has participated in a North American championship.', 'n-america-player-2018.png', 1, 2018, 10, 5),
(89, 280, 'Nationals Champion', 'This user has won a national championship.', 'nationals-winner-2018.png', 1, 2018, 4, 1),
(90, 281, 'Nationals Top Cut', 'This user has been in the top cut of a national championship.', 'nationals-top-2018.png', 1, 2018, 4, 2),
(91, 380, 'Regionals Champion', 'This user has won a regional championship.', 'regionals-winner-2018.png', 1, 2018, 3, 1),
(92, 381, 'Regionals Top Cut', 'This user has been in the top cut of a regional championship.', 'regionals-top-2018.png', 1, 2018, 3, 2),
(93, 2002, 'PLATINUM player', 'This user has claimed at least 50 tournament spots.', 'player-platinum.png', 1, NULL, NULL, NULL),
(94, 3002, 'PLATINUM organizer', 'This user has created at least 50 approved tournaments.', 'to-platinum.png', 1, NULL, NULL, NULL),
(95, 180, 'Worlds Champion', 'This user has won a worlds championship.', 'worlds-winner-2018.png', 1, 2018, 5, 1),
(96, 181, 'Worlds Top 16', 'This user has been in the top 16 cut of a worlds championship.', 'worlds-top16-2018.png', 1, 2018, 5, 2),
(97, 182, 'Worlds Participant', 'This user has participated in a worlds championship.', 'worlds-player-2018.png', 1, 2018, 5, 5),
(98, 8211, 'Prince of Pálinka', 'This user won the Fourth Hungarian National League.', 'comm-hun-winner-2018.png', 1, 2018, NULL, 1),
(99, 8212, 'CyBetyár', 'This user was invited to the top-cut of the Fourth Hungarian League.', 'comm-hun-2018.png', 1, 2018, NULL, 2),
(100, 6, 'NISEI Staff Member', 'Cancelling the apocalypse since 2018', 'nisei-staff.png', 0, NULL, NULL, NULL),
(101, 220, 'European Champion', 'This user has won an European championship.', 'europe-winner-2019.png', 1, 2019, 9, 1),
(102, 221, 'European Championship Day 2', 'This user has made it into \"Day 2\" on the 2019 European championship.', 'europe-day2-2019.png', 1, 2019, 9, 2),
(103, 223, 'European Championship Participant', 'This user has participated in an European championship.', 'europe-player-2019.png', 1, 2019, 9, 5),
(104, 382, 'Regionals Champion', 'This user has won a regional championship.', 'regionals-winner-2019.png', 1, 2019, 3, 1),
(105, 384, 'Regionals Top Cut', 'This user has been in the top cut of a regional championship.', 'regionals-top-2019.png', 1, 2019, 3, 2),
(106, 290, 'Nationals Champion', 'This user has won a national championship.', 'nationals-winner-2019.png', 1, 2019, 4, 1),
(107, 291, 'Nationals Top Cut', 'This user has been in the top cut of a national championship.', 'nationals-top-2019.png', 1, 2019, 4, 2),
(108, 190, 'Worlds Champion', 'This user has won a worlds championship.', 'worlds-winner-2019.png', 1, 2019, 5, 1),
(109, 191, 'Worlds Top 16', 'This user has been in the top 16 cut of a worlds championship.', 'worlds-top16-2019.png', 1, 2019, 5, 2),
(110, 192, 'Worlds Participant', 'This user has participated in a worlds championship.', 'worlds-player-2019.png', 1, 2019, 5, 5),
(111, 3012, 'Snek Majesty', 'This user concluded at least 3 tournaments with Cobr.ai results.', 'cobrai.png', 1, NULL, NULL, NULL);