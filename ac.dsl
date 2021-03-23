workspace "All Contributors" "All Contributors Software Architecture." {

    model {
        user = person "User" "A user of our software system."
        devs = person "All Contributors team" "A core member of All Contributors."

        ac = softwareSystem "All Contributors" "System for recognizing contributors to an open source project in a way that rewards each and every contribution." {
            cli = container "CLI" "all-contributors-cli" "Node.js" {
                clinterface = component "CL Interface" "Command Line Interface executable" "Node.js"
                init = component "Init" "Initialise the config" "Node.js"
                contributors = component "Contributors" "Add/update contributors" "Node.js"
                generator = component "Generator" "Table generation" "Node.js"
                discover = component "Discover" "Contributor discovery" "Node.js"
                repo = component "Repo" "GitHub/GitLab adapters" "Node.js"
                util = component "Utils" "Utilities" "Node.js"
            }
            website = container "Website" "Documentation" "Docusaurus" "Web Browser" {
                docs = component "Docs" "Specification/CLI/Bot documentation" "Markdown"
                ws = component "Website" "Documentation" "Docusaurus"
            }
            app = container "App" "GitHub app-driven bot" "Node.js" "Bot" {
                api = component "API" "Source code and GH Webhooks" "Node.js"
                bot = component "Lib" "Library code for the bot" "Node.js"
            }
            lib = container "Library" "Reads/writes configuration and updates markdown text" "Node.js" {
                cfg = component "Configuration Manager" "Read/writes the configuration" "Node.js"
                md = component "Markdown Manager" "Read/writes Markdown files with the resulting table" "Node.js"
            }
            spec = container "Specification" "Contains the emoji key, synonyms and aliases" "JSON/Node.js" {
                ct = component "Contribution Types" "Types and emojis with descriptions" "JSON"
                map = component "Type Mappings" "Plurals, aliases, multi-words mapped to types" "Node.js"
            }
            acl = container "AC-Learn" "Multi-class label classifier" "Node.js" {
                classifier = component "Classifier" "Classification builder" "Node.js"
                learner = component "Learner" "DL model wrapper" "Node.js"
                labels = component "Labels" "Label dataset aggregation" "Node.js/JSON"
                cm = component "Confusion Matrix" "Multi-class focused confusion matrix builder" "Node.js"
            }
        }

        # External
        vercel = softwareSystem "Vercel" "Cloud platform for static sites and serverless functions." "External System"
        netlify = softwareSystem "Netlify" "Cloud-based hosting platform for static sites, web apps and serverless functions." "External System"
        gh = softwareSystem "GitHub" "Code Hosting and VCS" "External System"
        uptimer = softwareSystem "UptimeRobot" "Monitoring." "External System"
        logflare = softwareSystem "Logflare" "Log aggregation." "External System"
        crowdin = softwareSystem "Crowdin" "Cloud-based localization management solution." "External System"
        # External containers
        # probot = container "Probot" "GitHub App framework."
        probot = softwareSystem "Probot" "GitHub App framework." "External Container"
        compromise = softwareSystem "Compromise" "NLP package." "External Container"
        chalk = softwareSystem "Chalk" "Terminal string styler." "External Container"
        yargs = softwareSystem "Yargs" "CLI argument parser and help section generator" "External Container"
        inquirer = softwareSystem "Inquirer" "Collection of common interactive CLIs." "External Container"
        clui = softwareSystem "CLUI" "CL UI toolkit for Node.js." "External Container"
        limdu = softwareSystem "Limdu.js" "ML framework for Node.js" "External Container"
        tvtsplit = softwareSystem "TVT Split" "Dataset splitter into train/validation/test sets" "External Container"
        nclr = softwareSystem "NClr" "Coloured logs (with symbols)" "External Container"
        nyc = softwareSystem "Name Your Contributors" "Package that gets all of the code reviewers, commenters, issue and PR creators from your organization or repo." "External Container"

        clinterface -> init "calls" "`init` command"
        clinterface -> contributors "calls" "`add` command"
        clinterface -> generator "calls" "`generate` command"
        clinterface -> discover "calls" "`fetch` command"
        clinterface -> repo "depends on" "CJS import"
        clinterface -> util "depends on" "CJS import"

        ws -> docs "integrates"

        api -> bot "uses" "CJS import"

        learner -> classifier "uses" "CJS import"
        learner -> labels "uses" "CJS import"
        learner -> cm "uses" "CJS import"

        user -> ac "interacts with"
        devs -> ac "maintain"
        devs -> vercel "monitor"
        user -> cli "uses" "Any terminal"
        user -> website "visits/reads" "Web"
        user -> app "instructs" "GitHub comments via GitHub Events"
        devs -> cli "maintain"
        devs -> website "maintain"
        devs -> app "maintain"
        devs -> lib "maintain"
        devs -> spec "maintain"
        devs -> acl "maintain"


        bot -> md "uses" "CJS import"
        app -> vercel "serviced by" "??"
        api -> gh "listens to" "webhooks"
        bot -> probot "implements" "CJS import"
        bot -> compromise "uses" "CJS import"
        ws -> ct "reads" "??"
        ws -> netlify "hosted on" "??"
        ws -> crowdin "gets translations from" "Java/Yarn"
        util -> md "uses" "CJS import"
        init -> md "uses" "CJS import"
        generator -> md "uses" "CJS import"
        discover -> cfg "uses" "CJS import"
        clinterface -> chalk "depends on" "CJS import"
        clinterface -> yargs "depends on" "CJS import"
        init -> inquirer "uses" "CJS import"
        contributors -> inquirer "uses" "CJS import"
        discover -> clui "uses" "CJS import"
        cli -> nyc "uses" "CJS import"
        learner -> limdu "uses" "CJS import"
        learner -> tvtsplit "uses" "CJS import"
        learner -> nclr "uses" "CJS import"
        learner -> clui "uses" "CJS import"
        learner -> map "uses" "CJS import"
        cfg -> learner "uses" "CJS import"
        cfg -> map "uses" "CJS import"
        md -> cfg "uses" "CJS import"
        map -> ct "uses" "CJS import"
    
        uptimer -> vercel "monitors" "HTTPS"
        logflare -> vercel "listens to" "HTTPS"

        deploymentEnvironment "Production" {
            deploymentNode "User's computer" "WhatGoesHere" "GNU/Linux | Windows | MacOS | *nix" {
                deploymentNode "Web Browser" "User's favourite browser" "Chrome/Firefox/Vivaldi/Opera/Brave/Edge/Safari/..." {
                    prodWebsite = containerInstance website
                }

                deploymentNode "Terminal" "User's favourite terminal" "Any Terminal" {
                    prodCli = containerInstance cli
                }
            }

            deploymentNode "Node Modules" {
                prodLib = containerInstance lib
                prodACL = containerInstance acl
                prodSpec = containerInstance spec
            }

            deploymentNode "Vercel" "" "" {
                prodApp = containerInstance app
            }
        }
    }

    views {
        systemLandscape "SystemLandscape" {
            include *
            autoLayout
        }

        systemContext ac "SystemContext" {
            include *
            /* animation {
              ac
              user
              devs
              vercel
              netlify
              gh
              uptimer
              logflare
              crowdin
            } */
            autoLayout
        }

        container ac "AC_Containers" {
            include *
            /* animation {
                vercel netlify gh uptimer logflare crowdin
                cli
                website
                app
                spec
                lib
                acl
            } */
            autoLayout
        }

        component cli "CLI_components" {
          include *
          autoLayout
        }

        component website "Website_components" {
          include *
          autoLayout
        }

        component app "App_components" {
          include *
          autoLayout
        }

        component lib "Lib_components" {
          include *
          autoLayout
        }

        component acl "AC-Learn_components" {
          include *
          autoLayout
        }

        component spec "Spec_components" {
          include *
          autoLayout
        }

        deployment ac "Production" "ProductionDeployment" {
            include *
            autoLayout
        }


        styles {
            element "Person" {
                background #08427b
                color #ffffff
                fontSize 22
                shape Person
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "External System" {
                background #999999
                color #ffffff
            }
            element "External Container" {
                background #b3b3b3
                color #ffffff
            }
            element "External Component" {
                background #b3b3b3
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
            element "Web Browser" {
                shape WebBrowser
            }
            element "Bot" {
                shape Robot
            }
        }

        branding {
            logo logo-square-transparent.png
        }
    }
}