package camp.web.dto;

public class CampDTO {

	private String contentId; // 고유키
	private String induty; // 일반야영장,자동차야영장,카라반 (캠핑유형)
	private String facltDivNm; // 지자체 , 민간 (국공립)

	private String doNm; // 도 이름 (지역)

//   -------------------------------------------
	// 지형타입
	private String siteBottomCl1; // 잔디
	private String siteBottomCl2; // 파쇄석
	private String siteBottomCl3; // 테크
	private String siteBottomCl4; // 자갈
	private String siteBottomCl5; // 맨흙 숫자로 나옴

	// 부대시설

	private String sbrsCl; // 전기,온수,놀이터 (부대시설)

	// 이용환경
	private String eqpmnLendCl; // 텐트,화로대,난방기구,식기,침낭 (이용환경- 장비대여)
	private String animalCmgCl; // 가능(소형견) /불가능 (이용환경 - 반려동물)
	private String brazierCl; // 개별/불가 (이용환경 - 화로대)

	// 주변환경
	private String posblFcltyCl; // 계곡 물놀이,산책로,강/물놀이

	// 데이터 나와야 하는 모습
	private String firstImageUrl; // 이미지
	private String facltNm; // 캠핑장명
	private String addr1; // 주소
	private String lctCl; // 입지구분(산,강,해변)

	private String bizrno; // 사업자번호

	private String featureNm; // 특징 (말풍선으로)
	private String lineIntro; // 한줄소개

	private String homepage; // 홈페이지 링크

	private String mapX; // 경도
	private String mapY; // 위도
	private String operDeCl;// 평일+주말
	private String sigunguNm;// 시군구

	private String tel;// 전화번호
	private int like_cnt; // 좋아요 카운트
	private int total_camp_Nm;

	public CampDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CampDTO(String contentId, String induty, String facltDivNm, String doNm, String siteBottomCl1,
			String siteBottomCl2, String siteBottomCl3, String siteBottomCl4, String siteBottomCl5, String sbrsCl,
			String eqpmnLendCl, String animalCmgCl, String brazierCl, String posblFcltyCl, String firstImageUrl,
			String facltNm, String addr1, String lctCl, String bizrno, String featureNm, String lineIntro,
			String homepage, String mapX, String mapY, String operDeCl, String sigunguNm, String tel, int like_cnt,
			int total_camp_Nm) {
		super();
		this.contentId = contentId;
		this.induty = induty;
		this.facltDivNm = facltDivNm;
		this.doNm = doNm;
		this.siteBottomCl1 = siteBottomCl1;
		this.siteBottomCl2 = siteBottomCl2;
		this.siteBottomCl3 = siteBottomCl3;
		this.siteBottomCl4 = siteBottomCl4;
		this.siteBottomCl5 = siteBottomCl5;
		this.sbrsCl = sbrsCl;
		this.eqpmnLendCl = eqpmnLendCl;
		this.animalCmgCl = animalCmgCl;
		this.brazierCl = brazierCl;
		this.posblFcltyCl = posblFcltyCl;
		this.firstImageUrl = firstImageUrl;
		this.facltNm = facltNm;
		this.addr1 = addr1;
		this.lctCl = lctCl;
		this.bizrno = bizrno;
		this.featureNm = featureNm;
		this.lineIntro = lineIntro;
		this.homepage = homepage;
		this.mapX = mapX;
		this.mapY = mapY;
		this.operDeCl = operDeCl;
		this.sigunguNm = sigunguNm;
		this.tel = tel;
		this.like_cnt = like_cnt;
		this.total_camp_Nm = total_camp_Nm;
	}

	public String getContentId() {
		return contentId;
	}

	public void setContentId(String contentId) {
		this.contentId = contentId;
	}

	public String getInduty() {
		return induty;
	}

	public void setInduty(String induty) {
		this.induty = induty;
	}

	public String getFacltDivNm() {
		return facltDivNm;
	}

	public void setFacltDivNm(String facltDivNm) {
		this.facltDivNm = facltDivNm;
	}

	public String getDoNm() {
		return doNm;
	}

	public void setDoNm(String doNm) {
		this.doNm = doNm;
	}

	public String getSiteBottomCl1() {
		return siteBottomCl1;
	}

	public void setSiteBottomCl1(String siteBottomCl1) {
		this.siteBottomCl1 = siteBottomCl1;
	}

	public String getSiteBottomCl2() {
		return siteBottomCl2;
	}

	public void setSiteBottomCl2(String siteBottomCl2) {
		this.siteBottomCl2 = siteBottomCl2;
	}

	public String getSiteBottomCl3() {
		return siteBottomCl3;
	}

	public void setSiteBottomCl3(String siteBottomCl3) {
		this.siteBottomCl3 = siteBottomCl3;
	}

	public String getSiteBottomCl4() {
		return siteBottomCl4;
	}

	public void setSiteBottomCl4(String siteBottomCl4) {
		this.siteBottomCl4 = siteBottomCl4;
	}

	public String getSiteBottomCl5() {
		return siteBottomCl5;
	}

	public void setSiteBottomCl5(String siteBottomCl5) {
		this.siteBottomCl5 = siteBottomCl5;
	}

	public String getSbrsCl() {
		return sbrsCl;
	}

	public void setSbrsCl(String sbrsCl) {
		this.sbrsCl = sbrsCl;
	}

	public String getEqpmnLendCl() {
		return eqpmnLendCl;
	}

	public void setEqpmnLendCl(String eqpmnLendCl) {
		this.eqpmnLendCl = eqpmnLendCl;
	}

	public String getAnimalCmgCl() {
		return animalCmgCl;
	}

	public void setAnimalCmgCl(String animalCmgCl) {
		this.animalCmgCl = animalCmgCl;
	}

	public String getBrazierCl() {
		return brazierCl;
	}

	public void setBrazierCl(String brazierCl) {
		this.brazierCl = brazierCl;
	}

	public String getPosblFcltyCl() {
		return posblFcltyCl;
	}

	public void setPosblFcltyCl(String posblFcltyCl) {
		this.posblFcltyCl = posblFcltyCl;
	}

	public String getFirstImageUrl() {
		return firstImageUrl;
	}

	public void setFirstImageUrl(String firstImageUrl) {
		this.firstImageUrl = firstImageUrl;
	}

	public String getFacltNm() {
		return facltNm;
	}

	public void setFacltNm(String facltNm) {
		this.facltNm = facltNm;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getLctCl() {
		return lctCl;
	}

	public void setLctCl(String lctCl) {
		this.lctCl = lctCl;
	}

	public String getBizrno() {
		return bizrno;
	}

	public void setBizrno(String bizrno) {
		this.bizrno = bizrno;
	}

	public String getFeatureNm() {
		return featureNm;
	}

	public void setFeatureNm(String featureNm) {
		this.featureNm = featureNm;
	}

	public String getLineIntro() {
		return lineIntro;
	}

	public void setLineIntro(String lineIntro) {
		this.lineIntro = lineIntro;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getMapX() {
		return mapX;
	}

	public void setMapX(String mapX) {
		this.mapX = mapX;
	}

	public String getMapY() {
		return mapY;
	}

	public void setMapY(String mapY) {
		this.mapY = mapY;
	}

	public String getOperDeCl() {
		return operDeCl;
	}

	public void setOperDeCl(String operDeCl) {
		this.operDeCl = operDeCl;
	}

	public String getSigunguNm() {
		return sigunguNm;
	}

	public void setSigunguNm(String sigunguNm) {
		this.sigunguNm = sigunguNm;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getLike_cnt() {
		return like_cnt;
	}

	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}

	public int getTotal_camp_Nm() {
		return total_camp_Nm;
	}

	public void setTotal_camp_Nm(int total_camp_Nm) {
		this.total_camp_Nm = total_camp_Nm;
	}

}