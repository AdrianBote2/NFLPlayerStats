CREATE TABLE TEAM (
    teamID INT PRIMARY KEY,
    teamName VARCHAR(100),
    city VARCHAR(100),
    conference VARCHAR(50),
    division VARCHAR(50)
);

CREATE TABLE PLAYER (
    playerID INT PRIMARY KEY,
    playerName VARCHAR(100),
    position VARCHAR(50),
    height DECIMAL(5,2),
    playerWeight DECIMAL(5,2),
    playerNumber INT,
    teamID INT,
    FOREIGN KEY (teamID) REFERENCES TEAM(teamID)
);

CREATE TABLE COACH (
    coachID INT PRIMARY KEY,
    C_name VARCHAR(100),
    C_role VARCHAR(50),
    experience_years INT,
    teamID INT,
    FOREIGN KEY (teamID) REFERENCES TEAM(teamID)
);

CREATE TABLE SEASON (
    seasonID INT PRIMARY KEY,
    season_year INT CHECK (season_year >= 1920),
    championID INT,
    FOREIGN KEY (championID) REFERENCES TEAM(teamID)
);

CREATE TABLE GAME (
    gameID INT PRIMARY KEY,
    seasonYear INT,
    gameLocation VARCHAR(150),
    FOREIGN KEY (seasonYear) REFERENCES SEASON(seasonID)
);

CREATE TABLE STATLINE (
    playerID INT,
    gameID INT,
    receptions INT,
    passing_yards INT,
    rushing_yards INT,
    touchdowns INT,
    interceptions INT,
    tackles INT,
    field_goals INT,
    sacks INT,
    forcedfumbles INT,
    PRIMARY KEY (playerID, gameID),
    FOREIGN KEY (playerID) REFERENCES PLAYER(playerID),
    FOREIGN KEY (gameID) REFERENCES GAME(gameID)
);

CREATE TABLE GAMETEAM (
    gameID INT,
    teamID INT,
    gameTeamRole VARCHAR(10),
    PRIMARY KEY (gameID, teamID),
    FOREIGN KEY (gameID) REFERENCES GAME(gameID),
    FOREIGN KEY (teamID) REFERENCES TEAM(teamID)
);
