package net.calba.backpain.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

public final class FieldMatchValidator implements ConstraintValidator<FieldMatch, Object> {
	
	private static final Logger LOGGER = Logger
			.getLogger(FieldMatchValidator.class);

	private String firstFieldName;
	private String secondFieldName;
	private String errorMessage;

	public void initialize(final FieldMatch constraintAnnotation) {
		firstFieldName = constraintAnnotation.first();
		secondFieldName = constraintAnnotation.second();
		errorMessage = constraintAnnotation.message();
		
		
	}

	public boolean isValid(final Object value, final ConstraintValidatorContext cvc){
		boolean isValid = false;
		try {
			final Object firstObj = BeanUtils.getProperty(value, firstFieldName );
			final Object secondObj = BeanUtils.getProperty(value, secondFieldName );

			

			isValid = firstObj == null && secondObj == null || firstObj != null && firstObj.equals(secondObj);
		} catch (final Exception e){
			
		}
		//If the validation failed
	    if(!isValid) {
	        cvc.disableDefaultConstraintViolation();	       
	        cvc.buildConstraintViolationWithTemplate(errorMessage).addNode(firstFieldName).addConstraintViolation();
	    }
		
		return isValid ;
	}
}
