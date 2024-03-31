⚠️ This solution is deprecated along with Atlassian Server ⚠️

# How to configure Atlassian Crowd as SSO for Nextcloud

This repo is meant to serve as a guide to those who need to find *some* way to integrate [Atlassian Crowd](https://www.atlassian.com/software/crowd) with [Nextcloud](https://nextcloud.com/hub/). Apparently, there is no way to do this easily, since Crowd does not support any of the open SSO protocols that Nextcloud offers (yes, SSO software that can't do SSO, go figure). My solution is *not* the right way to solve this problem, it's a duct-tape-and-bubble-gum adapter that was hacked together over a weekend. Use it only if you have no other choice.

You will need system-level access to both Nextcloud and Crowd servers. This guide has two parts: first, [how to setup the Crowd server](crowd/README.md) and then [the Nextcloud one](nextcloud/README.md). Without loss of generality, we will assume those are located on different hosts.
