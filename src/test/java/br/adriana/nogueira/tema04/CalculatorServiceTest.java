package br.adriana.nogueira.tema04;

import br.adriana.nogueira.tema04.exception.InvalidOperationException;
import br.adriana.nogueira.tema04.service.CalculadoraService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

public class CalculatorServiceTest {
    private CalculadoraService service;
    @Test
    void contextLoads() {
    }
    @BeforeEach
    public void setup() {
        service = new CalculadoraService();
    }

    @Test
    public void testSum() {
        Double result = service.sum(2.0, 3.0);
        assertEquals(5.0, result, 0.0001);
    }


    @Test
    public void testSubtract() {
        Double result = service.subtract(5.0, 2.0);
        assertEquals(3.0, result, 0.0001);
    }

    @Test
    public void testMultiply() {
        Double result = service.multiply(2.0, 3.0);
        assertEquals(6.0, result, 0.0001);
    }

    @Test
    public void testDivide() {
        Double result = service.divide(6.0, 2.0);
        assertEquals(3.0, result, 0.0001);
    }

    @Test
    public void testDivideByZero() {
        assertThrows(InvalidOperationException.class, () -> service.divide(6.0, 0.0));
    }

    @Test
    public void testPow() {
        Double result = service.pow(2.0, 3.0);
        assertEquals(8.0, result, 0.0001);
    }

}

