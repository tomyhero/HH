-- sqllite
create table page (
    page_id INTEGER  NOT NULL PRIMARY KEY    AUTOINCREMENT,
    url varchar(255) NOT NULL,
    version integer NOT NULL ,
    UNIQUE(url)
);

create table head (
    page_id INTEGER not null ,
    version INTEGER NOT NULL ,
    attributes_dump TEXT NOT NULL,
    PRIMARY KEY (page_id,version)
);
