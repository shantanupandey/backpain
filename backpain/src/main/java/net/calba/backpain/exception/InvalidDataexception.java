/*
 * @(#)InvalidDataexception.java        1.82 2012/11/02
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
package net.calba.backpain.exception;
/**
 * @author Mukhtiar Ahmed
 */
@SuppressWarnings("serial")
public class InvalidDataexception extends CalbaAppServiceException {


        /**
         * default Constructor.
         */
        public InvalidDataexception() {
                super();

        }

        /**
         * Constructor with parameters.
         * @param message String
         * @param throwable Throwable
         */
        public InvalidDataexception(final String message,
                        final Throwable throwable) {
                super(message, throwable);

        }

        /**
         * Constructor with parameter.
         * @param message String
         */
        public InvalidDataexception(final String message) {
                super(message);

        }

        /**
         * Constructor with parameter.
         * @param throwable Throwable
         */
        public InvalidDataexception(final Throwable throwable) {
                super(throwable);

        }


}
