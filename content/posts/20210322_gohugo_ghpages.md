---
title: "How this site is made"
date: 2021-03-22T09:02:00+02:00
weight: 1
# aliases: ["/first"]
tags: ["development", "software", "github", "tech", "hugo", "go", "gohugo"]
author: "Me"
showToc: false
TocOpen: false
draft: false
hidemeta: false
disableShare: true
comments: false
---
I wanted to try `gohugo` for a long time now, as I wanted to do more `go` stuff, even if it is just using it. Also, hugo has quite good benchmarks. (And luckily I need to use some go at work)

Other points I wanted to fulfill:
 - use GitHub pages (static)
 - use `markdown` for editing

and hugo is good for both.

I wanted to use `markdown` because I like to write docs in md, and I don't need an editor for that, I can do it on my phone, or any computer. 
I wanted to track the ideas and posts in progress somewhere, first I had a list in Keep, I tried Trello, and a few other task management apps, ended up with Asana for this, the main factor was it has the best widget on mobile where I can easily see the progress or start editing an idea.  

Hugo has built-in support for Google Analytics so I did not need to struggle too much to see if there is anyone reading this, just register an analytics account and put the id to the hugo config.

I did not have `RSS` at the beginning, marked as a *"next step"* in this post idea. In the meantime, I was asked to have it and hugo again has this built in, so I turned it on with very few modifications.
Other "next step" is to set up Github-actions for this page's deployment. I will publish a step-by-step, fail-by-fail post on that after this one.

### Ok, but wtf is this hugo pls

Hugo is a static site generator. Incredibly fast and lightweight. You write simple md files, you have your static images in a folder. Then you run hugo and it generates the HTML files in an organized structure what you can put on the weakest server and will work.
It has also a development server feature, so if you are not so confident in markdown, you can see your modification locally in less than a second. ![Build time](/images/20210322_gohugo/gohugo_ms.png)

I don't want to go into details on how to install and use it, just go to https://gohugo.io/ and see yourself it is quite straightforward.

### Themes

Other advantages of a good framework: good support, and community. There are a lot of themes to choose from, I wanted something simple and minimalistic, possibly with dark mode, where a simple list of post layout is available and something like a tag cloud too.

You just need to put the theme into the theme folder of your sources and tell hugo the name of the theme (folder of it) at build as a parameter or in the config file. I have it in my sources as a git submodule so it is easy to get the updates too.

## Github pages

You may saw already something.github.io websites. You may already realized you can have one. If not you should check [`https://pages.github.com/`](https://pages.github.com/). The landing page will tell you, you can have a page for every repo with an url like `http://username.github.io/repository` called project site or you can have a user or account site as `http://username.github.io` of course the last one is what we want here. But that means I will waste my username on this blog? It says - and logical by the unique url what needs to match the username - that one repo per account.

It is a bit misleading, what I did here, I created an organization under my main account so this page is `http://organizationname.github.io` and my original username is kept for simple dev showoff, portfolio, or cv.

### How it works

As you see on [https://pages.github.com/](https://pages.github.com/) you just put an index file into that repo and it will be displayed on thet url.
So what I did, based on the guide on the `gohugo` site, is, I added the GH pages repo as a `submodule` into my hugo project where hugo will place the build output namely the `public` folder.
So I write my post, let hugo build it, go to the public folder commit to the submodule and that is it.

## Next steps left

I eliminated github-actions, RSS, and the first most basic own hugo shortcode from this list already.
Yes, when adding the instagram snippets the easiest thing to do was to add raw html and for that I had to create a shortcode (it is one line, 10 characters at all). Also the cookie banner.

 - add a more complex shortcode
 - create an own theme
 - who knows..

..need to find where is the end of the capabilities and maybe I can strech it out a bit with something