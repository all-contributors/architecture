workspace "All Contributors" "All Contributors Software Architecture." {

    model {
        user = person "User" "A user of our software system."
        devs = person "All Contributors team" "A core member of All Contributors."
        ac = softwareSystem "All Contributors" "System for recognizing contributors to an open source project in a way that rewards each and every contribution." {
            cli = container "CLI" "all-contributors-cli" "Node.js" {
                clinterface = component "CL Interface" "" "Node.js"
                init = component "Init" "Initialise the config" "Node.js"
                contributors = component "Contributors" "Add/update contributors" "Node.js"
                generator = component "Generator" "Table generation" "Node.js"
                discover = component "Discover" "Contributor discovery" "Node.js"
                repo = component "Repo" "GitHub/GitLab adapters" "Node.js"
                util = component "Utils" "" "Node.js"

                clinterface -> init "calls" "`init` command"
                clinterface -> contributors "calls" "`add` command"
                clinterface -> generator "calls" "`generate` command"
                clinterface -> discover "calls" "`fetch` command"
                clinterface -> repo "depends on" "CJS import"
                clinterface -> util "depends on" "CJS import"
            }
            website = container "Website" "Documentation" "Docusaurus" "Web Browser" {
                docs = component "Docs" "Specification/CLI/Bot documentation" "Markdown"
                ws = component "Website" "Documentation" "Docusaurus"

                ws -> docs "integrates"
            }
            app = container "App" "GitHub app-driven bot" "Node.js{
                api = component "API" "Source code and GH Webhooks" "Node.js"
                bot = component "Lib" "Library code for the bot" "Node.js"

                api -> bot "uses" "CJS import"
            }
            lib = container "Library" "Reads/writes configuration and updates markdown text" "Node.js"
            spec = container "Specification" "Contains the emoji key, synonyms and aliases" "JSON"
            acl = container "AC-Learn" "Multi-class label classifier" "Node.js" {
                classifier = component "Classifier" "Classification builder" "Node.js"
                learner = component "Learner" "DL model wrapper" "Node.js"
                labels = component "Labels" "Label dataset aggregation" "Node.js/JSON"
                cm = component "Confusion Matrix" "Multi-class focused confusion matrix builder" "Node.js"

                learner -> classifier "uses" "CJS import"
                learner -> labels "uses" "CJS import"
                learner -> cm "uses" "CJS import"
            }
        }

        # External
        vercel = softwareSystem "Vercel" "Cloud platform for static sites and serverless functions." "External System"
        netlify = softwareSystem "Netlify" "Cloud-based hosting platform for static sites, web apps and serverless functions." "External System"
        gh = softwareSystem "GitHub" "" "External System"
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

        user -> ac "interacts with"
        devs -> ac "maintain"
        devs -> vercel "monitor"
        bot -> lib "uses" "CJS import"
        app -> vercel "serviced by" "??"
        api -> gh "listens to" "webhooks"
        bot -> probot "implements" "CJS import"
        bot -> compromise "uses" "CJS import"
        ws -> spec "reads" "??"
        ws -> netlify "hosted on" "??"
        ws -> crowdin "gets translations from" "Java/Yarn"
        util -> lib "uses" "CJS import"
        init -> lib "uses" "CJS import"
        generator -> lib "uses" "CJS import"
        discover -> lib "uses" "CJS import"
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
        learner -> spec "reads" "CJS import"
        lib -> learner "uses" "CJS import"
        lib -> spec "reads" "CJS import"
        uptimer -> vercel "monitors" "HTTPS"
        logflare -> vercel "listens to" "HTTPS"
    }

    views {
        systemLandscape "SystemLandscape" {
            include *
            autoLayout
        }

        systemContext ac "SystemContext" {
            include *
            #animation {
            #  ac
            #  user
            #  devs
            #  vercel
            #  netlify
            #  gh
            #  uptimer
            #  logflare
            #  crowdin
            #}
            autoLayout
        }

        container ac "AC_Containers" {
            include *
            #animation {
            #    vercel netlify gh uptimer logflare crowdin
            #    cli
            #    website
            #    app
            #    spec
            #    lib
            #    acl
            #}
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

        styles {
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "External System" {
                background #999999
                color #ffffff
            }
            element "External Container" {
                background #a6a6a6
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Web Browser" {
                shape WebBrowser
            }
        }
    }
}