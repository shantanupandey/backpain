/*
 * @(#)AdminAppConstant.java        1.82 2012/11/02
 *
 * Copyright (c) 2009-2012 ICS Nett, Inc.
 * 2650 Park Tower Dr # 800, Vienna, VA 22180-7384, U.S.A.
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of ICS
 * Nett, Inc. ("Confidential Information").  You shall not
 * disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into
 * with ICS Nett, Inc.
 */
package net.calba.backpain;

/**
 *
 * @author Mukhtiar Ahmed
 *
 */
public abstract class CalbaAppConstant {
	/**
     * logged user key
     */
    public static final String LOGGED_CLIENT =  "loggedClient";
    
    public static final int CLIENT_ROLD_ID = 1;
    
    public static final int ADMIN_ROLD_ID = 2;
    
    public static final int SUPER_USER_ROLD_ID = 3;
    
    
    public static final String QUESTION_PREFIX =  "question";
    
    public static final String ACTIVE =  "Active";
    
    public static final String INACTIVE =  "InActive";
    
    public static final String STATE_PENDING = "Pending";
    
    public static final String STATE_COMPLETED = "Completed";
    
    public static final String STATE_DISABLED= "Disabled";
    
    public static final int DIRECT_USER_PROJECT_ID = 1; 
    
    public static final int CLIENT_TYPE_DIRECT_USER_ID = 1; 
        
    public static final int  CLIENT_TYPE_TRIAL_USER_ID = 2;
    
    public static final int CLIENT_STATE_ACTIVE_ID = 1; 
    
    public static final int CLIENT_STATE_INACTIVE_ID = 2;
    
    public static final int CLIENT_STATE_PENDING_ID = 3;
    
    public static final int CLIENT_STATE_COMPLETED_ID = 4;
    
    public static final int ROLE_END_USER_ID = 1;
    
    public static final int MONITORING_FORM_ID = 1;    
    
    public static final int ABOUT_YOU_FORM_ID = 2;    
    
    public static final int MED_HIST_FORM_ID =  3;
    
    public static final int BACK_PAIN_FORM_ID = 4;
    
    public static final int BACK_PAIN2_FORM_ID = 5;
    
    public static final int SELF_EXAM_FORM_ID = 6;
    
    public static final int DISABILITY_FORM_ID = 8;
    
    public static final int WEEKLY_UPDATE_FORM_ID = 7;
    
    
    public static final int REPORT_NON_RADICULAR = 1;
    
    public static final int REPORT_TOT_RADICULAR = 2;
    
    public static final int REPORT_PAIN_ANALYSIS = 3;
    
    public static final int REPORT_SELF_EXAMINATION = 4;
    
    public static final int REPORT_HNP_PHASES = 5;
    
    public static final int REPORT_CANCER = 6;
    
    public static final int REPORT_CCS = 7;
    
    public static final int PAIN_HISTORY = 8;
    
    /**
     * password length.
     */
    public static final int PASSWORD_LENGTH = 8;

      
        /**
         * email/password message.
         */
        public static final String USERID_PASSWORD_REQUIRED =
                "The user name or password is required";
        /**
         * invalid email/password message.
         */
        public static final String INVALIAD_CREDENTIAL =
                "The user name or password you entered is incorrect.";
        
        /**
         * invalid email/password message.
         */
        public static final String INVALIAD_PASSWORD =
                "The current password you entered is incorrect.";
        /**
         * Inactive user message.
         */
        public static final String INACTIVE_USER =
                "Currently You have not right to access";
        /**
         * Invalid email format message.
         */
        public static final String INVALID_EMAIL_FORMAT =
                "Email format is not valid";
        
        
        /**
         * user name already exist message.
         */
        public static final String USER_NAME_EXISTS =
                "User name already exist";
        
        /**
         * user name already exist message.
         */
        public static final String USER_NOT_FOUND =
                "User not found";
        
        /**
         * invalid user id name already exist message.
         */
        public static final String INVALID_USER_ID =
                "Invalid user id";
        
        /**
         * invalid user id name already exist message.
         */
        public static final String USER_REDIRECT =
                "userRedirect";
        
        /**
         * invalid user id name already exist message.
         */
        public static final String LOGIN_AJAX =
                "loginRedirect";
        
        /**
         * Record not found message.
         */
        public static final String RECORD_NOT_FOUND =
                "Record not found";
        
        /**
         * email not registered message.
         */
//        public static final String EMAIL_NOT_REGISTERED = "This email Id is not registered with us." +
//        		" Please use the correct email address you used at the time of registration.";
        
     
        
        public static final String EMAIL_NOT_REGISTERED = "The email entered here must be the same as the one you registered with.";

        

}
