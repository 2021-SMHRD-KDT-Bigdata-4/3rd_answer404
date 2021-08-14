package kr.co.summary.domain;

import lombok.Data;

@Data
public class StatisticsVO {
	private int statistics_index;
	private String member_age_range;
	private String member_gender;
	private String news_keyword;
	private String news_category;
}
