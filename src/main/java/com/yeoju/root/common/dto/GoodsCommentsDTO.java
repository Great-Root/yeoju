package com.yeoju.root.common.dto;

import java.sql.Date;

public class GoodsCommentsDTO {

	//제품 
    private Integer goodsId;
    // 제품 작성자 
    private String userId;
    // 내용 
    private String content;
    //날짜
    private Date regDate;
    // 댓글 작성자
    private Integer commentId;
    
    // 댓글 작성자
    private Integer commentId2;


	public Integer getGoodsId() {
        return goodsId;
    }
    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public Date getRegDate() {
        return regDate;
    }
    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }
    public Integer getCommentId() {
        return commentId;
    }
    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getCommentId2() {
		return commentId2;
	}

	public void setCommentId2(Integer commentId2) {
		this.commentId2 = commentId2;
	}

    // GoodsComment 모델 복사
    public void CopyData(GoodsCommentsDTO param)
    {
        this.goodsId = param.getGoodsId();
        this.userId = param.getUserId();
        this.content = param.getContent();
        this.regDate = param.getRegDate();
        this.commentId = param.getCommentId();
        this.commentId2 = param.getCommentId2();
    }
	@Override
	public String toString() {
		return "GoodsCommentsDTO [goodsId=" + goodsId + ", userId=" + userId + ", content=" + content + ", regDate="
				+ regDate + ", commentId=" + commentId + ", commentId2=" + commentId2 + "]";
	}
    
}
