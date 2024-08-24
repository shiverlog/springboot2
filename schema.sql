SHOW DATABASES;
USE springboot2;

CREATE TABLE posts (
                       ID BIGINT NOT NULL AUTO_INCREMENT,
                       CREATED_DATE DATETIME,
                       MODIFIED_DATE DATETIME,
                       AUTHOR VARCHAR(255),
                       CONTENT TEXT NOT NULL,
                       TITLE VARCHAR(500) NOT NULL,
                       PRIMARY KEY (ID)
) ENGINE=INNODB;

CREATE TABLE user (
                      ID BIGINT NOT NULL AUTO_INCREMENT,
                      CREATED_DATE DATETIME,
                      MODIFIED_DATE DATETIME,
                      EMAIL VARCHAR(255) NOT NULL,
                      NAME VARCHAR(255) NOT NULL,
                      PICTURE VARCHAR(255),
                      ROLE VARCHAR(255) NOT NULL,
                      PRIMARY KEY (ID)
) ENGINE=INNODB;

CREATE TABLE spring_session (
                                PRIMARY_ID CHAR(36) NOT NULL,
                                SESSION_ID CHAR(36) NOT NULL,
                                CREATION_TIME BIGINT NOT NULL,
                                LAST_ACCESS_TIME BIGINT NOT NULL,
                                MAX_INACTIVE_INTERVAL INT NOT NULL,
                                EXPIRY_TIME BIGINT NOT NULL,
                                PRINCIPAL_NAME VARCHAR(100),
                                CONSTRAINT SPRING_SESSION_PK PRIMARY KEY (PRIMARY_ID)
);

CREATE UNIQUE INDEX spring_session_ix1 ON spring_session (SESSION_ID);
CREATE INDEX spring_session_ix2 ON spring_session (EXPIRY_TIME);
CREATE INDEX spring_session_ix3 ON spring_session (PRINCIPAL_NAME);

CREATE TABLE spring_session_attributes (
                                           SESSION_PRIMARY_ID CHAR(36) NOT NULL,
                                           ATTRIBUTE_NAME VARCHAR(200) NOT NULL,
                                           ATTRIBUTE_BYTES LONGBLOB NOT NULL,
                                           CONSTRAINT spring_session_attributes_pk PRIMARY KEY (SESSION_PRIMARY_ID, ATTRIBUTE_NAME),
                                           CONSTRAINT spring_session_attributes_fk FOREIGN KEY (SESSION_PRIMARY_ID) REFERENCES spring_session(PRIMARY_ID) ON DELETE CASCADE
);

SHOW TABLES;