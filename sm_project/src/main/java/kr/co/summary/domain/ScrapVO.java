package kr.co.summary.domain;

import lombok.Data;

@Data
public class ScrapVO {
	private int scrap_index;
	private String scrap_memo;
	private int news_index;
	private String news_title;
	private String news_image;
	private String member_id;

}
