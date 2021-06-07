package com.yeoju.root.common.dto;

import java.sql.Date;

public class GoodsCommentDTO {

    private Integer goodsId;

    // 댓글 작성자 
    private String userId;

    // 내용 
    private String content;

    private Date regDate;

    private Integer commentId;

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

    // GoodsComment 모델 복사
    public void CopyData(GoodsCommentDTO param)
    {
        this.goodsId = param.getGoodsId();
        this.userId = param.getUserId();
        this.content = param.getContent();
        this.regDate = param.getRegDate();
        this.commentId = param.getCommentId();
    }
}
