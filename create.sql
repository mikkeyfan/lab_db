CREATE TABLE quality (
    quality INTEGER NOT NULL
);

ALTER TABLE quality ADD CONSTRAINT quality_pk PRIMARY KEY ( quality );

CREATE TABLE wine (
    wineid            INTEGER NOT NULL,
    ph                FLOAT,
    alcohol           FLOAT,
    sugar             FLOAT,
    wine_type_typeid  INTEGER NOT NULL,
    quality_quality   INTEGER NOT NULL
);

ALTER TABLE wine ADD CONSTRAINT wine_pk PRIMARY KEY ( wineid );

CREATE TABLE wine_type (
    typeid  INTEGER NOT NULL,
    name    CHAR(20)
);

ALTER TABLE wine_type ADD CONSTRAINT wine_type_pk PRIMARY KEY ( typeid );

ALTER TABLE wine
    ADD CONSTRAINT wine_quality_fk FOREIGN KEY ( quality_quality )
        REFERENCES quality ( quality )
            ON DELETE CASCADE;

ALTER TABLE wine
    ADD CONSTRAINT wine_wine_type_fk FOREIGN KEY ( wine_type_typeid )
        REFERENCES wine_type ( typeid )
            ON DELETE CASCADE;
