package kr.co.summary.domain;

import lombok.Data;

/*member_id         VARCHAR2(50) NOT NULL,
member_password   VARCHAR2(50) NOT NULL,
member_name       VARCHAR2(50) NOT NULL,
member_age_range  VARCHAR2(50) NOT NULL,
member_gender     VARCHAR2(50) NOT NULL,
member_phone      VARCHAR2(50) NOT NULL,
admin_id          VARCHAR2(50) NOT NULL*/

@Data
public class MemberVO {
	private String member_id;
	private String member_password;
	private String member_name;
	private String member_age_range;
	private String member_gender;
	private String member_phone;
	private String admin_id;
}
