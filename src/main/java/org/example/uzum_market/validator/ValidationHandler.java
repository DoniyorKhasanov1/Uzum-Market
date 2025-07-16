package org.example.uzum_market.validator;

import jakarta.validation.ConstraintValidator;
import org.example.uzum_market.annotations.EmailValidation;

import java.math.BigInteger;

/**
 * Email validation handler for {@link EmailValidation} annotation.
 * {@link ValidationHandler#isValid(String, jakarta.validation.ConstraintValidatorContext)}
 * is used to validate email that user enters in registration form.
 *
 * @version 1.0
 * @since 2025-07-09
 */

public class ValidationHandler implements ConstraintValidator<EmailValidation, String> {
    private String regexp;
    private boolean required;
    @Override
    public boolean isValid(String value, jakarta.validation.ConstraintValidatorContext context) {
        if(!required && (value == null || value.isEmpty())) {
            return true;
        }
        if(value == null) {
            return false;
        }
        return value.matches(regexp);
    }

    //!It's not an override method

    @Override
    public void initialize(EmailValidation constraintAnnotation) {
        this.regexp = constraintAnnotation.regexp();
        this.required = constraintAnnotation.required();
    }
}
