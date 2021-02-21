workspace "All Contributors" "All Contributors Software Architecture." {

    model {
        user = person "User" "A user of our software system."
        devs = person "All Contributors team" "A core member of All Contributors."
        ac = softwareSystem "All Contributors" "System for recognizing contributors to an open source project in a way that rewards each and every contribution." {
          cli = container "CLI" "all-contributors-cli" "Node.js"
          website = container "Website" "Documentation" "Docusaurus" "Web Browser"
          app = container "App" "GitHub app-driven bot" "Node.js"
          core = container "Core" "Reads/writes configuration, updates markdown text and contains spec and DL model." "Node.js"
        }

        # External
        vercel = softwareSystem "Vercel" "Cloud platform for static sites and serverless functions." "Existing System"
        netlify = softwareSystem "Netlify" "Cloud-based hosting platform for static sites, web apps and serverless functions." "Existing System"
        gh = softwareSystem "GitHub" "" "Existing System"
        uptimer = softwareSystem "UptimeRobot" "Monitoring." "Existing System"
        logflare = softwareSystem "Logflare" "Log aggregation." "Existing System"
        crowdin = softwareSystem "Crowdin" "Cloud-based localization management solution." "Existing System"
        # External containers
        # probot = container "Probot" "GitHub App framework."
        probot = softwareSystem "Probot" "GitHub App framework." "Existing System"
        compromise = softwareSystem "Compromise" "NLP package." "Existing System"
        chalk = softwareSystem "Chalk" "Terminal string styler." "Existing System"
        yargs = softwareSystem "Yargs" "CLI argument parser and help section generator" "Existing System"
        inquirer = softwareSystem "Inquirer" "Collection of common interactive CLIs." "Existing System"
        clui = softwareSystem "CLUI" "CL UI toolkit for Node.js." "Existing System"
        limdu = softwareSystem "Limdu.js" "ML framework for Node.js" "Existing System"
        nyc = softwareSystem "Name Your Contributors" "Package that gets all of the code reviewers, commenters, issue and PR creators from your organization or repo." "Existing System"

        user -> ac "interacts with"
        devs -> ac "maintain"
        devs -> vercel "monitor"
        app -> core "imports methods from" "CJS import"
        app -> vercel "serviced by" ""
        app -> gh "listens to" "webhooks"
        app -> probot "implements" "CJS import"
        app -> compromise "uses" "CJS import"
        website -> core "gets specification from" "CJS import"
        website -> netlify "hosted on" ""
        website -> crowdin "gets translations from" "Java/Yarn"
        cli -> core "imports methods from" "CJS import"
        cli -> chalk "uses" "CJS import"
        cli -> yargs "uses "CJS import"
        cli -> inquirer "uses "CJS import"
        cli -> clui "uses "CJS import"
        cli -> limdu "uses "CJS import"
        cli -> nyc "uses "CJS import"
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
            #    core
            #}
            autoLayout
        }

        component cli "CLI_components" {
          include *
          
          autoLayout
        }
    }
    
}