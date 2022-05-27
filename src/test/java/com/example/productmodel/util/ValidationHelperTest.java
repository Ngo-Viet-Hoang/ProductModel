package com.example.productmodel.util;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ValidationHelperTest {

    @Test
    void validateEmail() {
        assertEquals(true, ValidationHelper.validateEmail("abasd@gmail.com"));
    }

    @Test
    void validateVietnamesePhone() {
        assertEquals(true, ValidationHelper.validatePhone("0346740571"));
    }
}