package com.test;

public class Reviewsg {
   private String REVIEW_ID;
private String COMMENTS;
private  String ACCEPT_STATE;
private String COMMUNICATION_ID;

    public String getCOMMUNICATION_ID() {
        return COMMUNICATION_ID;
    }

    public void setCOMMUNICATION_ID(String COMMUNICATION_ID) {
        this.COMMUNICATION_ID = COMMUNICATION_ID;
    }

    public String getACCEPT_STATE() {
        return ACCEPT_STATE;
    }

    public void setACCEPT_STATE(String ACCEPT_STATE) {
        this.ACCEPT_STATE = ACCEPT_STATE;
    }

    public String getCOMMENTS() {
        return COMMENTS;
    }

    public void setCOMMENTS(String COMMENTS) {
        this.COMMENTS = COMMENTS;
    }

    public String getREVIEW_ID() {
        return REVIEW_ID;
    }

    public void setREVIEW_ID(String REVIEW_ID) {
        this.REVIEW_ID = REVIEW_ID;
    }
}
