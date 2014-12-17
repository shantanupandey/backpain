package net.calba.backpain.exception;

public class ClientInActiveException extends CalbaAppServiceException {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1223704093843950795L;

	public ClientInActiveException() {
		super();		
	}

	public ClientInActiveException(String message, Throwable exception) {
		super(message, exception);
		
	}

	public ClientInActiveException(String message) {
		super(message);
		
	}

	public ClientInActiveException(Throwable exception) {
		super(exception);
		
	}
	
	

}
