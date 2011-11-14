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
    head_html TEXT NOT NULL ,
    attributes_dump TEXT NOT NULL,
    created_at DATETIME,
    PRIMARY KEY (page_id,version)
);

create table member (
    twitter_user_id INTEGER  NOT NULL PRIMARY KEY,
    name varchar(255) NOT NULL,
    screen_name varchar(255) NOT NULL,
    icon_url varchar(255) NOT NULL
);

