package org.example.uzum_market.annotations;

import jakarta.validation.Constraint;
import org.example.uzum_market.validator.ValidationHandler;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.FIELD;

@Target( {FIELD, ANNOTATION_TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Constraint(validatedBy = ValidationHandler.class)
public @interface EmailValidation {
    String message() default "Invalid address: Please provide a valid Gmail address.";
    Class<?>[] groups() default {};
    Class<? extends jakarta.validation.Payload>[] payload() default {};
    String regexp() default "^[A-Za-z0-9+_.-]+@gmail\\.com$";
    boolean required() default true;
}
