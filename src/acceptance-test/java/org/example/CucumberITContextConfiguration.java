package org.example;

import io.cucumber.spring.CucumberContextConfiguration;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

@CucumberContextConfiguration
@SpringBootTest(classes = TestChessApplication.class)
@AutoConfigureMockMvc
@ActiveProfiles("local")
public class CucumberITContextConfiguration {
}