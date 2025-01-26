# 🥪 The Jaffle Shop 🦘

This is a sandbox project for exploring the basic functionality and latest features of dbt. It's based on a fictional restaurant called the Jaffle Shop that serves [jaffles](https://en.wikipedia.org/wiki/Pie_iron).

This README will guide you through setting up the project on dbt Cloud. Working through this example should give you a good sense of how dbt Cloud works and what's involved with setting up your own project. We'll also _optionally_ cover some intermediate topics like setting up Environments and Jobs in dbt Cloud, working with a larger dataset, and setting up pre-commit hooks if you'd like.

> [!NOTE]
> This project is geared towards folks learning dbt Cloud with a cloud warehouse. If you're brand new to dbt, we recommend starting with the [dbt Learn](https://learn.getdbt.com/) platform. It's a free, interactive way to learn dbt, and it's a great way to get started if you're new to the tool. If you just want to try dbt locally as quickly as possible without setting up a data warehouse check out [`jaffle_shop_duckdb`](https://github.com/dbt-labs/jaffle_shop_duckdb).

Ready to go? Grab some water and a nice snack, and let's dig in!

<div>
 <a href="https://www.loom.com/share/a90b383eea594a0ea41e91af394b2811?t=0&sid=da832f06-c08e-43e7-acae-a2a3d8d191bd">
   <p>Welcome to the Jaffle Shop - Watch Intro Video</p>
 </a>
 <a href="https://www.loom.com/share/a90b383eea594a0ea41e91af394b2811?t=0&sid=da832f06-c08e-43e7-acae-a2a3d8d191bd">
   <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/a90b383eea594a0ea41e91af394b2811-with-play.gif">
 </a>
</div>

## Table of contents

1. [Prerequisites](#-prerequisites)
2. [Create new repo from template](#-create-new-repo-from-template)
3. [Platform setup](#%EF%B8%8F-platform-setup)
   1. [dbt Cloud IDE](#%EF%B8%8F-dbt-cloud-ide-most-beginner-friendly)
4. [Stage 1](#-stage-1---built-your-first-model)
5. [Stage 2](#-stage-2---change-the-way-your-model-is-materialized)
6. [Stage 3](#-stage-3---built-models-on-top-of-other-models)
7. [Stage 4](#-stage-4---add-tests-to-your-models)
8. [Stage 5](#-stage-5---document-your-models)
9. [Stage 6](#-stage-6---commit-your-changes)
10. [Stage 7](#-stage-7---deploy-dbt)


## 💾 Prerequisites

- A dbt Cloud account via Snowflake Partner Connect, check link in the Guide
- A data Platform Snowflake with adequate permissions to create a fresh database for this project and run dbt in it

## 📓 Create new repo from template

1. <details>
   <summary>Click the green "Use this template" button at the top of the page to create a new repository from this template.</summary>

   ![Click 'Use this template'](/.github/static/use-template.gif)
   </details>

2. Follow the steps to create a new repository. You can choose to only copy the `main` branch for simplicity, or take advantage of the Write-Audit-Publish (WAP) flow we use to maintain the project and copy all branches (which will include `main` and `staging` along with any active feature branches). Either option is fine!

> [!TIP]
> In a setup that follows a WAP flow, you have a `main` branch that serves production data (like downstream dashboards) and is tied to a Production Environment in dbt Cloud, and a `staging` branch that serves a clone of that data and is tied to a Staging Environment in dbt Cloud. You then branch off of `staging` to add new features or fix bugs, and merge back into `staging` when you're done. When you're ready to deploy to production, you merge `staging` into `main`. Staging is meant to be more-or-less a mirror of production, but safe to test breaking changes, so you can verify changes in a production-like environment before deploying them fully. You _write_ to `staging`, _audit_ in `staging`, and _publish_ to `main`.

## 🏗️ Platform setup

1. Go to your Snowflake environment and create a new worksheet. We need to create a new database in Snowflake for the Jaffle Shop project. We recommend using the name `raw` for consistency with the project. Follow the script in the setup folder to start creating the Database, setting the privileges and loading the data from S3 into the tables. If you're not sure how to do this, we recommend checking out the [Quickstart Guide for Snowflake in the dbt Docs](https://docs.getdbt.com/guides/snowflake?step=1).

- **Load the data via S3**. If you'd prefer a larger dataset (6 years instead of 1), and are working via the dbt Cloud IDE and your platform's web interface, you can also copy the data from a public S3 bucket to Snowflake into a schema called `demo` in your `RAW` database. [This is discussed here](#-load-the-data-from-s3).

2. Set up a dbt Cloud account (if you don't have one already, if you do, just create a new project) and follow Step 4 in the [Quickstart Guide for Snowflake](https://docs.getdbt.com/guides/snowflake?step=4), to connect your platform to dbt Cloud. Make sure the user you configure for your connections has [adequate database permissions to run dbt](https://docs.getdbt.com/reference/database-permissions/about-database-permissions) in the `jaffle_shop` database.

3. Choose the repo you created in Step 1 of the **Create new repo from template** section as the repository for your dbt Project's codebase.

<img width="500" alt="Repo selection in dbt Cloud" src="https://github.com/dbt-labs/jaffle-shop/assets/91998347/daac5bbc-097c-4d57-9628-0c85d348e4a4">

### 🏁 Checkpoint

The following should now be done:

- dbt Cloud connected to your warehouse
- Your copy of this repo set up as the codebase
- dbt Cloud and the codebase pointed at a fresh database or project in your warehouse to work in

You're now ready to start developing with dbt Cloud! 

### 😶‍🌫️ dbt Cloud IDE

1. Click `Develop` in the dbt Cloud nav bar. You should be prompted to run a `dbt deps`, which you should do. This will install the dbt packages configured in the `packages.yml` file.

### 🏁 Checkpoint

The following should now be done:

- Synthetic data loaded into your warehouse
- Development environment set up and ready to go
- The project built and tested

Start using the step-by-step Guide to follow the different stages in our Analyticts Project. We will follow the ADLC guidelines to built our dbt Project. The code snippets can be found in the dedicated folders, just follow the stages. Good luck!! 

## 💾 Stage 1 - Built your First Model

Create the Stage Models, check folder Models and subfolder Staging for the code snippets. Built the models via the IDE. 

## 💾 Stage 2 - Change the way your model is materialized

Edit or review your dbt_project.yml file.

## 💾 Stage 3 - Built models on top of other Models

Create the Mart Models, check folder Models and subfolder Marts for the code snippets. Built the models via the IDE. 

## 💾 Stage 4 - Add tests to your models

Run dbt test and validate

## 💾 Stage 5 - Document Your Models

Run dbt docs generate and review the documentation

## 💾 Stage 6 - Commit your changes

Commit your Project!

## 💾 Stage 7 - Deploy dbt

Congratulations 🎉! You've just deployed your first dbt project!





