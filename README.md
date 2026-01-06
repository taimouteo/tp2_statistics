# School Project N°7: Hypothesis test (Subject: Statistical Inference)

Simplified version of the testing process that Netflix uses to accept or reject changes to its platform. You can find more details about this process in this blog post from February 2024. https://netflixtechblog.com/sequential-a-b-testing-keeps-the-world-streaming-netflix-part-1-continuous-data-cba6c7ed49df

Netflix constantly updates its platform and needs to ensure that these updates do not negatively impact the user experience. A critical metric is 'play-delay': the time between a user pressing 'play' and the start of playback.

To prevent new updates from slowing down the site and increasing 'play-delay,' Netflix uses a quality control process: the update is initially deployed to a small group of `n = 200` randomly selected users. If there is a suspicion that the update increases 'play-delay,' it is rejected and sent back to the development team for auditing or rebuilding.

The variability in 'play-delay' among different users depends on many factors: device type, connectivity, time of day, etc. We have historical 'play-delay' data from the previous version (approximately 3,498 data points in this case). This data allows us to have a fairly reasonable estimate of the distribution of the 'play-delay' random variable.

### Testing Policies (quoted from the Netflix blog)

- To minimize harm to users, if there is any issue with the streaming quality experienced by those in the treatment group (the group of users shown the new version), we need to abort the test and roll back the software change as soon as possible.
- This system is part of a semi-automated process. A test with a false positive (that is, a test in which it is erroneously decided that the "play-delay" increased the 'play-delay') unnecessarily hinders the software release process, reducing delivery speed and causing developers to search for non-existent bugs.
