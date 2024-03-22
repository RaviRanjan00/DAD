package com.adidas;


import com.adidas.config.Configuration;
import io.cucumber.junit.CucumberOptions;
import net.serenitybdd.cucumber.CucumberWithSerenity;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;


/**
 * TestRunner class
 * <p>
 * Cucumber options default set, change according to your needs
 * Possible tags
 *
 * @regression -> running all tests
 * @TEST_PDM-<TicketNumber> -> Running all tests depends on exact ticket
 * @authorization -> Running all tests depends on authorization flow
 * @authentication -> Running all tests depends on authentication flow
 * @get -> Running tests for all GET requests
 * @post -> Running tests for all POST requests
 * @delete -> Running tests for all DELETE requests
 * @put -> Running tests for all PUT requests
 * @patch -> Running tests for all PATCH requests
 * @accessprivate -> Running tests for all access private token generation requests
 * @mm -> Running tests for all manual mode requests
 */
@RunWith(CucumberWithSerenity.class)
@CucumberOptions(
        plugin = {"pretty", "html:target/cucumber", "json:target/cucumber-report.json"},
        features = {"src/test/resources/features"},
        glue = {"helpers", "com.adidas.serenityDefinitions"},
        tags = "@put"
)
public class TestRunner {

    public TestRunner() {
    }

    @BeforeClass
    public static void setup() {
        Configuration.setup();
    }

    @AfterClass
    public static void tearDown() {
        Configuration.clean_properties();
    }

}
