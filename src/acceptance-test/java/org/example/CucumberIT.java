package org.example;

import io.cucumber.junit.Cucumber;
import org.junit.runner.RunWith;
import io.cucumber.junit.CucumberOptions;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = "src/org/example/acceptance-test/resources",
        plugin = {"json:target/integration_cucumber.json"},
        tags = "not @ignore"
)
public class CucumberIT {
}
