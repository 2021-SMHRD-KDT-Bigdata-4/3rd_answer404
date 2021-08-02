package kr.co.summary.domain;

import lombok.Data;
import oracle.sql.TIMESTAMP;

/*
 *  news_index      NUMBER(20) NOT NULL,
    news_title      VARCHAR2(100) NOT NULL,
    news_contents   VARCHAR2(4000) NOT NULL,
    news_date       DATE,
    news_url        VARCHAR2(4000) NOT NULL,
    news_kategorie  VARCHAR2(100) NOT NULL,
    news_image      VARCHAR2(4000)
 */
@Data
public class NewsVO {

	private int news_index;
	private String news_title;
	private String news_contents;
	private TIMESTAMP news_date;
	private String news_url;
	private String news_kategorie;
	private String news_image;
}
