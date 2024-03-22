# adidas Serenity BDD Archetype

## IMPORTANT NOTE

Test Automation is nothing but just a practice that has to be planned, designed and executed inside a fully structured
Test Process. Before continuing, take some time to familiarize yourself with the adidas testing concepts described in
the [**adidas Testing - Process
Guide**](https://tools.adidas-group.com/confluence/display/DSBP/adidas+Testing+-+Process+Guide).

## Introduction

This project contains the adidas Serenity BDD archetype, our reference project for the adidas Standard Test Automation
framework.

Serenity BDD is a Behaviour-Driven Development framework built on top of Cucumber. If you want to know more about
Serenity BDD, you can find more info here:

- [Serenity BDD](README/SerenityBDD.md).

This project will be useful for you if you are in one or more of these situations:

- You want to develop a **new TAS (Test Automation Solution) for a software development project you are working in**.
- You want to **extend your current TAS and need examples for testing different adidas standard technologies and/or
  integrating your current TAS with the adidas standard toolchain**.
- You want to **contribute to improve, evolve and extend the adidas Standard Test Automation framework**.

We have structured this project documentation based on these situations, providing step by step guidance for all of
them:

- To create a new TAS from this archetype, please go to [Archetype User Guide](README/ArchetypeUserGuide.md)
- To extend or upgrade your current TAS, please go to [Archetype Content Guide](README/ArchetypeContentGuide.md)
- To contribute to this inner-source project, please go to [Contributor Guide](README/ContributorGuide.md)

## General Information

This archetype has been created by the **adidas Platform Engineering - Test Engineering** team. Please, don't hesitate
to contact us for any information or clarification needed.

You can directly contact us through our Microsoft Teams
channel [SUPPORT_TESTING](https://teams.microsoft.com/l/channel/19%3a9887ce8b989549f7ba468c80885926da%40thread.tacv2/SUPPORT_TESTING?groupId=9ebcbabe-a60f-4b1f-bf48-a51d799159f0&tenantId=3bfeb222-e42c-4535-aace-ea6f7751369b)
or via email [pea.test_engineering@adidas.com](mailto:pea.test_engineering@adidas.com).

## Main improvements

These are the main improvements this archetype provides comparing to our previous [**Serenity BDD
Seed**](https://tools.adidas-group.com/bitbucket/projects/TE/repos/seed-tas-serenitybdd-fe-web/browse/README.md).

- We have switched from Gradle to Maven in order to be able to provide a **fully functional archetyped project**. This
  allow our teams to create **clean projects** from scratch, with no need to remove unused dependencies, examples or
  configurations. This also allow our teams to create **customised projects** with just the dependencies and features
  they will need based on the software system architecture and technologies under test.
- Additionally, [**test
  infrastructure**](https://tools.adidas-group.com/confluence/display/GTTTAG/Test+Engineering+-+Infrastructure) has been
  simplified. We will maintain our currently in use test agents, but we can now plan for transitioning into a simplified
  and more efficient testing infrastructure in the future.
- Continuous Integration in Test has been improved and completed. This archetype provides everything needed to manage
  test automation process in a fully automated way; including integration and synchronization with Jira-Xray as Test
  Management tool, Jenkins executions and reporting and complete integration with the [**adidas Test Reporting
  Portal**](https://tools.adidas-group.com/confluence/display/DSBP/Test+Reporting+Portal).
- This project has been designed with an inner-source approach from the beginning. We want all the adidas Testing
  Community to contribute, to improve it, to extend it. Please, help us and the whole community by suggesting and/or
  developing any missing capability you think will help others to test better, quicker and more efficiently. You will
  find detailed information about how to do this in the [**Contributor Guide**](README/ContributorGuide.md).

## Known issues

And of course, there are some issues we have already identified and on our backlog for fixing. You can check detailed
information [here](README/KnownIssues.md).

## API spec download

Tests require the api-specification.json file to be validated. When running your tests in Jenkins, there is a dedicated
stage that will download the api spec in json format from Swagger. But to run test locally you need to manual download
the latest version to your repository root path. You will use
this [url](https://design.api.3stripes.io/apis/adidas/tech-foundation_search_api/0.1.2)
